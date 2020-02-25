<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.KhachHang" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url" value="/view/user"></c:url>

<header id="header" class="header"> 
	<!-- top-header -->
	<section class="top-header clearfix">	
		<div class="container">
			<nav class="navbar navbar-inverse ">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        <i class="fa fa-list"></i>                        
			      </button>
			     
			    </div>
			    <div class="collapse navbar-collapse" id="myNavbar">
			      <ul class="nav navbar-nav navbar-right">
			        <li><a href="/SachKyAnh/XemDonHang"><span class="glyphicon glyphicon-edit"></span> Xem đơn hàng</a></li>
			         <%
			         	KhachHang kh = (KhachHang)session.getAttribute("TaiKhoan");
				        if(kh != null){
			        %>
			        	<li><a href="/SachKyAnh/userCapNhatTaiKhoan"><span class="glyphicon glyphicon-user"></span> <%=kh.getTenKH() %></a></li>
			        <%
			        	}else{
			        %>
			        	<li><a href="/SachKyAnh/userDangNhap"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
			        <% 
			        	}
			        %>
			        <li><a href="/SachKyAnh/userDangKy"><span class="glyphicon glyphicon-lock"></span> Đăng ký</a></li>
			      </ul>
			    </div>
			  </div>
			</nav>	
		</div>	
	</section> 
	<!-- kt top-header -->
	<!-- main-header -->
	<section class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-12 col-xs-12">
					<a href="/SachKyAnh/userTrangChu">
						<img src="${url}/static/img/logo/logo.png">
					</a>
				</div>
				<div class="col-md-6 col-sm-8 col-xs-7">
					 <div class="search-box">
	                    <form action="/SachKyAnh/TimKiem" method="get" id="form_timKiem" class="form-inline">
	                        <div class="input-group">
	                            <input type="text" name="timKiem" id="timKiem" class="form-control" size="70" placeholder="Nhập từ khóa tìm kiếm..." />
		                        <div class="input-group-btn">
		                        	<button type="submit" class="btn mau_btn">
		                        		Tìm kiếm
		                        	</button>	
		                        </div> 
	                        </div>
	                    </form>
	                </div>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-5">
					<div class="cart" id="cart-block">
	                    <a title="Giỏ hàng" href="/SachKyAnh/XemGioHang">
	                    	<img src="${url}/static/img/icon/cart.png" alt="">
	                    	<span class="text-show">Giỏ hàng</span>
	                    	<%
	                    		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
	                    		if( gioHang == null ){
	                    			
	                    	%>
	                    		<span class="soluong_sp">0</span>
	                    	<%
	                    		}else{
	                    			Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
	                    			if( danhSachChiTietGioHang != null ){
	                    				Iterator iterator =  danhSachChiTietGioHang.entrySet().iterator();
	                    				int tongSanPham = 0;
	                    				while( iterator.hasNext()){
	                    					Map.Entry ketQua = (Map.Entry)iterator.next();
	                    					Map<String, Object> chiTiet  = (Map<String, Object>)ketQua.getValue();
	                    					tongSanPham += (int)chiTiet.get("SoLuong");
	                    				}
	                    	%>
	                    				<span class="soluong_sp"><%=tongSanPham %></span>
	                    	<%
	                    			}
	                    		}
	                    	%>
	                    </a>
	                </div>
				</div>
			</div>
		</div>
	</section>
	<!-- kt main-header -->
	<!-- menu ngang -->
	<section class="menu-ngang">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle sua_navbar-toggle" data-toggle="collapse" data-target="#navbarMnN">
								Menu trang chủ
							</button>
						</div>
						<div class="collapse navbar-collapse sua_collapse" id="navbarMnN"> 
							<ul class="nav navbar-nav sua_ul">
								<li>
									<a href="/SachKyAnh/userTrangChu" class="a_menu_ngang">Trang chủ</a>
								</li>
								<li>
									<a href="/SachKyAnh/MenuNgang?NoiDung=gt" class="a_menu_ngang">Giới thiệu</a>
								</li>
								<li>
									<a href="/SachKyAnh/MenuNgang?NoiDung=dv" class="a_menu_ngang">Dịch vụ</a>
								</li>
								<li>
									<a href="/SachKyAnh/MenuNgang?NoiDung=hdmh" class="a_menu_ngang">Hướng dẫn mua hàng</a>
								</li>
								<li>
									<a href="/SachKyAnh/MenuNgang?NoiDung=lh" class="a_menu_ngang">Liên hệ</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</div> 
		</div>
	</section>
	<!-- kt menu ngang -->
</header>
<!-- kt header -->

<!-- menu_sp_hienthi, slideShow -->
<section class="menusp_slideshow">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-5 col-xs-12 padding-left0">
				<!-- menu_sp_hienthi -->
				<jsp:include page="menu_sp_an.jsp" />
				<!-- kt menu_sp_hienthi -->
			</div>
		</div>
	</div>
</section>
<!-- kt menu_sp_hienthi, slideShow -->