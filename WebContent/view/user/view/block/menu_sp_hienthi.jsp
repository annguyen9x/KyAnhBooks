<%@page import="controller.user.TrangChuController"%>
<%@page import="model.LoaiSach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url" value="/view/user"></c:url>

<nav class="menu_sp navbar-inverse"> 
	<div class="top_menu_sp">
		<div class="navbar-header">
			<i class="fa fa-bars"></i>
			<span class="">DANH MỤC SÁCH</span>
	      	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nbMenuSP">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span> 
	      </button>
	  	</div>
	</div>
	<ul class="main_menu_sp collapse navbar-collapse" id="nbMenuSP">
	 	<c:forEach items="${DSLoaiSach}" var="dsLoaiSach">
			<li>
				<span class="glyphicon glyphicon-ok" style="font-size:10px">&nbsp;</span>
				<span>
					<a href="/SachKyAnh/SachTheoLoaiSach?MaLoaiSach=${dsLoaiSach.maLoaiSach}" class="text-a">
						${dsLoaiSach.tenLoaiSach}
					</a>
				</span>
			</li>
		</c:forEach>
	</ul>
</nav>