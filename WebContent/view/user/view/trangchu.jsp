<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Sach" %>
<%@ page import="model.LoaiSach" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBook - Trang chủ</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--  bootstrap -->
<link rel="stylesheet" type="text/css" href="${url}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="${url}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${url}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!--  kt bootstrap -->
<!--  fontawesome -->
<link rel="stylesheet" href="${url}/static/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- kt fontawesome -->
<!-- start facebook -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=2525119214214430&autoLogAppEvents=1"></script>
<!-- end facebook -->
<!-- my css -->
<link rel="stylesheet" type="text/css" href="${url}/static/css/trangchu.css"/>
<!-- kt my css -->

</head>
<body>
	<div class="wrapper">
		<!-- header  -->
		<jsp:include page="block/header_tc.jsp" />
		<!-- kt header  -->

		<!-- phần nội dung trang -->
		<section class="main">
			<div class="container">
				<!-- phần danh sách sản phẩm main -->
				<section class="danhsach_sp_main">
					<div class="row sachNoiBat_SachMoi">
						<!-- phần bên trái -->
						<div class="col-md-3 col-sm-12 col-xs-12 left_main padding-left0">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12 top-lefft-list-sp">
									<div class="top_sp_cungloai">
										<h2>
											<span class="text">
												Sách nổi bật
											</a> 
										</h2>
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12 group-lefft-list-sp">
									<div class="col-md-12 col-sm-6 col-xs-12 padding-0 grid_group_sp">
										<%
											List<Sach> sachNoiBat = (List<Sach>)application.getAttribute("SachNoiBat");
																			Sach sach1 = sachNoiBat.get(0);
										%>
											<!-- sản phẩm 1 -->
											<div class="col-md-12 col-sm-6 col-xs-12 padding-0">
												<div class="group_sp my_border">
													<div class="anh_sp">
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach1.getMaSach()%>" class="">
															<img class="anh" src="${url}/static/img/sanpham/<%=sach1.getUrlHinh() %>" title="sp" alt="anhsp">
															<%
																int soLuongDB;
																												Map<String, Object> gioHang = (Map)session.getAttribute("GioHang");
																												if( gioHang== null ){
																													soLuongDB = sach1.getSoLuong();
																												}
																												else{
																													Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																													if( danhSachChiTietGioHang.get(sach1.getMaSach())== null ){
																														soLuongDB = sach1.getSoLuong();
																													}
																													else{
																														Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sach1.getMaSach());
																														soLuongDB = chiTiet.get("SoLuongDB");
																														if(soLuongDB > sach1.getSoLuong()){
																															soLuongDB = sach1.getSoLuong();
																														}
																													}
																												}
																												if(soLuongDB >= 1){
															%>
																<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sach1.getMaSach()%>&SoLuong=1" class="them_gh text-a" >
																	<span class="glyphicon glyphicon-shopping-cart"></span>
																	<span class="text"> Thêm vào giỏ</span>
																</a>
															<%
																}
															%>
														</a>
													</div>
													<div class="tensp_giasp">
														<h3 class="tensp">
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach1.getMaSach()%>" class="text-a">
																<%=sach1.getTenSach()%>
															</a>
														</h3>	
														<div class="giasp">
															<span class="gia_goc">
																<%
																	NumberFormat numberFormat = new DecimalFormat("###,###,###");
																															out.print(numberFormat.format(sach1.getDonGia()));
																%> đ
															</span>
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach1.getMaSach()%>" class="chi_tiet">
																Chi Tiết
															</a>
														</div>
													</div>
												</div>
											</div>
											<!-- kt sản phẩm 1 -->
											<%
												Sach sach2 = sachNoiBat.get(1);
											%>
											<!-- sản phẩm 2 -->
											<div class="col-md-12 col-sm-6 col-xs-12 padding-0 margin_top_10">
												<div class="group_sp my_border">
													<div class="anh_sp">
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach2.getMaSach()%>" class="">
															<img class="anh" src="${url}/static/img/sanpham/<%=sach2.getUrlHinh() %>" title="sp" alt="anhsp">
															<%
																if( gioHang== null ){
																													soLuongDB = sach2.getSoLuong();
																												}
																												else{
																													Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																													if( danhSachChiTietGioHang.get(sach2.getMaSach())== null ){
																														soLuongDB = sach2.getSoLuong();
																													}
																													else{
																														Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sach2.getMaSach());
																														soLuongDB = chiTiet.get("SoLuongDB");
																														if(soLuongDB > sach2.getSoLuong()){
																															soLuongDB = sach2.getSoLuong();
																														}
																													}
																												}
																												if(soLuongDB >= 1){
															%>
																<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sach2.getMaSach()%>&SoLuong=1" class="them_gh text-a" >
																	<span class="glyphicon glyphicon-shopping-cart"></span>
																	<span class="text"> Thêm vào giỏ</span>
																</a>
															<%
																}
															%>
														</a>
													</div>
													<div class="tensp_giasp">
														<h3 class="tensp">
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach2.getMaSach()%>" class="text-a">
																<%=sach2.getTenSach()%>
															</a>
														</h3>	
														<div class="giasp">
															<span class="gia_goc">
																<%
																	out.print(numberFormat.format(sach2.getDonGia()));
																%> đ
															</span>
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach2.getMaSach()%>" class="chi_tiet">
																Chi Tiết
															</a>
														</div>
													</div>
												</div>
											</div>
											<!-- kt sản phẩm 2 -->
									</div>
								</div>
							</div>
						</div>
						<!-- kt phần bên trái -->
						<!-- phần bên phải -->
						<div class="col-md-9 col-sm-12 col-xs-12 right_main padding-0">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12 top-right-list-sp">
									<div class="top_sp_cungloai">
										<h2>
											<span class="text">
												Sách mới
											</a> 
										</h2>
									</div>
								</div>
								
									<%!List<Sach> sachMoi;%>
									<%
										sachMoi = (List<Sach>)application.getAttribute("SachMoi");
									%>
								<div class="col-md-12 col-sm-12 col-xs-12 group-right-list-sp">
									<%
										for(int i = 0; i < 4; i++)
																	{
																		Sach sach = sachMoi.get(i);
									%>
									<!-- sản phẩm  -->
									<div class="col-md-3 col-sm-3 col-xs-12 padding-0 grid_group_sp">
										<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
											<div class="group_sp my_border">
												<div class="anh_sp">
													<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach()%>" class="">
														<img class="anh" src="${url}/static/img/sanpham/<%=sach.getUrlHinh() %>" title="sp" alt="anhsp">
														<%
															if( gioHang== null ){
																											soLuongDB = sach.getSoLuong();
																										}
																										else{
																											Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																											if( danhSachChiTietGioHang.get(sach.getMaSach())== null ){
																												soLuongDB = sach.getSoLuong();
																											}
																											else{
																												Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sach.getMaSach());
																												soLuongDB = chiTiet.get("SoLuongDB");
																												if(soLuongDB > sach.getSoLuong()){
																													soLuongDB = sach.getSoLuong();
																												}
																											}
																										}
																										if(soLuongDB >= 1){
														%>
															<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sach.getMaSach()%>&SoLuong=1" class="them_gh text-a" >
																<span class="glyphicon glyphicon-shopping-cart"></span>
																<span class="text"> Thêm vào giỏ</span>
															</a>
														<%
															}
														%>
													</a>
												</div>
												<div class="tensp_giasp">
													<h3 class="tensp">
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach()%>" class="text-a">
															<%=sach.getTenSach()%>
														</a>
													</h3>	
													<div class="giasp">
														<span class="gia_goc">
															<%
																out.print(numberFormat.format(sach.getDonGia()));
															%> đ
														</span>
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach()%>" class="chi_tiet">
															Chi Tiết
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- kt sản phẩm  -->
									<%
										}
									%>
								</div>
					
								<div class="col-md-12 col-sm-12 col-xs-12 group-right-list-sp">
									<%
										for(int i = 4; i < sachMoi.size(); i++)
																	{
																		Sach sach = sachMoi.get(i);
									%>
									<!-- sản phẩm  -->
									<div class="col-md-3 col-sm-3 col-xs-12 padding-0 grid_group_sp">
											<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
												<div class="group_sp my_border">
													<div class="anh_sp">
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach()%>" class="">
															<img class="anh" src="${url}/static/img/sanpham/<%=sach.getUrlHinh() %>" title="sp" alt="anhsp">
															<%
																if( gioHang== null ){
																													soLuongDB = sach.getSoLuong();
																												}
																												else{
																													Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																													if( danhSachChiTietGioHang.get(sach.getMaSach())== null ){
																														soLuongDB = sach.getSoLuong();
																													}
																													else{
																														Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sach.getMaSach());
																														soLuongDB = chiTiet.get("SoLuongDB");
																														if(soLuongDB > sach.getSoLuong()){
																															soLuongDB = sach.getSoLuong();
																														}
																													}
																												}
																												if(soLuongDB >= 1){
															%>
																<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sach.getMaSach()%>&SoLuong=1" class="them_gh text-a">
																	<span class="glyphicon glyphicon-shopping-cart"></span>
																	<span class="text"> Thêm vào giỏ</span>
																</a>
															<%
																}
															%>
														</a>
													</div>
													<div class="tensp_giasp">
														<h3 class="tensp">
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach()%>" class="text-a">
																<%=sach.getTenSach()%>
															</a>
														</h3>	
														<div class="giasp">
															<span class="gia_goc">
																<%
																	out.print(numberFormat.format(sach.getDonGia()));
																%> đ
															</span>
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach()%>" class="chi_tiet">
																Chi Tiết
															</a>
														</div>
													</div>
												</div>
											</div>
									</div>
									<!-- kt sản phẩm  -->
									<%
										}
									%>
								</div>
							</div>
						</div>
						<!-- kt phần bên phải -->
					</div>
				</section>
				<!-- kt phần danh sách sản phẩm main -->
				
				<!-- phần banner bottom -->
				<article class="row banner_bottom">
					<div class="container">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12 padding-left0">
								<a href="SachTheoLoaiSach?MaLoaiSach=LS05" class="hinh_bottom">
									<img class="hinh" src="${url}/static/img/banner/banner_bottom1.png">
								</a>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 padding-right0">
								<a href="SachTheoLoaiSach?MaLoaiSach=LS03" class="hinh_bottom">
									<img class="hinh" src="${url}/static/img/banner/banner_bottom2.png">
								</a>
							</div>
						</div>
					</div>
				</article>
				<!-- kt phần banner bottom -->
				
				<!-- phần danh sách sản phẩm bottom -->
				<section class="danhsach_sp_bottom">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12 padding-0 top-list-sp">
								<div class="top_sp_cungloai">
									<%
									LoaiSach loaiSachVanHoc = (LoaiSach)application.getAttribute("LoaiSachVanHoc");
									%>
									<h2>
										<a href="SachTheoLoaiSach?MaLoaiSach=<%=loaiSachVanHoc.getMaLoaiSach() %>" class="text-a">
											<%=loaiSachVanHoc.getTenLoaiSach() %>
										</a> 
									</h2>
								</div>
							</div>
							<% 
								Map<Integer, List<Sach>> dsSachTheoLoaiSach = (Map<Integer,List<Sach>>)application.getAttribute("SachTheoLoaiSach");
							%>
							<div class="col-md-12 col-sm-12 col-xs-12 padding-0 group-list-sp">
								<!-- phần 1: banner svh, sp -->
									<div class="col-md-6 col-sm-12 col-xs-12 padding-0">
										<!-- phần banner sách văn học -->
										<div class="col-md-6 col-sm-6 col-xs-12 padding-0 banner_bottom">
											<a href="SachTheoLoaiSach?MaLoaiSach=LS06" class="hinh_svh">
												<img class="hinh" src="${url}/static/img/banner/banner_svh.jpg">
											</a>
										</div>
										<!-- kt phần banner sách văn học -->
										<!-- phần sản phẩm  -->
										<div class="col-md-6 col-sm-6 col-xs-12 padding-0 grid_group_sp">
											<%
												if(dsSachTheoLoaiSach != null && dsSachTheoLoaiSach.size()> 0 ){
													for(int i = 0; i < 2; i++)
													{	
														List<Sach> dsSach = dsSachTheoLoaiSach.get(i);
														Sach sachDau = dsSach.get(0);
											%>
												<!-- sản phẩm -->
												<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
													<div class="group_sp">
														<div class="anh_sp my_border">
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="">
																<img class="anh" src="${url}/static/img/sanpham/<%=sachDau.getUrlHinh() %>" title="sp" alt="anhsp">
																<%
																if( gioHang== null ){
																	soLuongDB = sachDau.getSoLuong();
																}
																else{
																	Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																	if( danhSachChiTietGioHang.get(sachDau.getMaSach())== null ){
																		soLuongDB = sachDau.getSoLuong();
																	}
																	else{
																		Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sachDau.getMaSach());
																		soLuongDB = chiTiet.get("SoLuongDB");
																		if(soLuongDB > sachDau.getSoLuong()){
																			soLuongDB = sachDau.getSoLuong();
																		}
																	}
																}
																if(soLuongDB >= 1){
																%>
																	<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sachDau.getMaSach() %>&SoLuong=1" class="them_gh text-a" >
																		<span class="glyphicon glyphicon-shopping-cart"></span>
																		<span class="text"> Thêm vào giỏ</span>
																	</a>
																<%
																}
																%>
															</a>
														</div>
														<div class="tensp_giasp">
															<h3 class="tensp">
																<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="text-a">
																	<%=sachDau.getTenSach() %>
																</a>
															</h3>	
															<div class="giasp">
																<span class="gia_goc">
																	<%
																		out.print(numberFormat.format(sachDau.getDonGia()));
																	%> đ
																</span>
																<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="chi_tiet">
																	Chi Tiết
																</a>
															</div>
														</div>
													</div>
												</div>
												<!-- kt sản phẩm -->
											<%
												}
											%>
										</div>
										<!-- kt phần sản phẩm  -->
									</div>
								<!-- kt phần 1: banner svh, sp -->
								<!-- phần 2: 4sp -->
									<div class="col-md-6 col-sm-12 col-xs-12 padding-0">
										<!-- phần sản phẩm  -->
										<div class="col-md-6 col-sm-6 col-xs-12 padding-0 grid_group_sp">
											<%
												for(int i = 2; i < 4; i++)
												{
													List<Sach> dsSach = dsSachTheoLoaiSach.get(i);
													Sach sachDau = dsSach.get(0);
											%>
											<!-- sản phẩm -->
											<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
												<div class="group_sp ">
													<div class="anh_sp my_border">
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="">
															<img class="anh" src="${url}/static/img/sanpham/<%=sachDau.getUrlHinh() %>" title="sp" alt="anhsp">
															<%
															if( gioHang== null ){
																soLuongDB = sachDau.getSoLuong();
															}
															else{
																Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																if( danhSachChiTietGioHang.get(sachDau.getMaSach())== null ){
																	soLuongDB = sachDau.getSoLuong();
																}
																else{
																	Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sachDau.getMaSach());
																	soLuongDB = chiTiet.get("SoLuongDB");
																	if(soLuongDB > sachDau.getSoLuong()){
																		soLuongDB = sachDau.getSoLuong();
																	}
																}
															}
															if(soLuongDB >= 1){
															%>
																<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sachDau.getMaSach() %>&SoLuong=1" class="them_gh text-a" >
																	<span class="glyphicon glyphicon-shopping-cart"></span>
																	<span class="text"> Thêm vào giỏ</span>
																</a>
															<%
															}
															%>
														</a>
													</div>
													<div class="tensp_giasp">
														<h3 class="tensp">
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="text-a">
																<%=sachDau.getTenSach() %>
															</a>
														</h3>	
														<div class="giasp">
															<span class="gia_goc">
																<%
																	out.print(numberFormat.format(sachDau.getDonGia()));
																%> đ
															</span>
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="chi_tiet">
																Chi Tiết
															</a>
														</div>
													</div>
												</div>
											</div>
											<!-- kt sản phẩm -->
											<%
												}
											%>
										</div>
										<!-- kt phần sản phẩm  -->
										
										<!-- phần sản phẩm  -->
										<div class="col-md-6 col-sm-6 col-xs-12 padding-0 grid_group_sp">
											<%
												for(int i = 4; i < 6; i++)
												{
													List<Sach> dsSach = dsSachTheoLoaiSach.get(i);
													Sach sachDau = dsSach.get(0);
											%>
											<!-- sản phẩm -->
											<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
												<div class="group_sp ">
													<div class="anh_sp my_border">
														<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="">
															<img class="anh" src="${url}/static/img/sanpham/<%=sachDau.getUrlHinh() %>" title="sp" alt="anhsp">
															<%
															if( gioHang== null ){
																soLuongDB = sachDau.getSoLuong();
															}
															else{
																Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
																if( danhSachChiTietGioHang.get(sachDau.getMaSach())== null ){
																	soLuongDB = sachDau.getSoLuong();
																}
																else{
																	Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sachDau.getMaSach());
																	soLuongDB = chiTiet.get("SoLuongDB");
																	if(soLuongDB > sachDau.getSoLuong()){
																		soLuongDB = sachDau.getSoLuong();
																	}
																}
															}
															if(soLuongDB >= 1){
															%>
																<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sachDau.getMaSach() %>&SoLuong=1" class="them_gh text-a" >
																	<span class="glyphicon glyphicon-shopping-cart"></span>
																	<span class="text"> Thêm vào giỏ</span>
																</a>
															<%
															}
															%>
														</a>
													</div>
													<div class="tensp_giasp">
														<h3 class="tensp">
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="text-a">
																<%=sachDau.getTenSach() %>
															</a>
														</h3>	
														<div class="giasp">
															<span class="gia_goc">
																<%
																	out.print(numberFormat.format(sachDau.getDonGia()));
																%> đ
															</span>
															<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="chi_tiet">
																Chi Tiết
															</a>
														</div>
													</div>
												</div>
											</div>
											<!-- kt sản phẩm -->
											<%
													}
												}
											%>
										</div>
										<!-- kt phần sản phẩm  -->
									</div>
									<!-- kt phần 2: 4sp -->
							</div>
						</div>
				</section>
				<!-- kt phần danh sách sản phẩm bottom -->				
			</div>
		</section>
		<!-- kt phần nội dung trang "main"-->

		<!-- footer  -->
		<jsp:include page="block/footer.jsp" />
		<!-- kt footer  -->
	</div>


	<!-- start my js -->
	<script src="${url}/static/js/slide.js" type="text/javascript" charset="utf-8"></script>
	<!-- end my js -->
</body>
</html>