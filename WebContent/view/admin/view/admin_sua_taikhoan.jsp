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
<title>KyAnhBooks - Trang quản trị sửa tài khoản nhân viên</title>
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
	<script src="${url}/static/js/formValidation.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->
</head>
<body>
	<%
		NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
		NhanVien nhanVienSua = (NhanVien)session.getAttribute("NhanVienSua");
		String LoiSuaNhanVien = (String)session.getAttribute("LoiSuaNhanVien");
		if( nhanVien != null && nhanVienSua != null ){
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
						<li><a href="/SachKyAnh/AdminCapNhatTaiKhoan" class="active"><i class="fa fa-address-book"></i> Cập nhật nhân viên</a></li>
						<li><a href="/SachKyAnh/AdminSuaMatKhau"><i class="fa fa-key"></i> Thay đổi mật khẩu</a></li>
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
							<p class="tieude_bang">Sửa thông tin tài khoản nhân viên</p>
							
							<%
		                    	if(  LoiSuaNhanVien != null ){
	                    	%>
	                    			<div class="col-xs-12 alert alert-danger"><strong>Lỗi khi sửa thông tin tài khoản nhân viên.</strong> Email và điện thoại không được trùng với nhân viên khác !</div>
	                    	<%
	                    			session.removeAttribute("LoiSuaNhanVien");
	                    		}
	                    	%>
							<form method="post" action="/SachKyAnh/AdminSuaTaiKhoanNhanVien" id="formCN" onsubmit="return validation();" class="form-horizontal">
								<div class="form-group">
					                <label for="name" class="col-sm-3 control-label">Họ tên (<span class="warning">*</span>)</label>
					                <div class="col-sm-9">
					                    <input type="text" class="form-control" name="hoten" id="hoten" value="<%=nhanVienSua.getTenNV() %>" />
					                    <span id="errorHoten" class="col-xs-12 error warning"></span>
					                </div>
					            </div>
					            <div class="form-group form-inline">
					            	<label for="" class="col-sm-3 control-label">Chức vụ</label>
					            	<div class="col-sm-9">
					            		<%
				            			String chucVu = nhanVienSua.getChucVu(); 
					            		%>
						            	<select name="chucvu" id="chucvu" class="col-xs-6 form-control">
						            		<%
					            			if( chucVu.equals("Admin") ){
						            		%>
							            		<option value="1" selected="true">Admin</option>
							            		<option value="2">Kho</option>
							            		<option value="3">Giao Hàng</option>
						            		<%
						            			}else if( chucVu.equals("Kho") ){
						            		%>
							            		<option value="1">Admin</option>
							            		<option value="2" selected="true">Kho</option>
							            		<option value="3">Giao Hàng</option>
							            	<%
						            			}else if( chucVu.equals("Giao Hàng") ){
						            		%>
							            		<option value="1">Admin</option>
							            		<option value="2">Kho</option>
							            		<option value="3" selected="true">Giao Hàng</option>
							            	<%
						            			}
						            		%>
					            		</select>
					            	</div>
					            </div>
					            <div class="form-group">
					            	<label for="email" class="col-sm-3 control-label">Email (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="email" class="form-control" name="email" id="email" value="<%=nhanVienSua.getEmail() %>" >
					            		<span id="errorEmail" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					            <div class="form-group">
					            	<label for="dienthoai" class="col-sm-3 control-label">Điện thoại (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="text" class="form-control" name="dienthoai" id="dienthoai" value="<%=nhanVienSua.getDienThoai() %>" >
					            		<span id="errorDienthoai" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					            <div class="form-group form-inline">
					            	<label for="" class="col-sm-3 control-label">Giới Tính</label>
					            	<div class="col-sm-9">
					            		<%
					            			String gioiTinh = nhanVienSua.getGioiTinh(); 
					            			if( gioiTinh.equals("Nam") ){
					            		%>
					            		<div class="col-xs-2">
					            			<input class="form-control" type="radio" name="gioitinh" value="Nam" checked="checked">Nam
					            		</div>
					            		<div class="col-xs-2">
						            		<input class="form-control" type="radio" name="gioitinh" value="Nữ">Nữ
						            	</div>
						            	<div class="col-xs-2">
						            		<input class="form-control" type="radio" name="gioitinh" value="Khác">Khác
						            	</div>
					            		<%
					            			}else if( gioiTinh.equals("Nữ") ){
					            		%>
						            	<div class="col-xs-2">
					            			<input class="form-control" type="radio" name="gioitinh" value="Nam">Nam
					            		</div>
					            		<div class="col-xs-2">
						            		<input class="form-control" type="radio" name="gioitinh" value="Nữ" checked="checked">Nữ
						            	</div>
						            	<div class="col-xs-2">
						            		<input class="form-control" type="radio" name="gioitinh" value="Khác">Khác
						            	</div>
						            	<%
					            			}else if( gioiTinh.equals("Khác") ){
					            		%>
						            	<div class="col-xs-2">
					            			<input class="form-control" type="radio" name="gioitinh" value="Nam">Nam
					            		</div>
					            		<div class="col-xs-2">
						            		<input class="form-control" type="radio" name="gioitinh" value="Nữ">Nữ
						            	</div>
						            	<div class="col-xs-2">
						            		<input class="form-control" type="radio" name="gioitinh" value="Khác" checked="checked">Khác
						            	</div>
						            	<%
					            			}
					            		%>
					            	</div>
					            </div>
					            <div class="form-group form-inline">
					            	<label for="ngaysinh" class="col-sm-3 control-label">Ngày sinh (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<%
					            			Date ngaySinhDB = nhanVienSua.getNgaySinh();
					            			Calendar calendar = Calendar.getInstance();
					            			calendar.setTime(ngaySinhDB);
					            			
						            		int ngaySinh = calendar.get(Calendar.DAY_OF_MONTH);
						            		int thangSinh = calendar.get(Calendar.MONTH)+1;
						            		int namSinh = calendar.get(Calendar.YEAR);
					            		%>
					            		<select name="ngaysinh" id="ngaysinh" class="col-xs-4 form-control">
					            			<%
					            				for(int i = 1; i <= 31; i++){
					            					if(i == ngaySinh){
					            			%>
							            				<option value="<%=i%>" selected="true"><%=i%></option>
							            	<%
					            					}else{
					            			%>
					            						<option value="<%=i%>"><%=i%></option>
					            			<%
					            					}
					            				}
					            			%>
					            		</select>
					            		<select name="thangsinh" id="thangsinh" class="col-xs-4 form-control">
					            			<%
					            				for(int i = 1; i <= 12; i++){
							            			if(i == thangSinh){
					            			%>
							            				<option value="<%=i%>" selected="true"><%=i%></option>
							            	<%
					            					}else{
					            			%>
					            						<option value="<%=i%>"><%=i%></option>
					            			<%
					            					}
					            				}
					            			%>
					            		</select>
					            		<select name="namsinh" id="namsinh" class="col-xs-4 form-control">
					            			<%
					            				int namHT = Calendar.getInstance().get(Calendar.YEAR);
					            				for(int i = 1920 ; i <= namHT; i++){
					            					if(i == namSinh){
					            			%>
							            				<option value="<%=i%>" selected="true"><%=i%></option>
							            	<%
					            					}else{
					            			%>
					            						<option value="<%=i%>"><%=i%></option>
					            			<%
					            					}
					            				}
					            			%>
					            		</select>
					            		<span id="errorNgaysinh" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					             <div class="form-group">
					            	<label for="diachi" class="col-sm-3 control-label">Địa chỉ (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="text"class="form-control" name="diachi" id="diachi" value="<%=nhanVienSua.getDiaChi() %>" >
					            		<span id="errorDiachi" class="col-xs-12 error warning"></span>
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