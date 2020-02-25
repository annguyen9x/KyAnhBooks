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
		String dsDonHangChon = (String)session.getAttribute("DsDonHangChon");
		if( dsDonHangChon == null ){
			dsDonHangChon = "Đang giao hàng";
		}
		
		if( dsDonHangVaKhachHang != null && nhanVien != null ){
			int demDHMoi= 0;
			for(int i=0; i< dsDonHangVaKhachHang.size(); i++){
				Map<String, Object> chiTietDonHang = (Map<String, Object>)dsDonHangVaKhachHang.get(i);
				HoaDon hoaDon = (HoaDon)chiTietDonHang.get("HoaDon");
				if( "Đợi người giao lấy hàng".equals(hoaDon.getTinhTrangDH()) ){
					demDHMoi ++;
				}
			}
		
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
						<li><a href="/SachKyAnh/GiaoHangTrangChu" class="active"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="/SachKyAnh/GiaoHangXemDonHangGiao"><i class="fa fa-table"></i> Đơn hàng cần giao</a></li>
						<li><a href="/SachKyAnh/GiaoHangCapNhatTTDH"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
						<li><a href="/SachKyAnh/GiaoHangCapNhatTaiKhoan"><i class="fa fa-address-book"></i> Cập nhật tài khoản</a></li>
						<li><a href="/SachKyAnh/GiaoHangDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
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
						<div class="canh_bao">
							<h3 class="tieude_canhbao">Đơn hàng cần giao !</h3>
							<%
								if( demDHMoi > 0){
							%>
								<div class="alert alert-danger">
									<strong>Có <span><%=demDHMoi %></span> đơn hàng mới.</strong> Vui lòng giao hàng ngay !
								</div>
							<%
								}
								else{
							%>	
								<div class="alert alert-success">
									<strong>Không có đơn hàng nào mới.</strong> Tất cả đơn hàng đang được giao !
								</div>
							<%
								}
							%>
						</div>
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Danh sách đơn hàng</p>
							<div class="tim_kiem">
								<form action="/SachKyAnh/GiaoHangTrangChu" method="post" accept-charset="utf-8">
									<div class="col-md-4 col-sm-5 col-xs-12 col-md-offset-3 col-md-offset-3" style="padding:0px; ">
										<select name="DsDonHangChon" class="form-control">
											<%
												if( dsDonHangChon.equals("Đợi người giao lấy hàng") ){
											%>
												<option value="Đợi người giao lấy hàng" selected="selected">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Giao hàng thành công">Giao hàng thành công</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
											<%
												}
												else if( dsDonHangChon.equals("Đang giao hàng") ){
											%>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng" selected="selected">Đang giao hàng</option>
												<option value="Giao hàng thành công">Giao hàng thành công</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
											<%
												}
												else if( dsDonHangChon.equals("Giao hàng thành công") ){
											%>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Giao hàng thành công" selected="selected">Giao hàng thành công</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
											<%
												}
												else if( dsDonHangChon.equals("Trả lại hàng") ){
											%>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Giao hàng thành công">Giao hàng thành công</option>
												<option value="Trả lại hàng" selected="selected">Trả lại hàng</option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-md-2 col-sm-3 col-xs-12" style="padding:0px; ">
										<button type="submit" class="btn">Xem danh sách</button>
									</div>
								</form>
							</div>
							<div class="bang">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Mã Đơn Hàng</th>
											<th>Người Nhận</th>
											<th>Ngày Đặt</th>
											<th>Tình Trạng Đơn Hàng</th>
											<th>Chi Tiết</th>
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
													if( dsDonHangChon.equals(hoaDon.getTinhTrangDH()) ){
														dhTrongDanhSach = true;
										%>
											<tr>
												<td style="font-weight:bold; "><%=hoaDon.getSoHD() %></td>
												<td><%=nguoiNhanHang.getTenNN() %></td>
												<td><%=hoaDon.getNgayDat() %></td>
												<td><%=hoaDon.getTinhTrangDH() %></td>
												<td><a href="/SachKyAnh/GiaoHangThongTinDH?SoHD=<%=hoaDon.getSoHD()%>">Xem chi tiết</a></td>
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
												<td colspan="5" class="alert alert-warning text-center">Không có đơn hàng nào trong danh sách !</td>
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