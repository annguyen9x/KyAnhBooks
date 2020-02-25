<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NhanVien" %>
<%@page import="model.HoaDon" %>
<%@page import="model.NguoiNhanHang" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị xử lý đơn hàng</title>
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
		List<NhanVien> dsNhanVienGiaoHang = (List<NhanVien>)session.getAttribute("DsNhanVienGiaoHang");
		if( dsDonHangVaKhachHang != null && dsNhanVienGiaoHang != null && nhanVien != null ){
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
						<li><a href="/SachKyAnh/AdminTrangChu"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="/SachKyAnh/AdminDanhSachDH"><i class="fa fa-table"></i> Danh sách đơn hàng</a></li>
						<li><a href="/SachKyAnh/AdminXuLyDonHang"  class="active"><i class="fa fa-edit"></i> Xử lý đơn hàng</a></li>
						<li class="menu_cha">
							<a href="/SachKyAnh/AdminCapNhatSach"><i class="fa fa-book"></i> Cập nhật sách</a>
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
					<section class="content trang_xl_donhang">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Đơn hàng cần xử lý</p>
							<div class="bang">
								<%
									String TrangThaiXuLy = (String)session.getAttribute("TrangThaiXuLy");
									if(TrangThaiXuLy != null){
										List DsDHXLloi = (List)session.getAttribute("DsDHXLloi");
										if( DsDHXLloi != null ){
								%>
											<div class="alert alert-danger">
												<p><strong>Xử lý đơn hàng bị lỗi.</strong> Các đơn hàng xử lý bị lỗi là: </p>
												<%
													for(int i=0; i< DsDHXLloi.size(); i++){
														out.print(DsDHXLloi.get(i)+",");
													}
												%>
											</div>
								<%			
											session.removeAttribute("DsDHXLloi");
										}
										else{
								%>	
											<div class="alert alert-success">
												<p><strong>Xử lý đơn hàng thành công !</strong></p>
											</div>
								<%		
										}
										session.removeAttribute("TrangThaiXuLy");
									}
								%>
								<form action="/SachKyAnh/AdminXuLyDonHang" method="post" accept-charset="utf-8">
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
														if( "Đợi xác nhận đơn hàng".equals(hoaDon.getTinhTrangDH()) ){
															dhTrongDanhSach = true;
											%>
											<tr>
												<td style="font-weight:bold; ">
													<a href="/SachKyAnh/AdminThongTinDH?SoHD=<%=hoaDon.getSoHD()%>"><%=hoaDon.getSoHD()%></a>
												</td>
												<td><%=nguoiNhanHang.getTenNN() %></td>
												<td>
													<select name="NVGiaoHang" class="form-control">
														<option value="-1">...</option>
														<%
														for(int j=0; j< dsNhanVienGiaoHang.size(); j++){
															NhanVien nv = dsNhanVienGiaoHang.get(j);
														%>
															<option value="<%=nv.getMaNV()%>"><%=nv.getTenNV() %></option>
														<%
														}
														%>
													</select>
													<input type="hidden" name="SoHD" value="<%=hoaDon.getSoHD()%>">
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
													<td colspan="5" class="alert alert-warning text-center">Tất cả đơn hàng đã được xử lý !</td>
												</tr>
											<%
												}
											%>
										</tbody>
									</table>
									<div class="nut">
										<a class="btn btn-default" href="/SachKyAnh/AdminTrangChu">Thoát</a>
										<button type="submit" class="btn mybtn">Lưu xử lý</button>
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