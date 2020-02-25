<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.List" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="model.Sach" %>
<%@page import="model.LoaiSach" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBook - Sản phẩm cùng loại</title>
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
		<!-- phần header  -->
		<jsp:include page="block/header.jsp" />
		<!-- kt header  -->
		
		<!-- phần nội dung sản phẩm -->
		<section class="main_sp_cungloai main_center">
			<div class="container">
				<div class="row">
					<%
					LoaiSach loaiSach = (LoaiSach)request.getAttribute("LoaiSach");
									Map<Integer, List<Sach>> sachTheoLoaiSach = (Map<Integer,List<Sach>>)request.getAttribute("SachTheoLoaiSach");
					%>
					<!-- phần top -->
					<div class="col-md-12 col-sm-12 col-xs-12 padding-0 top_nd_trang">
						<div class="top">
							<h2>
								<a href="#" class="text-a"><%=loaiSach.getTenLoaiSach() %></a>
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
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 group-left-list-sp">
											<%
											if(sachTheoLoaiSach != null && sachTheoLoaiSach.size()> 0 ){
												for(int i = 0; i < sachTheoLoaiSach.size(); i++)
												{	
													List<Sach> dsSach = sachTheoLoaiSach.get(i);
													Sach sachDau = dsSach.get(0);
											 %>
												<!-- sản phẩm  -->
												<div class="col-md-3 col-sm-4 col-xs-12 padding-0 grid_group_sp">
														<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
															<div class="group_sp my_border">
																<div class="anh_sp">
																	<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sachDau.getMaSach() %>" class="">
																		<img class="anh" src="${url}/static/img/sanpham/<%=sachDau.getUrlHinh() %>" title="sp" alt="anhsp">
																		<%
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
																		if(soLuongDB >= 1){
																		%>
																			<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sachDau.getMaSach() %>&SoLuong=1&DuongDan=<%= request.getServletPath() %>" class="them_gh text-a" >
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
																				NumberFormat numberFormat = new DecimalFormat("###,###,###");
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
												</div>
												<!-- kt sản phẩm  -->
											<%
												}
											}else{
											%>
												<p class="alert alert-danger">Không có sản phẩm nào trong loại sách này !</p>
											<%
											}
											%>
										</div>
									</div>
							 	</section>
							</div>
							<!-- kt left: phần chi tiết sách -->
							<!-- right: phần hoTroKH_sachNoiBat -->
							<div class="col-md-4 col-sm-4 col-xs-12 padding-0">
								<article class="row  margin-0 right">
									<jsp:include page="block/hotrokh_sachnoibat.jsp" />
								</article>
							</div>
							<!-- kt right: phần hoTroKH_sachNoiBat -->
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
	</div>


	
</body>
</html>