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
<title>Giới thiệu</title>
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
		<jsp:include page="./block/header.jsp" />
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
									<span>Giới thiệu</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<!-- nd gioi thieu -->
								<section class="left" style="margin-left:0px">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 group-left-list-sp">
											<p style="line-height:26px;">
												Hiệu sách nhân dân Kỳ Anh, Hà Tĩnh ra đời vào cuối năm 2003, đã trở thành một địa chỉ mua sắm tin cậy, tiện lợi cho khách hàng tại Hà Tĩnh và các tỉnh thành khác trên cả nước.
											</p>
											<p style="line-height:26px;">
												Hiệu sách nhân dân Kỳ Anh hoạt động theo mô hình công ty tư nhân, trong đó: Lưu trữ, kinh doanh, xuất bản sách là ngành nghề kinh doanh chính, bên cạnh đó là dịch vụ in ấn, dịch thuật. Sản phẩm của Hiệu sách nhân dân Kỳ Anh có nhiều mẫu mã độc đáo, hấp dẫn, thú vị,... Đặc biệt giá tiền vừa phải, phù hợp với nhiều đối tượng khách hàng và đáp ứng nhu cầu đọc sách của khách hàng trong cả nước.
											</p>
											<p style="line-height:26px;">
												KyAnhBooks.Com là kênh bán sách trực tuyến của hiệu sách nhân dân Kỳ Anh, phục vụ nhu cầu mua sắm của khách hàng, bao gồm: chọn và mua hàng trực tuyến và nhanh chóng, an toàn, giao hàng tận nơi, chăm sóc và tư vấn thân thiện. Với mong muốn đem đến cho khách hàng những sản phẩm chất lượng với giá cả hợp lý nhất.
											</p>
										</div>
									</div>
							 	</section>
							 	<!-- kt nd gioi thieu -->
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