<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="model.HoaDon" %>
<%@page import="model.NguoiNhanHang"%>
<%@page import="model.Sach" %>
<%@page import="model.ChiTietHoaDon" %>
<%@page import="model.NhanVien"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>
<c:url var="urlSanPham" value="/view/user"></c:url>

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
</head>
<body>
	<%
		NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
		if( nhanVien != null ){
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
						<li><a href="/SachKyAnh/AdminXuLyDonHang"><i class="fa fa-edit"></i> Xử lý đơn hàng</a></li>
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
					<section class="content trang_thong_tin_dh">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Thông tin chi tiết đơn hàng</p>
							
							<!-- Thông tin đơn hàng -->
							<div class="bang">
								<%
									Map<String, Object> thongTinDonHang = (HashMap<String, Object>)session.getAttribute("ThongTinDonHang");
									if( thongTinDonHang != null && thongTinDonHang.size() > 0 ){
											HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
											NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)thongTinDonHang.get("NguoiNhanHang");
											
											List<HashMap> dsChiTietHoaDonBan = (List<HashMap>)thongTinDonHang.get("DanhSachChiTietHoaDon");
											NumberFormat numberFormat = new DecimalFormat("###,###,###");
								%>
								<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom:7px; padding:0px; margin-top:-20px;">
									<span style="font-weight:bold;">Mã ĐH: </span><span><%=hoaDon.getSoHD() %></span>
								</div>
								<!-- Chi tiết Đh -->
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>
											Tên sách
											</th>
											<th>
											Hình ảnh
											</th>
											<th>
											Giá
											</th>
											<th>
											Số lượng
											</th>
											<th>
											Thành tiền
											</th>
										</tr>
									</thead>
									<tbody>
										<%
											for(int i = 0; i < dsChiTietHoaDonBan.size() ; i++){
												Map mapSachVaChiTiet = dsChiTietHoaDonBan.get(i);
												ChiTietHoaDon chiTietHoaDon = (ChiTietHoaDon)mapSachVaChiTiet.get("ChiTietHoaDon");
												Sach sach = (Sach)mapSachVaChiTiet.get("Sach");
										%>
												<tr>
													<td class="ten_sp">
													<%=sach.getTenSach() %>
													</td>
													<td class="hinh">
														<img src="${urlSanPham}/static/img/sanpham/<%=sach.getUrlHinh() %>" alt="anh">
													</td>
													<td class="tien">
														<%=numberFormat.format(chiTietHoaDon.getDonGia()) %> <span class="text_underline">đ</span>
													</td>
													<td class="so_luong">
														<%=chiTietHoaDon.getSoLuong() %>
													</td>
													<td class="tien">
														<%=numberFormat.format(chiTietHoaDon.getDonGia()*chiTietHoaDon.getSoLuong()) %> <span class="text_underline">đ</span>
													</td>
												</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<!-- kt chi tiết Đh -->
								<!-- thong tin Nguoi Nhan -->
								<div class="thongtin_giaohang_tongtien">
									<div class="tong_tien">
										<b>Tổng tiền: </b>
										<span class="tien">
											<%=numberFormat.format(hoaDon.getTongTien()) %> <span class="text_underline">đ</span>
										</span>
									</div>
									<div class="thongtin_giaohang">
										<h4 class="text-center">Thông tin giao hàng</h4>
										<table class="table">
											<tr>
												<td>
													<b>Tên người nhận: </b><%=nguoiNhanHang.getTenNN() %>
												</td>
												<td>
													<b>Ngày đặt: </b>
													<%
														SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
														out.print( simpleDateFormat.format(hoaDon.getNgayDat()) );
													%>
												</td>
											</tr>
											<tr>
												<td>
													<b>Số điện thoại: </b><%=nguoiNhanHang.getDienThoai() %>
												</td>
												<td>
													<%
														if( hoaDon.getNgayGiao() == null ){
															Date ngayDat = hoaDon.getNgayDat();
															
									            			Calendar calendar = Calendar.getInstance();
									            			calendar.setTime(ngayDat);
									            			calendar.add(Calendar.DAY_OF_MONTH, 3);
									            			
									            			String ngayGiao = simpleDateFormat.format(calendar.getTime());
									            			
															out.print("<b>Ngày giao (dự kiến): </b>" +  ngayGiao);
														}else{
															String ngayGiao = simpleDateFormat.format(hoaDon.getNgayGiao());
															out.print("<b>Ngày giao: </b>" + ngayGiao);
														}
													%>
												</td>
											</tr>
											<tr>
												<td>
													<b>Địa chỉ: </b><%=nguoiNhanHang.getDiaChi() %>	
												</td>
												<td>
													<b>Tình trạng đơn hàng: </b><%=hoaDon.getTinhTrangDH() %>
												</td>
											</tr>
										</table>
									</div>
								</div><!-- kt thong tin Nguoi Nhan -->
								<%
									}
									else{
										response.sendRedirect("/SachKyAnh/view/admin/view/admin_trangchu.jsp");
									}
								%>
						</div><!-- Thông tin đơn hàng -->
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