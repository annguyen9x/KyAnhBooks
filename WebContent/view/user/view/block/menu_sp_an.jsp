<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List" %>
<%@page import="model.LoaiSach" %>

<nav class="menu_sp navbar-inverse" id="menu_an"> 
	<div class="top_menu_sp" id="top_menu_an">
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
	<ul class="main_menu_sp collapse navbar-collapse an_menu" id="nbMenuSP">
		<%
			List<LoaiSach> dsLoaiSach = (List<LoaiSach>)application.getAttribute("DSLoaiSach");
			for(int i = 0; i < dsLoaiSach.size(); i++ ){
				LoaiSach loaiSach = dsLoaiSach.get(i);
		%>
			<li>
				<span class="glyphicon glyphicon-ok" style="font-size:10px">&nbsp;</span>
				<span>
					<a href="/SachKyAnh/SachTheoLoaiSach?MaLoaiSach=<%=loaiSach.getMaLoaiSach()%>" class="text-a">
						<%=loaiSach.getTenLoaiSach() %>
					</a>
				</span>
			</li>
		<%
			}
		%>
	</ul>
</nav>