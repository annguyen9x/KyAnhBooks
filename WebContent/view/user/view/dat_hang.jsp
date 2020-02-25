<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@page import="model.KhachHang"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đặt hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--  start bootstrap -->
<link rel="stylesheet" type="text/css" href="${url}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="${url}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${url}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!--  end bootstrap -->
<!-- start fontawesome -->
<link rel="stylesheet" href="${url}/static/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- start fontawesome -->
<!-- start facebook -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=2525119214214430&autoLogAppEvents=1"></script>
<!-- end facebook -->
<!-- start my css -->
<link rel="stylesheet" type="text/css" href="${url}/static/css/trangchu.css"/>
<!-- end my css -->
<!-- start my js -->
	<script src="${url}/static/js/menuAnHien.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->

</head>
<body>
<div class="wrapper">
	<!-- header  -->
	<jsp:include page="block/header.jsp" />
	<!-- kt header  -->
	
	<section class="main_center main_sp_cungloai">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 padding-0 main_title_line">
					<!-- phần top -->
					<div class="col-md-12 padding-0 top_nd_trang">
						<div class="top">
							<h2>
								<span>Đặt hàng</span>
							</h2>
						</div>
					</div>
					<!-- kt phần top -->
					
					<%
						Map<String, Object> gioHang = (Map<String,Object>) session.getAttribute("GioHang");
						Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>) gioHang.get("DanhSachChiTietGioHang");
						Iterator iterator = danhSachChiTietGioHang.entrySet().iterator();
						NumberFormat numberFormat = new DecimalFormat("###,###,###,###");
						
						KhachHang khachHangSession = (KhachHang)session.getAttribute("TaiKhoan");
						
						String trangThaiDangNhap = "chuaDN";
						if( khachHangSession != null){
							trangThaiDangNhap = "DaDN";
						}
					%>
					<!-- phần nội dung trang -->
					<div class="col-md-12 padding-0 nd_trang">
						<div class="row margin-0">
							<!-- noi dung dat hang -->
							<section class="dat_hang">
								<form action="/SachKyAnh/DatHang" method="post" onsubmit="return ktDiaChiGiaoHang('<%=trangThaiDangNhap %>');" id="datHang" class="form_dathang">
									<div class="col-md-4 col-xs-12 col-xs-12 padding-0 chon_diachi">
										<h5>1. Loại tài khoản giao hàng</h5>
										<div class="noi_dung my_border">
											<p>Chọn tài khoản giao hàng</p>
											<input onclick="diaChiGiaoHangTheoLoaiTaiKhoan('event','dangky')" id="loaitk_dangky" type="radio" name="loai_taikhoan" value="dangky"> Địa chỉ tài khoản đã đăng ký<br/>
											<input onclick="diaChiGiaoHangTheoLoaiTaiKhoan('event','nguoikhac')" id="loaitk_nguoikhac" type="radio" name="loai_taikhoan" value="nguoikhac" checked="checked"> Giao hàng địa chỉ khác<br/>
										</div>
									</div>
									<div class="col-md-4 col-xs-12 col-xs-12 padding-0 chitiet_diachi">
										<h5>2. Thông tin địa chỉ giao hàng</h5>
										<div class="noi_dung my_border">
											<p>Thông tin giao hàng</p>
											<div class="thongtin_giaohang" id="dangky">
												<p style="text-transform: none; font-weight:normal;">&quot;Địa chỉ tài khoản đã đăng ký&quot;</p>
												<%
													if( khachHangSession != null ){
												%>
													<div class="form-group">
														<label for="hoten">Họ tên: </label>
														<%=khachHangSession.getTenKH() %>
													</div>
													
													<div class="form-group">
														<label for="dt">Điện thoại: </label>
														<%=khachHangSession.getDienThoai() %>
													</div>
													<div class="form-group">
														<label for="dc">Địa chỉ: </label>
														<%=khachHangSession.getDiaChi() %>
													</div>
												<%
													}else{
												%>
													<p style="text-transform: none; font-weight:normal;">Bạn chưa đăng nhập. Xin mời <a href="/SachKyAnh/userDangNhap">đăng nhập</a> vào tài khoản trước !</p>
												<%
													}
												%>
											</div>
											<div class="thongtin_giaohang" id="nguoikhac">
												<p style="text-transform: none; font-weight:normal;">&quot;Giao hàng địa chỉ khác&quot;</p>
												<%
													if( khachHangSession != null ){
												%>
												<div class="form-group">
													<label for="hoten">Họ tên</label>
													<input class="form-control" type="text" name="ten2" id="hoten2" placeholder="Họ & tên">
													<span id="errorHoten2" class="error"></span>
												</div>
												
												<div class="form-group">
													<label for="dt">Điện thoại</label>
													<input class="form-control" type="number" name="dienthoai2" id="dienthoai2" placeholder="Số điện thoại">
													<span id="errorDienthoai2" class="error"></span>
												</div>
												<div class="form-group">
													<label for="dc">Địa chỉ</label>
													<input class="form-control" type="text" name="diachi2" id="diachi2" placeholder="Địa chỉ">
													<span id="errorDiachi2" class="error"></span>
												</div>
												<%
													}else{
												%>
													<p style="text-transform: none; font-weight:normal;">Bạn chưa đăng nhập. Xin mời <a href="/SachKyAnh/userDangNhap">đăng nhập</a> vào tài khoản trước !</p>
												<%
													}
												%>
											</div>
										</div>
									</div>
									<div class="col-md-4 col-xs-12 col-xs-12 padding-0 thongtin_donhang">
										<h5>3. Thông tin đơn hàng</h5>
										<div class="noi_dung my_border">
											<table class="table">
												<%
												float tongTien = 0;
												while(iterator.hasNext()){
													Map.Entry mapEntry = (Map.Entry)iterator.next();
													Map<String, Object> chiTietGioHang = (Map<String, Object>)mapEntry.getValue();
												%>
													<tr>
														<td class="hinh">
															<img src="${url}/static/img/sanpham/<%=chiTietGioHang.get("UrlHinh") %>" alt="anhsp">
														</td>
														<td class="tensp">
															<%=chiTietGioHang.get("TenSach") %> <span style="color:#F47920; font-weight:bold;">x</span> <span><%=chiTietGioHang.get("SoLuong") %></span>
														</td>
														<td class="tien" style="white-space:nowrap; text-overflow: ellipsis;">
															<%=numberFormat.format( (int)chiTietGioHang.get("SoLuong")*(float)chiTietGioHang.get("DonGia") ) %>
															<span class="text_underline"> đ</span>
														</td>
													</tr>
												<%
													tongTien += (int)chiTietGioHang.get("SoLuong")*(float)chiTietGioHang.get("DonGia");
												}
												%>
												<tr class="tong_tien">
													<td colspan="2">
														<b>Tổng tiền: </b>
													</td>
													<td class="tien" style="white-space:nowrap; text-overflow: ellipsis;">
														<b><%=numberFormat.format(tongTien) %> <span class="text_underline">đ</span></b>
														<%
															gioHang.put("TongTien", tongTien);
														%>
													</td>
												</tr>
											</table>
											<button type="submit" class="btn">Đặt hàng</button>
										</div>
									</div>
								</form>
						 	</section>
						 	<!-- kt noi dung dat hang -->
						</div>
					</div>
					<!-- kt phần nội dung trang -->
				</div>
			</div>
		</div>
	</section>

	<!-- footer  -->
	<jsp:include page="block/footer.jsp" />
	<!-- kt footer  -->
</div>
	<!-- start my js -->
		<script src="${url}/static/js/diaChiGiaoHangTheoLoaiTaiKhoan.js" type="text/javascript" charset="utf-8"></script>
		<script src="${url}/static/js/kiemTraDiaChiGiaoHang.js" type="text/javascript" charset="utf-8"></script>
	<!-- end my js -->
</body>
</html>