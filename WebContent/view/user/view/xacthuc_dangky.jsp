<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.KhachHang" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Xác nhận email đăng ký tài khoản thành viên</title>
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
		<!-- phần header  -->
		<jsp:include page="block/header.jsp" />
		<!-- kt header  -->
		
		<!-- phần nội dung sản phẩm -->
		<section class="main_dangky main_center">
			<div class="container">
				<div class="row">
					<div class="col-md-3 padding-left0 left">
						<div class="menu_taikhoan my_border">
						    <h2>
						        <span>
						            Tài khoản
						        </span>
						    </h2>
						    <ul>
						        <li class="list-li"><a href="/SachKyAnh/userDangNhap" class="text-a"><i class="fa fa-sign-in"></i> Đăng nhập</a></li>
						        <li class="list-li"><a href="/SachKyAnh/userDangKy" class="text-a"><i class="fa fa-lock"></i> Đăng ký</a></li>
						        <li class="list-li"><a href="/SachKyAnh/QuenMatKhau" class="text-a"><i class="fa fa-question"></i> Quên mật khẩu</a></li>
						    </ul>
						</div>
					</div>
					<div class="col-md-9 padding-0 right">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<a href="#" class="text-a">Xác nhận email đăng ký</a>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0 my_border">
			                    <div class="col-sx-12">
			                    	<h2 class="col-xs-12 text-center">
			                    		<span>Xác nhận email để hoàn tất đăng ký</span>
			                    	</h2>
			                    	<div class="col-md-7 col-sm-7 col-xs-10 col-md-offset-3 col-sm-offset-3 col-xs-offset-1">
										<%
											String thanhCong = (String)session.getAttribute("dKThanhCong");
											String thatBai = (String)session.getAttribute("dKThatBai");
											String maXacNhanSai = (String)session.getAttribute("maXacNhanDKSai");
											if( thanhCong != null ){
										%>
											<div class="alert alert-success"><%=thanhCong %> Mời <a href="/SachKyAnh/userDangNhap">đăng nhập</a> vào tài khoản.</div>		
										<%
												session.removeAttribute("dKThanhCong");
											}
											if( thatBai != null ){ 
										%>
											<div class="alert alert-danger"><%=thatBai %> Quay về <a href="/SachKyAnh/userTrangChu">trang chủ</a>.</div>		
										<%	
											session.removeAttribute("dKThatBai");
											}
											if( maXacNhanSai != null ){
										%>
											<div class="alert alert-danger"><%=maXacNhanSai %></div>
										<%
											session.removeAttribute("maXacNhanDKSai");
											} 
											
											KhachHang kh = (KhachHang)session.getAttribute("TaiKhoanDK");
											if( kh != null ){ 
										%>
											<form method="post" action="/SachKyAnh/XacNhanEmailDangKy" id="formXacNhanDK" class="form-horizontal">
												<div class="form-group">
									            	<label for="email">Đăng nhập vào email <span style="color:#F47920;">&quot;<% if (kh != null ){ out.print(kh.getEmail()); } %>&quot;</span> để lấy mã xác nhận</label>
									            </div>
									            <div class="form-group">
								            		<label class="col-md-4 col-sm-4 col-xs-12" style="padding:0px">Nhập mã xác nhận: </label>
								            		<div class="col-md-8 col-sm-8 col-xs-12" style="padding:0px">
								            			<input type="text" class="form-control" name="maXN" placeholder="Mã xác nhận gửi về email" required="required">
								            		</div>
									            </div>
									            <div class="form-group">
									            		<button type="submit" class="btn" style="float:right">
									            			Xác nhận
									            		</button>
									            </div>
											</form>
										<%
											} 
										%>
									</div>
			                    </div>
							</div>
						</div>
						<!-- kt phần nội dung trang -->
					</div>
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