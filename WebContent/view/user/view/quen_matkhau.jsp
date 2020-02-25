<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Quên mật khẩu</title>
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
<link rel="stylesheet" type="text/css" href="../static/css/trangchu.css"/>
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
									<a href="#" class="text-a">Đăng nhập bằng xác nhận email</a>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0 my_border">
								
			                    <div class="col-sx-12">
			                    	<%
									String xacNhanDangNhapQMK = (String)session.getAttribute("xacNhanDangNhapQMK");
									if(xacNhanDangNhapQMK != null && xacNhanDangNhapQMK.equals("mxnChinhXac")){
									%>
										<div class="alert alert-success">
											<strong>Đăng nhập thành công.</strong> Vui lòng vào mục <a href="/SachKyAnh/userCapNhatTaiKhoan">cập nhật tài khoản</a> để đặt lại mật khẩu !
										</div>
									<%
										session.removeAttribute("xacNhanDangNhapQMK");
									}
									if( xacNhanDangNhapQMK == null || (xacNhanDangNhapQMK != null && !xacNhanDangNhapQMK.equals("mxnChinhXac") ) ){
										
									
										String kiemTraEmailDangNhap = (String)session.getAttribute("KiemTraEmailDangNhap");
										if(kiemTraEmailDangNhap != null && kiemTraEmailDangNhap.equals("EmailKhongTonTai")){
									%>
										<div class="alert alert-warning">
											<strong>Email không tồn tại.</strong> Mời bạn nhập lại email mới !
										</div>
									<%
											session.removeAttribute("KiemTraEmailDangNhap");
										}
										String email = (String)session.getAttribute("Email");
									%>
				                    	<h2 class="col-xs-12 text-center">
				                    		<span class="lay_mk">Cung cấp email để đăng nhập bằng mã xác nhận</span>
				                    	</h2>
				                    	<div class="col-md-6 col-md-offset-3">
											<form method="post" action="/SachKyAnh/QuenMatKhau" class="form-horizontal">
												<div class="form-group">
									            	<label for="email">Email</label>
								            		<input type="email" class="form-control" name="email" value="<%if(email != null){out.print(email);} %>" placeholder="Email đăng nhập" required="required">
									            </div>
									            <div class="form-group">
									            		<button type="submit" class="btn" style="background:#70ba28;">
									            			Gửi mã xác nhận
									            		</button>
									            		<a href="/SachKyAnh/userDangNhap">Quay lại đăng nhập</a>
									            		<%
									            			if(kiemTraEmailDangNhap != null && kiemTraEmailDangNhap.equals("EmailTonTai")){
									            		%>
										            		<span id="errorEmail" class="col-xs-12 error warning">
										            			Mã xác nhận đã gửi về email, vui lòng kiểm tra !
										            		</span>
									            		<%
									            				
									            			}
									            		%>
									            </div>
									          </form>
										      <%
							            	  	if(kiemTraEmailDangNhap != null && kiemTraEmailDangNhap.equals("EmailTonTai")){
							            	  		
							            	  %>
									          <form method="post" action="/SachKyAnh/XacNhanEmailDangNhap" class="form-horizontal">
									            <div class="form-group">
								            		<label>Nhập mã xác nhận</label>
								            		<input type="text" class="form-control" name="maXN" placeholder="Nhập mã xác nhận được gửi về email" required="required">
									            </div>
									            <%
													if(xacNhanDangNhapQMK != null && xacNhanDangNhapQMK.equals("mxnSai")){
												%>
													<div class="alert alert-warning">
														<strong>Mã xác nhận không chính xác.</strong> Kiểm tra và nhập lại mã xác nhận !
													</div>
												<%
														session.removeAttribute("xacNhanDangNhapQMK");
													}
												%>
									            <div class="form-group">
									            		<button type="submit" class="btn" style="float:right">
									            			Đăng nhập
									            		</button>
									            </div>
											</form>
											<%
							            	  	}
											%>
										</div>
									 <%
										} 
									 %>
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