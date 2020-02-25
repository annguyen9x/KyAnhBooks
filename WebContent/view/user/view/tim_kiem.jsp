<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Sach" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="model.Sach" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Tìm kiếm sản phẩm</title>
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
	<script src="${url}/static/js/formValidation.js" type="text/javascript" charset="utf-8"></script>
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
					<div class="col-md-3 col-sm-4 col-xs-12 col-md-push-9 col-sm-push-8 padding-0" style="margin-top:35px; padding-left:20px">
						<jsp:include page="block/hotro_khachhang.jsp"/>
					</div>
					<div class="col-md-9 col-sm-8 col-xs-12 col-md-pull-3 col-sm-pull-4 padding-0 main_title_line">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<span>Kết quả tìm kiếm</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<!-- danh sách kết quả -->
								<section class="left" style="margin-left:0px">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 group-left-list-sp">
											<%	
												String tuKhoa = (String)request.getAttribute("TuKhoa");
												List<Sach> dsSach = (List<Sach>)request.getAttribute("KetQuaTimKiem");
												if( dsSach == null || dsSach.size() == 0){
											%>
												<div class="alert alert-danger">
													<strong>Không tìm thấy sản phẩm nào.</strong> Vui lòng nhập từ khóa khác phù hợp !
												</div>
											<%
												}else{
											%>
											<p>Kết quả tìm kiếm của từ khóa: <%=tuKhoa %></p>
											<%
													for(int i = 0; i < dsSach.size(); i++ ){
														Sach sach = dsSach.get(i);
											%>
													<!-- sản phẩm  -->
													<div class="col-md-3 col-sm-4 col-xs-12 padding-0 grid_group_sp">
															<div class="col-md-12 col-sm-12 col-xs-12 padding-0">
																<div class="group_sp my_border">
																	<div class="anh_sp">
																		<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach() %>" class="">
																			<img class="anh" src="${url}/static/img/sanpham/<%=sach.getUrlHinh() %>" title="sp" alt="anhsp">
																			<a href="#" class="them_gh text-a" >
																				<span class="glyphicon glyphicon-shopping-cart"></span>
																				<span class="text"> Thêm vào giỏ</span>
																			</a>
																		</a>
																	</div>
																	<div class="tensp_giasp">
																		<h3 class="tensp">
																			<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach() %>" class="text-a">
																				<%=sach.getTenSach() %>
																			</a>
																		</h3>	
																		<div class="giasp">
																			<span class="gia_goc">
																				<%
																					NumberFormat numberFormat = new DecimalFormat("###,###,###");
																					out.print(numberFormat.format(sach.getDonGia()));
																				%> đ
																			</span>
																			<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach() %>" class="chi_tiet">
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
												}
											%>
										</div>
									</div>
							 	</section>
							 	<!-- kt danh sách kết quả -->
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
</body>
</html>