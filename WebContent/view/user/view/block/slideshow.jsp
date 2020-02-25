<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="url" value="/view/user"></c:url>

<div class="slide_nut">
	<a href="#">
		<img src="${url}/static/img/slideshow/slide1.jpg" title="" alt="anh" class="slide" id="img1" />
	</a>
	<a href="#">
		<img src="${url}/static/img/slideshow/slide2.jpg" title="" alt="anh" class="slide" id="img2" />
	</a>
	<a href="#">
		<img src="${url}/static/img/slideshow/slide3.jpg" title="" alt="anh" class="slide" id="img3" />
	</a>
	<a href="#">
		<img src="${url}/static/img/slideshow/slide4.jpg" title="" alt="anh" class="slide" id="img1" />
	</a>
	<!-- Nút di chuyển slide -->
	<button onClick="Chuyen_slide(1);" type="button" id="next" class="nut">&lt;</button>
	<button onClick="Chuyen_slide(-1);" type="button" id="back" class="nut">&gt;</button>
</div>
