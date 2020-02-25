<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NguoiNhanHang"%>
<%@page import="model.HoaDon"%>
<%@page import="model.NhanVien"%>
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
</head>
<body>
	<%
	NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
	List dsDonHangVaKhachHang = (List)session.getAttribute("DsDonHangVaKhachHang");
	Map<Integer, NhanVien> mapNVGiaoHang = (Map<Integer, NhanVien>)session.getAttribute("MapNVGiaoHang");
	if( mapNVGiaoHang != null && dsDonHangVaKhachHang != null && nhanVien != null ){
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
						<li><a href="/SachKyAnh/KhoXemDonHangChuanBi" class="active"><i class="fa fa-table"></i> Đơn hàng cần chuẩn bị</a></li>
						<li><a href="/SachKyAnh/KhoCapNhatTTDH"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
						<li><a href="/SachKyAnh/KhoNhapSach"><i class="fa fa-edit"></i> Nhập sách</a></li>
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
					<section class="content">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Đơn hàng cần chuẩn bị</p>
							<div class="bang">
								<table class="table table-bordered">
										<thead>
											<tr>
												<th>Mã Đơn Hàng</th>
												<th>Người Nhận</th>
												<th>Nhân Viên Giao Hàng</th>
												<th>Tình Trạng Đơn Hàng</th>
												<th>Ngày Đặt</th>
											</tr>
										</thead>
										<tbody>
											<%
												boolean dhTrongDanhSach = false;
												for(int i=0; i< dsDonHangVaKhachHang.size(); i++){
													Map<String, Object> chiTietDonHang = (Map<String, Object>)dsDonHangVaKhachHang.get(i);
													NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)chiTietDonHang.get("NguoiNhanHang");
													HoaDon hoaDon = (HoaDon)chiTietDonHang.get("HoaDon");
													if (hoaDon != null && nguoiNhanHang != null ){
														if( "Đang chuẩn bị hàng".equals(hoaDon.getTinhTrangDH()) ){
															dhTrongDanhSach = true;
											%>
												<tr>
													<td style="font-weight:bold; ">
														<a href="/SachKyAnh/KhoThongTinDH?SoHD=<%=hoaDon.getSoHD()%>">
															<%=hoaDon.getSoHD() %>
														</a>
													</td>
													<td><%=nguoiNhanHang.getTenNN() %></td>
													<td>
														<%
															NhanVien nhanVienGH = mapNVGiaoHang.get(hoaDon.getMaNVGiao());
															out.print(nhanVienGH.getTenNV());
														%>
													</td>
													<td><%=hoaDon.getTinhTrangDH() %></td>
													<td><%=hoaDon.getNgayDat() %></td>
												</tr>
											<%	
														}
													}else{
														response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
													}
												}
												if( dhTrongDanhSach == false){
											%>
												<tr>
													<td colspan="5" class="alert alert-warning text-center">Không có đơn hàng nào trong danh sách cần chuẩn bị !</td>
												</tr>
											<%
												}
											%>
										</tbody>
									</table>
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