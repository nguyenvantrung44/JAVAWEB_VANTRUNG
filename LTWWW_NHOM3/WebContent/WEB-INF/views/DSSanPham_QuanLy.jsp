<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<head>
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
<title>Danh sách sản phẩm</title>
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
		<!-- _header.jsp  -->
		<div>
			<jsp:include page="_header.jsp"></jsp:include>
		</div>
		
		<jsp:include page="menuadmin.jsp"></jsp:include>
		
	<div class="container form-text">
		<div class="row">
			<div class="col-sm-12">
				<h1>Danh sách Sản Phẩm</h1>
			</div>
			<div class="col-sm-12">
				<table>
					<tr>
						<th>Mã sản phẩm</th>
						<th>Tên sản phẩm</th>
						<th>Mô tả</th>
						<th>Ngày sản xuất</th>
						<th>Đơn vị tính</th>
						<th>Đơn giá</th>
						<th>Số lượng nhập</th>
						<th>Tên danh mục</th>
						<th>Tên nhà cung cấp</th>
						<th>EDIT</th>
						<th>DELETE</th>

					</tr>
					<c:forEach items="${listSanPham }" var="sp">
						<tr>
							<td>${sp.maSanPham }</td>
							<td>${sp.tenSanPham }</td>
							<td>${sp.moTa }</td>
							<td>${sp.ngaySanXuat }</td>
							<td>${sp.donViTinh }</td>
							<td><span class="product_price"> <fmt:setLocale
															value="vi_VN" /> <fmt:formatNumber value="${sp.donGia}"
															type="currency" />
													</span></td>
							<td>${sp.soLuongNhap }</td>
							<td>${sp.danhMuc.tenDanhMuc }</td>
							<td>${sp.nhaCungCap.tenNhaCungCap }</td>
							<td><a href="formSuaSanPham?txtidsua=${sp.maSanPham }">Edit</a></td>
							<td><a href="xoaSanPham?txtidxoa=${sp.maSanPham }">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</body>

</html>