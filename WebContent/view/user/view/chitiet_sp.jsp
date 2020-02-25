<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@ page import="javax.servlet.http.HttpUtils.*" %>
<%@page import="model.Sach" %>
<%@page import="model.LoaiSach" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chi tiết sản phẩm</title>
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
		<!-- phần header  -->
		<jsp:include page="block/header.jsp" />
		<!-- kt header  -->
		
		<!-- phần nội dung sản phẩm -->
		<section class="main_chitiet_sp main_center">
			<div class="container">
				<div class="row">
				<%
					List<Sach> dsSach = (List<Sach>)request.getAttribute("DsSachCungTen");
							Sach sachDau = dsSach.get(0);
							
							LoaiSach loaiSach = (LoaiSach)request.getAttribute("LoaiSach");
							
							int soLuongDB;
							Map<String, Object> gioHang = (Map)session.getAttribute("GioHang");
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
				%>
					<!-- phần top -->
					<div class="col-md-12 col-sm-12 col-xs-12 padding-0 top_nd_trang">
						<div class="top">
							<h2>
								<a href="/SachKyAnh/SachTheoLoaiSach?MaLoaiSach=<%=loaiSach.getMaLoaiSach() %>" class="text-a"><%=loaiSach.getTenLoaiSach() %> </a>
								<span class="glyphicon glyphicon-chevron-right"></span>
								<a href="#"  class="text-a"> <%=sachDau.getTenSach() %> </a>
								<span class="glyphicon glyphicon-chevron-right"></span> Chi tiết sản phẩm
							</h2>
						</div>
					</div>
					<!-- kt phần top -->
					<!-- phần nội dung trang -->
					<div class="col-md-12 col-sm-12 col-xs-12 padding-0 nd_trang">
						<div class="row margin-0 my_border">
							<!-- left: phần chi tiết sách -->
							<div class="col-md-8 col-sm-8 col-xs-12 padding-0">
								<section class="left">
									<div class="col-md-12 col-sm-12 col-xs-12 padding-0 top_left">
							 			<div class="col-md-5 col-sm-6 col-xs-12 padding-0 anh">
							 				<div class="anh_sp">
												 <img class="" src="${url}/static/img/sanpham/<%=sachDau.getUrlHinh() %>" title="sp" alt="anhsp">
											</div>
							 			</div>
							 			<div class="col-md-7 col-sm-6 col-xs-12 padding-0 ten_gia_tg_sl">
							 				<div class="ten_gia">
								 				<h3 class="tensp">
														<%=sachDau.getTenSach() %>
												</h3>	
												<div class="theloai_giasp">
													<p>
														Thể loại: <span class="loai_sach"><%=loaiSach.getTenLoaiSach() %></span>
													</p>
													<p>
														Tình trạng: <span class="trang_thai">
														<%
															if(soLuongDB > 0){
																out.print("Còn hàng");
															}else{
																out.print("Hết hàng");
															}
														%></span>
													</p>
													<p>
														<%
															for(int i = 0; i < dsSach.size(); i++){
																Sach sach = dsSach.get(i);
														%>
															<div id="<%=sach.getNamXB() %>" class="giaban">
																Giá bán:
																<span class="gia_sp">
																<%
																	NumberFormat numberFormat = new DecimalFormat("###,###,###");
																	out.print(numberFormat.format(sach.getDonGia())); 
																%> đ
																</span>
															</div>
														<%
															}
														%>
													</p>
												</div>
											</div>
											<div class="tg_nxb">
												<p class="tab">
													<span class="tieude">Năm xuất bản: </span>
													<%
														for(int i = 0; i < dsSach.size(); i++){
															Sach sach = dsSach.get(i);
															if(i == 0 ){
													%>
														<button id="hienthiMacDinh" onclick="giaVaMaSachTheoNamXB(event,'<%=sach.getNamXB() %>', '<%=sach.getMaSach() %>')" class="nam_xb"><%=sach.getNamXB() %></button>
													<%
															}else{
													%>
														<button onclick="giaVaMaSachTheoNamXB(event,'<%=sach.getNamXB() %>', '<%=sach.getMaSach() %>')" class="nam_xb"><%=sach.getNamXB() %></button>
													<%
															}
														}
													%>
												</p>
												<p>
													<span class="tieude">Nhà xuất bản: </span><span class="nxb"><%=sachDau.getnXB() %></span>
												</p>
												<p>
													<span class="tieude">Tác giả: </span><span class="tac_gia"><%=sachDau.getTacGia() %></span>
												</p>
											</div>
											<div class="sl_button">
												<form method="get" action="/SachKyAnh/ThemSachVaoGioHang" onsubmit="return ktSoLuongMua('<%=soLuongDB %>', '<%=sachDau.getTenSach() %>');" id="formChiTietSP">
												 	<span class="label_sl">Số lượng: </span>
													<input type='number' name='SoLuong' value='1' class="sl_mua"><br/> 
													<input type='hidden' name='DuongDan' value='<%= request.getServletPath() %>'><br/> 
													<div class="col-md-12 col-sm-12 col-xs-12 padding-0 nut">
														<div class="col-md-3 col-sm-4 col-xs-4 padding-0 margin_right">
															<a href="/SachKyAnh/userTrangChu" class="">
																<button type="button" class="btn btn-default">
																	<span class="thoat">Thoát</span>
																</button>
															</a>
														</div>
														<div class="col-md-8 col-sm-8 col-xs-8 padding-0">
															<button type="submit" class="btn bg_btn">Thêm vào giỏ hàng</button>
														</div>
													</div>
											 	</form> 
											</div>
							 			</div>
							 		</div>
							 		<div class="col-md-12 col-sm-12 col-xs-12 padding-0 bottom_leff">
						 				<div class="tieude_gt">
						 					<h3>Giới thiệu sách</h3>
						 				</div>	
						 				<div class="nd_gt my_border">
						 					<%=sachDau.getNoiDung() %>
						 					<p><strong>KyAnhBooks trân trọng giới thiệu !</strong></p>
						 				</div>
							 		</div>
							 		<!-- kt gioithieu -->
							 		<!-- phần facebook hỏi đáp thảo luận -->
							 		<div class="col-md-12 col-sm-12 col-xs-12 padding-0 bottom_leff_facebook">
						 				<div class="top">
						 					<div class="tieude">
						 						Hỏi đáp, thảo luận
						 					</div>
						 				</div>	
						 				<div class="fb-comments" data-href="http://sachvui.com/ebook/tu-hoc-tieng-anh-hieu-qua-nguyen-thi-ha-bac.4121.html" data-width="100%" data-numposts="3"></div>
						 			</div>
						 			<!-- phần facebook hỏi đáp thảo luận -->
							 	</section>
							</div>
							<!-- kt left: phần chi tiết sách -->
							<!-- right: phần hoTroKH_sachNoiBat -->
							<div class="col-md-4 col-sm-4 col-xs-12 padding-0">
								<article class="row  margin-0 right">
									<jsp:include page="block/hotrokh_sachnoibat.jsp"/>
								</article>
							</div>
							<!-- kt right: phần hoTroKH_spCungloai -->
						</div>
					</div>
					<!-- kt phần nội dung trang -->
				</div>
			</div>
		</section>
		<!-- kt phần nội dung sản phẩm -->

		<!-- phần footer  -->
		<jsp:include page="block/footer.jsp" />
		<!-- kt footer  -->

		<!-- start my js -->
		<script src="${url}/static/js/giaSanPhamVaMaSachTheoNamXB.js" type="text/javascript" charset="utf-8"></script>
		<script src="${url}/static/js/kiemTraSoLuongMua.js" type="text/javascript" charset="utf-8"></script>
		<!-- end my js -->
	</div>
</body>
</html>