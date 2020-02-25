<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Hướng dẫn mua hàng</title>
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
						<jsp:include page="./block/hotro_khachhang.jsp"/>
					</div>
					<div class="col-md-9 col-sm-8 col-xs-12 col-md-pull-3 col-sm-pull-4 padding-0 main_title_line">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<span>Hướng dẫn mua hàng</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<!-- nd huong dan mua hang -->
								<section class="left" style="margin-left:0px">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 group-left-list-sp">
											<h3 class="text-center" style="margin: 0px 0px 20px 0px;">
												Hướng dẫn mua hàng, thanh toán trên website kyanhbooks.com.vn
											</h3>
											<div>
												<p style="width: 60%; float: left; line-height:26px;">
													Hiệu sách nhân dân Kỳ Anh mang đến cho khách hàng những trải nghiệm tốt nhất, mua sắm thuận lợi, thanh toán linh hoạt trên website kyanhbooks.com.vn. Khách hàng có thể lựa chọn các cách sau để thực hiện mua hàng:
												</p>
												<div style="width: 40%; height: 100%; float: left;">
													<img src="${url}/static/img/tintuc/muahang.jpg" alt="anh huong dan mua hang" style="width: 100%; vertical-align: top">
												</div>
											</div>
											<p style="clear:both;">
												<strong>
													CÁCH 1: ĐẶT MUA HÀNG TRỰC TUYẾN TRÊN WEBSITE KYANHBOOKS.COM.VN
												</strong>
											</p>
											<p style="line-height:26px;">
												Khách hàng truy cập vào website kyanhbooks.com.vn và thực hiện các bước dưới đây để tiến hành đặt mua sản phẩm.<br/>
												Bước 1: Tìm sản phẩm cần mua<br/>
												Bước 2: Chọn sản phẩm cần mua<br/>
												Bước 3: Nhập thông tin thanh toán và tiến hành thanh toán<br/>
												Bước 4: Chọn phương thức thanh toán<br/>
												Bước 5: Thanh toán và xem đơn hàng<br/>
											</p>
											<p style="clear:both;">
												<strong>
													CÁCH 2: GỌI ĐẾN SỐ HOTLINE (84)34.724.4142
												</strong>
											</p>
											<p style="line-height:26px;">
												Nếu với hướng dẫn ở <b>Cách 1:</b> Đặt mua hàng trực tuyến trên website kyanhbooks.com.vn, khách hàng vẫn chưa thực hiện được thanh toán thì khách hàng vui lòng gọi điện đến số hotline của Hiệu sách nhân dân Kỳ Anh (84)34.724.4142 để được phục vụ một cách tốt nhất. Thời gian từ 8g30-17g30 (kể cả CN & trừ ngày lễ) nhân viên của Hiệu sách nhân dân Kỳ Anh luôn sẵn sàng phục vụ.<br/>
												Hiệu sách nhân dân Kỳ Anh hân hạnh được phục vụ quý khách, chúc quý khách có những trải nghiệm tuyệt vời trên website kyanhbooks.com.vn
											</p>
										</div>
									</div>
							 	</section>
							 	<!-- kt nd huong dan mua hang -->
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