<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NguoiNhanHang"%>
<%@page import="model.HoaDon"%>
<%@page import="model.NhanVien"%>
<%@page import="model.Sach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị</title>
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
	<script src="${url}/static/js/kiemTraNhapSach.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->
</head>
<body>
	<%
	NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
	List<Sach> dsSach = (List<Sach>)session.getAttribute("DsSach");
	String KetQuaNhapSach = (String)session.getAttribute("KetQuaNhapSach");
	if( nhanVien != null && dsSach != null ){
	%>
	<section class="noidung">
		<div class="container-fluid">
			<div class="row content">
				<div class="col-md-2 col-sm-3 col-xs-12 sidenav nd_left">
					<h2 class="loainv_icon"><li class="fa fa-th-large"></li><span class="loainv"> Nhân viên <% if(nhanVien != null) {out.print(nhanVien.getChucVu());} %></span></h2>
					<div class="tennv_anh">
						<span class="anh">
							<img class="img-circle" alt="hinhNV" src="${url}/static/img/hinhMacdinh.png">
						</span>
						
						<span class="ten_nv">Xin chào, <br/>
							<span class="ten"><% if(nhanVien != null) {out.print(nhanVien.getTenNV());} %></span>
						</span>
					</div>
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/SachKyAnh/KhoTrangChu"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="/SachKyAnh/KhoXemDonHangChuanBi"><i class="fa fa-table"></i> Đơn hàng cần chuẩn bị</a></li>
						<li><a href="/SachKyAnh/KhoCapNhatTTDH"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
						<li><a href="/SachKyAnh/KhoNhapSach" class="active"><i class="fa fa-edit"></i> Nhập sách</a></li>
						<li><a href="/SachKyAnh/KhoCapNhatTaiKhoan"><i class="fa fa-address-book"></i> Cập nhật tài khoản</a></li>
						<li><a href="/SachKyAnh/KhoDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
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
					<section class="content trang_nhap_sach">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Nhập sách</p>
							<div class="bang">
								<%
									if( KetQuaNhapSach != null && KetQuaNhapSach.equals("ThanhCong")){
								%>
									<div class="col-xs-12 alert alert-success">
										<p><strong>Nhập sách thành công.</strong> Số lượng sách đã được cập nhật !</p>			
									</div>
								<%
										session.removeAttribute("KetQuaNhapSach");
									}
								%>
								<form action="/SachKyAnh/KhoNhapSach" method="post"  onsubmit="return ktNhapSach();" accept-charset="utf-8">
									<table class="table table-bordered">
										<tr>
											<th scope="col">Mã Nhập</th>
											<td>
												<input type="text" name="manhapsach" id="manhapsach" class="form-control" placeholder="Mã nhập sách gồm 6 chữ số (VD: NS0011)">
												<span id="errorMaNhapSach" class="col-xs-12 error warning"></span>
												<%
													if( KetQuaNhapSach != null && KetQuaNhapSach.equals("TrungMaNS")){
												%>
													 <span class="col-xs-12 error warning">Mã nhập sách đã tồn tại, vui lòng nhập mã khác !</span>
												<%
														session.removeAttribute("KetQuaNhapSach");
													}
												%>
											</td>
										</tr>
										<tr>
											<th>Mã Sách</th>
											<td>
												<select name="masach" id="masach" class="form-control">
												<%
													for(Sach sach: dsSach){
												%>
													<option value="<%=sach.getMaSach()%>"><%=sach.getMaSach()%></option>
												<%
													}
												%>
												</select>
											</td>
										</tr>
										<tr>
											<th>Số lượng</th>
											<td>
												<input type="number" name="soluong" id="soluong" class="form-control" placeholder="Vui lòng nhập số lượng">
												<span id="errorSoLuong" class="col-xs-12 error warning"></span>
											</td>
										</tr>
										<tr>
											<th>Ngày nhập</th>
											<td>
												<input type="date" name="ngaynhap" id="ngaynhap" class="form-control">
												<span id="errorNgayNhap" class="col-xs-12 error warning"></span>
											</td>
										</tr>
									</table>
									<div class="nut" style="text-align:center;">
										<button type="submit" class="btn mybtn" style="background:#F47920; color:#fff;">Lưu</button>
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