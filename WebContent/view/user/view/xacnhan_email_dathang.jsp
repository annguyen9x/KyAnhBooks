<%@page import="model.KhachHang"%>
<%@page import="model.NguoiNhanHang"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="model.HoaDon" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Xác nhận email đã đặt hàng</title>
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

		<section class="main_center">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-offset-3 padding-0 main_title_line">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<span>Xác nhận email đặt hàng</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0 xacnhan_email_dathang">
								<%
									Map<String, Object> thongTinDonHang = (HashMap<String, Object>)session.getAttribute("ThongTinDonHang");
									HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
									NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)thongTinDonHang.get("NguoiNhanHang");
									KhachHang khachHang = (KhachHang)thongTinDonHang.get("KhachHang");
								%>
								<h3 class="text-center">Đăng nhập hoặc xác nhận email đã đặt hàng để cập nhật đơn hàng số <%=hoaDon.getSoHD() %></h3><br/>
								
								<div class="col-md-7 col-sm-7 col-xs-10 col-md-offset-3 col-sm-offset-3 col-xs-offset-1">
									<%
									String xacNhanEmailDatHang = (String)session.getAttribute("xacNhanEmailDatHang");
									if( xacNhanEmailDatHang != null && xacNhanEmailDatHang.equals("mxnSai") ){
									%>
									<div class="alert alert-danger">
										<strong>Mã xác nhận không chính xác,</strong> vui lòng kiểm tra lại email !
									</div>
									<%
										session.removeAttribute("xacNhanEmailDatHang");
									}
									%>
									<form method="post" action="/SachKyAnh/XacNhanEmailDatHang" id="formTDDH">
							            <div class="form-group">
							            	<label for="email">Đăng nhập vào email <span style="color:#F47920;">&quot;
							            	<% if( khachHang != null ){
							            		out.print(khachHang.getEmail());
							            	}%>&quot;</span> để lấy mã xác nhận</label>
							            </div>
							            <div class="form-group">
						            		<label class="col-md-4 col-sm-4 col-xs-12" style="padding:0px">Nhập mã xác nhận: </label>
						            		<div class="col-md-8 col-sm-8 col-xs-12" style="padding:0px">
						            			<input type="text" class="form-control" name="maXN" placeholder="Mã xác nhận gửi về email" required="required">
						            		</div>
							            </div>
							            <div class="nut_cn">
								            <a href="/SachKyAnh/userTrangChu" class="btn" style="background:#333333">Hủy cập nhật</a>
							            	<button type="submit" class="btn">Tiến hành cập nhật</button>
							            </div>
									</form>
								</div>
							</div>
						</div>
						<!-- kt phần nội dung trang -->
					</div>
				</div>
			</div>
		</section>

		<!-- phần footer  -->
		<jsp:include page="block/footer.jsp" />
		<!-- kt footer  -->
	</div>
</body>
</html>