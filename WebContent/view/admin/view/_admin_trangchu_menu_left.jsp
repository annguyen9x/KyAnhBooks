<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="model.NhanVien"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<%
	NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
%>
<div class="col-md-2 col-sm-3 col-xs-12 sidenav nd_left">
	<h2 class="loainv_icon"><li class="fa fa-th-large"></li><span class="loainv"> Nhân viên <% if(nhanVien != null) {out.print(nhanVien.getChucVu());} %></span></h2>
	<div class="tennv_anh">
		<span class="anh">
			<img class="img-circle" alt="hinhNV" src="${url}/static/img/hinhMacdinh.png">
		</span>
		
		<span class="ten_nv">Xin chào, <br/>
			<span class="ten"><% if(nhanVien != null) {out.print(nhanVien.getTenNV());} %></span>
		</span>
	</div>
	<ul class="nav nav-pills nav-stacked">
		<li><a href="/SachKyAnh/AdminTrangChu" class="active"><i class="fa fa-home"></i> Trang chủ</a></li>
		<li><a href="/SachKyAnh/AdminDanhSachDH"><i class="fa fa-table"></i> Danh sách đơn hàng</a></li>
		<li><a href="/SachKyAnh/AdminXuLyDonHang"><i class="fa fa-edit"></i> Xử lý đơn hàng</a></li>
		<li class="menu_cha">
			<a href="/SachKyAnh/AdminCapNhatSach"><i class="fa fa-book"></i> Cập nhật sách</a>
			<ul class="menu_con">
				<li><a href="/SachKyAnh/AdminCapNhatLoaiSach">Cập nhật loại sách</a></li>
				<li><a href="/SachKyAnh/AdminCapNhatSach">Cập nhật sách</a></li>
			</ul>
		</li>
		<li><a href="/SachKyAnh/AdminCapNhatTaiKhoan"><i class="fa fa-address-book"></i> Cập nhật nhân viên</a></li>
		<li><a href="/SachKyAnh/AdminSuaMatKhau"><i class="fa fa-key"></i> Thay đổi mật khẩu</a></li>
		<li><a href="/SachKyAnh/AdminDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
	</ul>
	<br>
</div>