<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NhanVien" %>
<%@page import="model.LoaiSach" %>
<%@page import="model.Sach" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị xem danh sách đơn hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--  bootstrap -->
<link rel="stylesheet" type="text/css" href="${url}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${url}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${url}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!--  kt bootstrap -->
<!--  fontawesome -->
<link rel="stylesheet" href="${url}/static/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- kt fontawesome -->
<!-- my css -->
<link rel="stylesheet" type="text/css" href="${url}/static/css/quantri.css"/>
<!-- kt my css -->
<!-- start my js -->
	<script src="${url}/static/js/kiemTraThemSach.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->
<!-- ckeditor -->
<script type="text/javascript" src="${url}/static/js/ckeditor/ckeditor.js"></script>
<!-- kt ckeditor -->
</head>
<body>
	<%
		NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
			List<LoaiSach> dsLoaiSach = (List<LoaiSach>)session.getAttribute("DsLoaiSach");
			String LoiThemSach = (String)session.getAttribute("LoiThemSach");
			if( nhanVien != null && dsLoaiSach != null){
	%>
	<section class="noidung">
		<div class="container-fluid">
			<div class="row content">
				<div class="col-md-2 col-sm-3 col-xs-12 sidenav nd_left">
					<h2 class="loainv_icon"><li class="fa fa-th-large"></li><span class="loainv"> Nhân viên <%
						if(nhanVien != null) {out.print(nhanVien.getChucVu());}
					%></span></h2>
					<div class="tennv_anh">
						<span class="anh">
							<img class="img-circle" alt="hinhNV" src="${url}/static/img/hinhMacdinh.png">
						</span>
						
						<span class="ten_nv">Xin chào, <br/>
							<span class="ten"><%
								if(nhanVien != null) {out.print(nhanVien.getTenNV());}
							%></span>
						</span>
					</div>
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/SachKyAnh/AdminTrangChu"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="/SachKyAnh/AdminDanhSachDH"><i class="fa fa-table"></i> Danh sách đơn hàng</a></li>
						<li><a href="/SachKyAnh/AdminXuLyDonHang"><i class="fa fa-edit"></i> Xử lý đơn hàng</a></li>
						<li class="menu_cha">
							<a href="/SachKyAnh/AdminCapNhatSach" class="active"><i class="fa fa-book"></i> Cập nhật sách</a>
							<ul class="menu_con">
								<li><a href="/SachKyAnh/AdminCapNhatLoaiSach">Cập nhật loại sách</a></li>
								<li><a href="/SachKyAnh/AdminCapNhatSach">Cập nhật sách</a></li>
							</ul>
						</li>
						<li><a href="/SachKyAnh/AdminCapNhatTaiKhoan"><i class="fa fa-address-book"></i> Cập nhật nhân viên</a></li>
						<li><a href="/SachKyAnh/AdminSuaMatKhau"><i class="fa fa-key"></i> Thay đổi mật khẩu</a></li>
						<li><a href="/SachKyAnh/AdminDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
					</ul>
					<br>
				</div>

				<div class="col-md-10 col-sm-9 col-xs-12 nd_right">
					<header class="col-md-12 col-sm-12 col-xs-12">
						<div class="col-md-4 col-sm-4 col-xs-12 logo">  
							<img alt="logo" src="${url}/static/img/logo/logo.png">
						</div>
						<div class="col-md-8 col-sm-8 col-xs-12 heading">  
							<h3>Trang quản trị</h3>
						</div>
						<hr>
					</header>

				<!-- Phần nội dung chính -->
					<section class="content trang_them_sach">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Thêm sách</p>
							<div class="bang"> 
								<form action="/SachKyAnh/AdminThemSach" method="post" onsubmit="return ktThemSach();" enctype="multipart/form-data" accept-charset="utf-8">
									<table class="table table-bordered">
										<tr>
											<th scope="col">Mã Sách</th>
											<td>
												<input type="text" name="masach" id="masach" class="form-control" placeholder="Mã sách gồm 6 chữ số (VD: SGK011)">
												<span id="errorMaSach" class="col-xs-12 error warning"></span>
												<%
													if( LoiThemSach != null && LoiThemSach.equals("TrungMaSach")){
												%>
													 <span class="col-xs-12 error warning">Mã sách đã tồn tại, vui lòng nhập mã sách khác !</span>
												<%
													session.removeAttribute("LoiThemSach");
																							}
												%>
											</td>
										</tr>
										<tr>
											<th>Tên Sách</th>
											<td>
												<input type="text" name="tensach" id="tensach" class="form-control" placeholder="Vui lòng nhập tên sách">
												<span id="errorTenSach" class="col-xs-12 error warning"></span>
											</td>
										</tr>
										<tr>
											<th>Đơn Giá (vnđ)</th>
											<td>
												<input type="number" name="dongia" id="dongia" class="form-control" placeholder="Vui lòng nhập đơn giá (VD: 15000)">
												<span id="errorDonGia" class="col-xs-12 error warning"></span>
											</td>
										</tr>
										<tr>
											<th>Hình Ảnh</th>
											<td>
												<input type="file" name="urlhinh" id="urlhinh">
												<span id="errorHinhAnh" class="col-xs-12 error warning"></span>
												<%
													if( LoiThemSach != null && LoiThemSach.equals("TrungHinhAnh")){
												%>
													 <span class="col-xs-12 error warning">Tên hình ảnh đã tồn tại, vui lòng đổi tên hình !</span>
												<%
													session.removeAttribute("LoiThemSach");
																							}
												%>
											</td>
										</tr>
										<tr>
											<th>Nội Dung</th>
											<td>
												<textarea name="noidungsach" id="noidungsach"></textarea>
												<span id="errorNoiDung" class="col-xs-12 error warning"></span>
												<script type="text/javascript">
													CKEDITOR.replace('noidungsach');
												</script>
											</td>
										</tr>
										<tr>
											<th>Tác Giả</th>
											<td>
												<input type="text" name="tacgia" id="tacgia" class="form-control" placeholder="Nhập tên tác giả (VD: Nguyễn Nhật Ánh)">
												<span id="errorTacGia" class="col-xs-12 error warning"></span>
											</td>
										</tr>
										<tr>
											<th>Năm Xuất Bản</th>
											<td>
												<input type="number" name="namxuatban" id="namxuatban" class="form-control" placeholder="Nhập năm xuất bản (VD: 2019)">
												<span id="errorNamXB" class="col-xs-12 error warning"></span>
											</td>
										</tr>
										<tr>
											<th>Nhà Xuất Bản</th>
											<td>
												<input type="text" name="nxb" id="nxb" class="form-control" placeholder="Nhập tên nhà xuất bản (VD: Đà Nẵng)">
												<span id="errorNXB" class="col-xs-12 error warning"></span>
											</td>
										</tr>
										<tr>
											<th>Loại Sách</th>
											<td>
												<select name="maloaisach" id="maloaisach" class="form-control">
													<%
														for(LoaiSach loaiSach: dsLoaiSach){
													%>
														<option value="<%=loaiSach.getMaLoaiSach()%>"><%=loaiSach.getTenLoaiSach()%></option>
													<%
													}
													%>
												</select>
											</td>
										</tr>
									</table>
									<div class="text-center">
										<button type="submit" class="btn btn-default">Thêm Sách</button>
									</div>
								</form>
							</div>
						</div>
					</section>
				<!-- kt phần nội dung chính -->

					<jsp:include page="_admin_footer.jsp" />
				</div>
			</div>
		</div>
	</section>	
	<%
	}
	else{
		response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
	}
	%>
</body>
</html>