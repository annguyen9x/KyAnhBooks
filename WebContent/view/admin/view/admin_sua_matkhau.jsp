<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@page import="model.NhanVien"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị, đổi mật khẩu</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--  bootstrap -->
<link rel="stylesheet" type="text/css" href="${url}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${url}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${url}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!--  kt bootstrap -->
<!--  fontawesome -->
<link rel="stylesheet" href="${url}/static/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- kt fontawesome -->
<!-- my css -->
<link rel="stylesheet" type="text/css" href="${url}/static/css/quantri.css"/>
<!-- kt my css -->
<!-- start my js -->
	<script src="${url}/static/js/validationPassWord.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->
</head>
<body>
	<%
		NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
		String KetQuaDoiMatKhau = (String)session.getAttribute("KetQuaDoiMatKhau");
		if( nhanVien != null ){
	%>
	<section class="noidung">
		<div class="container-fluid">
			<div class="row content">
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
						<li><a href="/SachKyAnh/AdminTrangChu"><i class="fa fa-home"></i> Trang chủ</a></li>
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
						<li><a href="/SachKyAnh/AdminSuaMatKhau" class="active" ><i class="fa fa-key"></i> Thay đổi mật khẩu</a></li>
						<li><a href="/SachKyAnh/AdminDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
					</ul>
					<br>
				</div>

				<div class="col-md-10 col-sm-9 col-xs-12 nd_right">
					<header class="col-md-12 col-sm-12 col-xs-12">
						<div class="col-md-4 col-sm-4 col-xs-12 logo">  
							<img alt="logo" src="${url}/static/img/logo/logo.png">
						</div>
						<div class="col-md-8 col-sm-8 col-xs-12 heading">  
							<h3>Trang quản trị</h3>
						</div>
						<hr>
					</header>

				<!-- Phần nội dung chính -->
					<section class="content trang_cn_taikhoan">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Thay đổi mật khẩu đăng nhập</p>

							<form method="post" action="/SachKyAnh/AdminSuaMatKhau" id="formCN" onsubmit="return validationPass();" class="form-horizontal">
								<div class="form-group">
					            	<label for="pwd" class="col-sm-3 control-label">Mật khẩu mới (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="password" class="form-control" name="matkhau" id="matkhau" placeholder="Vui lòng nhập mật khẩu cần thay đổi" >
					            		<span id="errorMatkhau" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					            <div class="form-group">
					            	<label for="rePassword" class="col-sm-3 control-label">Nhập lại mật khẩu (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="password" class="form-control" name="nlMatkhau" id="nlMatkhau" placeholder="Nhập lại mật khẩu" >
					            		<span id="errorNlMatkhau" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					            <div class="form-group">
					            	<div class="col-xs-8 col-xs-offset-4">
					            		<button type="submit" class="btn">
					            			Cập nhật
					            		</button>
					            	</div>
					            </div>
							</form>
							<%
		                    	if( KetQuaDoiMatKhau != null && KetQuaDoiMatKhau.equals("thanhCong")){
	                    	%>
	                    			<script type="text/javascript">
	                    				alert('Thay đổi mật khẩu đăng nhập thành công.');
	                    				location='/SachKyAnh/AdminTrangChu';
	                    			</script>
	                    	<%
	                    			session.removeAttribute("KetQuaDoiMatKhau");
	                    		}
		                    	if( KetQuaDoiMatKhau != null && KetQuaDoiMatKhau.equals("thatBai")){
	                    	%>
	                    			<script type="text/javascript">
	                    				alert('Thay đổi mật khẩu đăng nhập thất bại !');
	                    				location='/SachKyAnh/AdminSuaMatKhau';
	                    			</script>
	                    	<%
	                    			session.removeAttribute("KetQuaDoiMatKhau");
		                    	}
	                    	%>
						</div>
					</section>
				<!-- kt phần nội dung chính -->

					<jsp:include page="_admin_footer.jsp" />
				</div>
			</div>
		</div>
	</section>
	<%
	}
	else{
		response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
	}
	%>	
</body>
</html>