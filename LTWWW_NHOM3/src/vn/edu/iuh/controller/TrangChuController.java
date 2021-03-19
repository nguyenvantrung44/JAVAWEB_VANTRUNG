package vn.edu.iuh.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.edu.iuh.cartbeans.GioHang;
import vn.edu.iuh.daoImpl.SanPhamDAOImpl;
import vn.edu.iuh.daoImpl.TaiKhoanDAOImpl;
import vn.edu.iuh.model.SanPham;
import vn.edu.iuh.model.TaiKhoan;
import vn.edu.iuh.service.ChiTietDonHangService;
import vn.edu.iuh.service.DanhMucService;
import vn.edu.iuh.service.DonHangService;
import vn.edu.iuh.service.KhachHangService;
import vn.edu.iuh.service.NguoiQuanLyService;
import vn.edu.iuh.service.NhaCungCapService;
import vn.edu.iuh.service.SanPhamService;
import vn.edu.iuh.service.TaiKhoanService;

@Transactional
@Controller
public class TrangChuController {
	@Autowired(required = true)
	@Qualifier(value = "chiTietDonHangService")
	private ChiTietDonHangService chiTietDonHangService;
	@Autowired(required = true)
	@Qualifier(value = "danhMucService")
	private DanhMucService danhMucService;
	@Autowired(required = true)
	@Qualifier(value = "donHangService")
	private DonHangService donHangService;
	@Autowired(required = true)
	@Qualifier(value = "khachHangService")
	private KhachHangService khachHangService;
	@Autowired(required = true)
	@Qualifier(value = "nguoiQuanLyService")
	private NguoiQuanLyService nguoiQuanLyService;
	@Autowired(required = true)
	@Qualifier(value = "nhaCungCapService")
	private NhaCungCapService nhaCungCapService;
	@Autowired(required = true)
	@Qualifier(value = "sanPhamService")
	private SanPhamService sanPhamService;
	@Autowired(required = true)
	@Qualifier(value = "taiKhoanService")
	private TaiKhoanService taiKhoanService;

	// setter
	public void setChiTietDonHangService(ChiTietDonHangService chiTietDonHangService) {
		this.chiTietDonHangService = chiTietDonHangService;
	}

	public void setDanhMucService(DanhMucService danhMucService) {
		this.danhMucService = danhMucService;
	}

	public void setDonHangService(DonHangService donHangService) {
		this.donHangService = donHangService;
	}

	public void setKhachHangService(KhachHangService khachHangService) {
		this.khachHangService = khachHangService;
	}

	public void setNguoiQuanLyService(NguoiQuanLyService nguoiQuanLyService) {
		this.nguoiQuanLyService = nguoiQuanLyService;
	}

	public void setNhaCungCapService(NhaCungCapService nhaCungCapService) {
		this.nhaCungCapService = nhaCungCapService;
	}

	public void setSanPhamService(SanPhamService sanPhamService) {
		this.sanPhamService = sanPhamService;
	}

	public void setTaiKhoanService(TaiKhoanService taiKhoanService) {
		this.taiKhoanService = taiKhoanService;
	}

	@RequestMapping(value = { "/trangchu", "/", "/tatcasanpham" }, method = RequestMethod.GET)
	public String trangChu(Model model, Model model2, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		GioHang gioHang = null;
		Object objGioHang = session.getAttribute("cart"); // Lấy cart từ jsp

		if (objGioHang != null) {
			gioHang = (GioHang) objGioHang;
		} else {
			gioHang = new GioHang();
			session.setAttribute("cart", gioHang);
		}
		model.addAttribute("listSanPham", sanPhamService.getAllSanPham());
		model2.addAttribute("listDanhMuc", danhMucService.getAllDanhMuc());
		return "TrangChuView";
	}
	@RequestMapping(value = { "/gioithieu"}, method = RequestMethod.GET)
	public String gioithieu(Model model, Model model2, HttpServletRequest request, HttpServletResponse response) {
		return "gioithieu";
	}
	@RequestMapping(value = { "/tintuc"}, method = RequestMethod.GET)
	public String tintuc(Model model, Model model2, HttpServletRequest request, HttpServletResponse response) {
		return "tintuc";
	}
	@RequestMapping(value = { "/lienhe"}, method = RequestMethod.GET)
	public String lienhe(Model model, Model model2, HttpServletRequest request, HttpServletResponse response) {
		return "lienhe";
	}
	
	@RequestMapping(value = "/giohang", method = RequestMethod.GET)
	public String showGioHang(Model model) {
		return "ChiTietDonHangView";
	}

	@RequestMapping(value = "/timkiem")
	public String showFormTimKiem(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String tenSanPham = request.getParameter("timkiem");
		List<SanPham> list = sanPhamService.getSanPhamByten(tenSanPham);
		request.setAttribute("listSanPham", list);
		request.setAttribute("tukhoa", tenSanPham);
		return "ListKetQuaTimKiemView";
	}

	@RequestMapping(value = "/honda")
	public String showListAoThun(Model model, Model model2) {
		List<SanPham> list = sanPhamService.getSanPhamByDanhMucByTen("Xe Đạp Điện Honda");
		model.addAttribute("listSanPham", list);
		model2.addAttribute("danhmuc", "Xe Đạp Điện Honda");
		return "ListMenuSanPhamView";
	}

	@RequestMapping(value = "/yamaha")
	public String showListAoPhong(Model model, Model model2) {
		List<SanPham> list = sanPhamService.getSanPhamByDanhMucByTen("Xe Đạp Điện Yamaha");
		model.addAttribute("listSanPham", list);
		model2.addAttribute("danhmuc", "Xe Đạp Điện Yamaha");
		return "ListMenuSanPhamView";
	}

	@RequestMapping(value = "/dkbike")
	public String showListAoSoMi(Model model, Model model2) {
		List<SanPham> list = sanPhamService.getSanPhamByDanhMucByTen("Xe Đạp Điện DK Bike");
		model.addAttribute("listSanPham", list);
		model2.addAttribute("danhmuc", "Xe Đạp Điện DK Bike");
		return "ListMenuSanPhamView";
	}

	@RequestMapping(value = "/hitasa")
	public String showListCocTay(Model model, Model model2) {
		List<SanPham> list = sanPhamService.getSanPhamByDanhMucByTen("Xe Đạp Điện Hitasa");
		model.addAttribute("listSanPham", list);
		model2.addAttribute("danhmuc", "Xe Đạp Điện Hitasa");
		return "ListMenuSanPhamView";
	}

	@RequestMapping(value = "/hkbike")
	public String showListQuanJean(Model model, Model model2) {
		List<SanPham> list = sanPhamService.getSanPhamByDanhMucByTen("Xe Đạp Điện HkBike");
		model.addAttribute("listSanPham", list);
		model2.addAttribute("danhmuc", "Xe Đạp Điện HkBike");
		return "ListMenuSanPhamView";
	}
	
}
