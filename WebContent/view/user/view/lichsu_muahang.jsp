<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@page import="model.HoaDon" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.NumberFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Lịch sử mua hàng</title>
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
						            Quản lý tài khoản
						        </span>
						    </h2>
						    <ul>
						        <li class="list-li"><a href="/SachKyAnh/userCapNhatTaiKhoan" class="text-a"><span class="glyphicon glyphicon-user"></span> Cập nhật tài khoản</a></li>
						        <li class="list-li"><a href="/SachKyAnh/LichSuMuaHang" class="text-a"><i class="glyphicon glyphicon-list"></i> Xem lịch sử mua hàng</a></li>
						        <li class="list-li"><a href="/SachKyAnh/userDangXuat" class="text-a"><i class="glyphicon glyphicon-log-out"></i> Đăng xuất</a></li>
						    </ul>
						</div>
					</div>
					<div class="col-md-9 padding-0 right">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<a href="#" class="text-a">Xem lịch sử mua hàng</a>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0 my_border">
			                    <div class="col-sx-12">
			                    	<h2 class="col-xs-12 text-center">
			                    		<span>Lịch sử mua hàng</span>
			                    	</h2>
			                    	<%
										List<Object> dsHoaDon = (List<Object>)request.getAttribute("DanhSachDonHang");
										if( dsHoaDon == null || (dsHoaDon != null && dsHoaDon.size() == 0 ) ){
									%>
									<div class="col-xs-12">
										<div class="alert alert-danger">
											<strong>Bạn chưa đặt đơn hàng nào, danh sách rỗng.</strong> Vui lòng mua hàng để xem lịch sử !
										</div> 
									</div>
									<%
										}
										if( dsHoaDon != null && dsHoaDon.size() > 0 ){
									%>
									<table class="table my_border">
										<thead style="background:#5a5858; color:#fff">
											<tr>
												<th>STT</th>
												<th>Mã Đơn Hàng</th>
												<th>Ngày Đặt</th>
												<th>Tổng Tiền</th>
												<th>Tình Trạng</th>
												<th>Chi Tiết</th>
											</tr>
										</thead>
										<tbody>
											<%
												for(int i = 0; i < dsHoaDon.size(); i++){
													Map<String, Object> danhSachHoaDon = (Map<String, Object>)dsHoaDon.get(i);
													HoaDon hoaDon = (HoaDon)danhSachHoaDon.get("HoaDon");
											%>
												<tr>
													<td><%=i+1 %></td>
													<td><%=hoaDon.getSoHD() %></td>
													<td>
														<%
															SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
															out.print(dateFormat.format((Date)hoaDon.getNgayDat()));
														%>
													</td>
													<td>
														<%
															NumberFormat numberFormat = new DecimalFormat("###,###,###");
															out.print(numberFormat.format(hoaDon.getTongTien()) + " đ");
														
														%>
													</td>
													<td><%=hoaDon.getTinhTrangDH() %></td>
													<td>
														<form action="/SachKyAnh/XemDonHang" method="post">
															<input type="hidden" name="maDH" value="<%=hoaDon.getSoHD() %>" />
															<button type="submit" class="btn btn-link">Xem chi tiết</button>
														</form>
													</td>
												</tr>
											<%
												}
											%>
										</tbody>
									</table>
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