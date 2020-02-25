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
<title>Liên hệ</title>
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
						<jsp:include page="./block/hotro_khachhang.jsp"/>
					</div>
					<div class="col-md-9 col-sm-8 col-xs-12 col-md-pull-3 col-sm-pull-4 padding-0 main_title_line">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<span>Liên hệ</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<!-- nd lien he -->
								<section class="left" style="margin-left:0px">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 group-left-list-sp">
											<h3 class="text-center" style="margin: 0px 0px 20px 0px;">
												Liên hệ với chúng tôi
											</h3>
											<div>
												<div style="width:35%; height: 100%; float: left;">
													<img src="${url}/static/img/tintuc/lienhe.jpg" alt="anh lien he" style="width: 100%; vertical-align: top">
												</div>
												<div style="width:61%; float: left; margin-left:4%; line-height:26px">
													<p>
														<strong>
															HIỆU SÁCH NHÂN DÂN KỲ ANH, HÀ TĨNH
														</strong>
														<ul>
															<li class="list-li">
																<b>
																	<span class="glyphicon glyphicon-map-marker"></span>
																	Địa chỉ: 
																</b>
																P. Sông Trí, Tx. Kỳ Anh, T. Hà Tĩnh
															</li>
															<li class="list-li">
																<b>
																<span class="glyphicon glyphicon-phone" style="color:#ed4c4c;"></span>Điện thoại:
																</b>
																(84)34.724.4142
															</li>
															<li class="list-li">
																<b>
																<span class="glyphicon glyphicon-phone-alt" style="color:#ff5400;"></span>
																Hotline:
																</b>
																<span>(84)92.910.9072</span>
															</li>
															<li class="list-li">
																<b>
																	<span class="fa fa-envelope" style="color:#15aabf;"></span>
																	Email:
																</b>
																kyanhbooks@gmail.com
															</li>
															<li class="list-li">
																<b>
																<i class="fa fa-facebook-square" style="color: #1a0dab"></i>
																Facebook:
																</b>
																<a href="https://www.facebook.com/Ky-Anh-Books-114377869939137/?modal=admin_todo_tour" class="text-a">Liên hệ facebook</a>
																
															</li>
														</ul>
													</p>
												</div>
											</div>
										</div>
									</div>
							 	</section>
							 	<!-- kt nd lien he -->
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