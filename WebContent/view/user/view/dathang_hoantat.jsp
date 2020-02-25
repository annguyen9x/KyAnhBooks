<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="model.NguoiNhanHang" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đặt hàng hoàn tất</title>
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
				<div class="col-md-12 col-sm-12 col-xs-12 padding-0 main_title_line">
					<!-- phần top -->
					<div class="col-md-12 padding-0 top_nd_trang">
						<div class="top">
							<h2>
								<span>hoàn tất</span>
							</h2>
						</div>
					</div>
					<!-- kt phần top -->
					<!-- phần nội dung trang -->
					<div class="col-md-12 padding-0 nd_trang">
						<div class="row margin-0">
							<!-- noi dung dat hang -->
							<section class="dathang_hoantat">
								<%
									Map<String, Object> gioHang = (Map<String,Object>) session.getAttribute("GioHang");
									NumberFormat numberFormat = new DecimalFormat("###,###,###,###");
									SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-dd");
									Date ngayDat = Calendar.getInstance().getTime();
									Calendar calendar = Calendar.getInstance();
			            			calendar.setTime(ngayDat);
			            			
									String hoanTatDonHang = (String)request.getAttribute("HoanTatDonHang");
									if( hoanTatDonHang.equals("ThatBai")){
								%>
									<div class="alert alert-warning">
										<strong>Đặt hàng thất bại.</strong> Lỗi server ! 
									</div>
								<%
									}else if( hoanTatDonHang.equals("ThanhCong") && gioHang != null){
										NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)gioHang.get("NguoiNhanHang");
								%>
									<div class="alert alert-success">
										<strong>Đặt hàng thành công.</strong> Thông tin về đơn hàng đã được gửi qua email của bạn ! 
									</div>
									<div class="row margin-0 my_border">
										<div class="col-md-6 col-sm-6 col-xs-12">
											<p><b>Mã đơn hàng: </b><span class="ma_dh"><%=gioHang.get("SoHD") %></span></p>
											<p><b>Người nhận: </b><%=nguoiNhanHang.getTenNN() %></p>
											<p><b>Điện thoại: </b><%=nguoiNhanHang.getDienThoai()%></p>
											<p><b>Địa chỉ: </b><%=nguoiNhanHang.getDiaChi() %></p>
											</p>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<p><b>Ngày đặt hàng: </b><%=simpleDateFormat.format(ngayDat) %></p>
											<p><b>Ngày giao hàng (Dự kiến): </b>
											<% 
												calendar.add(Calendar.DAY_OF_MONTH, 3);
												out.print(simpleDateFormat.format(calendar.getTime()));
											%>
											</p>
											<p><b>Tổng thanh toán: </b><%=numberFormat.format((float)gioHang.get("TongTien")) %><span class="text_underline"> đ</span></p>
										</div>
										<a href="/SachKyAnh/userTrangChu" class="btn">Tiếp tục mua hàng</a>
									</div>
								<%
										request.removeAttribute("HoanTatDonHang");
									}
									session.removeAttribute("GioHang");
								%>
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
</body>
</html>