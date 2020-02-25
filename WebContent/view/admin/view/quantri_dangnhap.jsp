<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Đăng nhập trang quản trị</title>
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
	<div class="trang_dangnhap">
		<div class="noidung">
			<header id="header" class="">
				<h3>Đăng Nhập Trang Quản Trị</h3>
				<hr>
			</header><!-- /header -->
			<section>
				<form action="/SachKyAnh/quantri" method="post" accept-charset="utf-8">
					<input type="email" name="Email" class="form-control" required="required" placeholder="Vui lòng nhập email">
					<%
						String errorEmail = (String)request.getAttribute("errorEmail");
						if( errorEmail != null ){
					%>
						<span id="errorEmail" class="col-xs-12 error warning"><%=errorEmail %></span>
					<%
							request.removeAttribute("errorEmail");
						}
					%>
					<input type="password" name="MatKhau" class="form-control input_last" required="required" placeholder="Vui lòng nhập mật khẩu">
					<%
						String errorMatkhau = (String)request.getAttribute("errorMatkhau");
						if( errorMatkhau != null ){
					%>
						<span id="errorMatKhau" class="col-xs-12 error warning"><%=errorMatkhau %></span>
					<%
							request.removeAttribute("errorMatkhau");
						}
					%>
					<button type="submit" class="btn btn-default">Đăng nhập</button>
				</form>
				<hr>
			</section>
			<footer>
				<p class="logo">
					<img alt="logo" src="${url}/static/img/logo/logo.png">
				</p>
				<p class="text-bottom-footer">&copy; 2019 Bản quyền thuộc về Hiệu sách nhân dân Kỳ Anh - Cung cấp bởi <a href="https://www.facebook.com/profile.php?id=100005794591130"  class="text-a">annguyen</a>
				</p>
			</footer>
		</div>
	</div>
</body>
</html>