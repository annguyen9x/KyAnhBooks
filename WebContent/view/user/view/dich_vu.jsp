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
<title>Dịch vụ</title>
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
									<span>Dịch vụ</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<!-- nd dich vu -->
								<section class="left" style="margin-left:0px">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 group-left-list-sp">
											<h3 class="text-center" style="margin: 0px 0px 20px 0px;">
												Dịch vụ in ấn chất lượng, uy tín
											</h3>
											<p style="line-height:26px;">
												Hiệu sách nhân dân Kỳ Anh đem đến cho khách hàng những mẫu thiết kế, dịch vụ in chất lượng nhất, đẹp nhất, bắt kịp xu thế in ấn hiện nay.
											</p>
											<p>
												<strong>
												Các dịch vụ in ấn của Hiệu sách nhân dân Kỳ Anh:
												</strong>
											</p>
											<p style="line-height:26px;">
												- In ấn phẩm văn phòng: in card visit; in phong bì; in kẹp file; in bìa đựng hồ sơ; in tiêu đề thư; in giấy ghi chú; in bao đĩa;…<br/>
												- In ấn phẩm quảng cáo: in tờ rơi; in phiếu quà tặng, voucher; in poster, banner; in băng rôn; in cẩm nang; in menu; in catalogue;…<br/>
												- In ấn phẩm khác: in tem mác sản phẩm; in tem bảo hành; in phiếu bảo hành; in túi giấy; in biểu mẫu; in cốc giấy; in lịch; in nhãn decal; in quà tặng; in vé; in thẻ nhựa; in túi nilon;…
											</p>
											<p style="line-height:26px;">
												Quý khách vui lòng liên hệ với chúng tôi để được tư vấn thêm về các ý tưởng, mẫu thiết kế của quý khách để được hoàn thiện và in ấn một cách ưng ý nhất.
											</p>
											<hr/>
											<h3 class="text-center" style="margin: 10px 0px 20px 0px;">
												Dịch vụ dịch thuật chuyên ngành, đa lĩnh vực, đa ngôn ngữ
											</h3>
											<div>
												<p style="width: 60%; float: left; line-height:26px;">
													Với đội ngũ nhân viên và cộng tác viên giàu kinh nghiệm, chuyên nghiệp với tinh thần trách nhiệm cao. Hiệu sách nhân dân Kỳ Anh luôn đáp ứng yêu cầu khách hàng bằng dịch vụ dịch thuật chính xác nhất, trong thời gian nhanh nhất. Chúng tôi đảm bảo được độ chính xác về dữ liệu cũng như từ ngữ của bản dịch để đạt được mục đích sử dụng của tài liệu, và có thể rút ngắn thời gian thực hiện, với chi phí tiết kiệm và cạnh tranh nhất.
												</p>
												<div style="width: 40%; height: 100%; float: left;">
													<img src="${url}/static/img/tintuc/dichThuat.jpg" alt="anh dich vu" style="width: 100%; vertical-align: top">
												</div>
											</div>
											<p style="clear:both;">
												<strong>
													Phương thức giao dịch:
												</strong>
											</p>
											<p style="line-height:26px;">
												- Chúng tôi sẽ giao nhận tài liệu tận nơi miễn phí với những đơn đặt hàng trên 10 trang tài liệu.<br/>
												- Để thực hiện được đơn đặt hàng quý khách cần đặt trước 40% đến 50% giá trị hợp đồng.<br/>
												- Đối với khách hàng thường xuyên dịch tại Hiệu sách nhân dân Kỳ Anh sẽ được hưởng các chế độ ưu đãi đặc biệt khác.
											</p>
										</div>
									</div>
							 	</section>
							 	<!-- kt nd dich vu -->
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