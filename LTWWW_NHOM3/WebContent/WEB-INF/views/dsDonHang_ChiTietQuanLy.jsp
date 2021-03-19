<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lí đơn hàng</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<c:url value="css/fontawesome-free-5.13.0-web/css/all.css"/>"
	rel='stylesheet' type='text/css' />
<link href="<c:url value="css/bootstrap.min.css"/>" rel='stylesheet'
	type='text/css' />
<link href="<c:url value="css/bootstrap.css"/>" rel='stylesheet'
	type='text/css' />
<script src="<c:url value="js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="js/bootstrap.min.js" />"></script>
<link href="<c:url value="css/css.css"/>" rel='stylesheet'
	type='text/css' />
</head>
<body>
	<input type="hidden" value="${tk.tenTaiKhoan }" name="tenTaiKhoan">
	<c:set var="tentk" value="${tk.tenTaiKhoan }" scope="session"></c:set>
	<div class="container-fluid">
		<div class="topheader">
			<div class="row">
				<div class="col-md-4" id="navbar-header">
					<c:if test="${tentk==null}">
						<ul>
							<li><a href="dangnhap"><span>Đăng nhập</span></a></li>
							<li><a href="formdangki"><span>Đăng ký</span></a></li>
						</ul>

					</c:if>
					<c:if test="${tentk!=null}">
						<ul>
							<li><a href="dangnhap"><span>Xin Chào
										${tk.tenTaiKhoan } </span></a></li>
							<li><a href="dangxuat"><span>Đăng Xuất</span></a></li>
						</ul>
					</c:if>
				</div>

			</div>
		</div>
		<div>
			<jsp:include page="_header.jsp"></jsp:include>
		</div>
		
		<jsp:include page="menuadmin.jsp"></jsp:include>
		<div class="container form-text">
			<div class="row">
				<div class="col-sm-10">
					<h1>Chi Tiết Đơn Hàng</h1>
				</div>
				<div class="col-sm-12">
					<table>
						<tr>
							<th>Mã đơn hàng</th>
							<th>Mã sản phẩm</th>
							<th>Đơn giá</th>
							<th>Số lượng</th>

						</tr>
						<c:forEach items="${listChiTiet }" var="sp">
							<tr>
								<td>${sp.chiTietDonHangID.maDonHangID }</td>
								<td>${sp.sanPham.maSanPham }</td>
								<td>${sp.donGia }</td>
								<td>${sp.soLuong }</td>
							</tr>
							<tr>
								<td colspan="2"><a href="dsDonHang">Quay lại</a></td>
								<td colspan="2"> <a href="giaoDienSuaChiTiet?maDonHangChinh=${listChiTiet.get(0).donHang.maDonHang }">Chỉnh sửa số lượng</a>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
</body>
</html>