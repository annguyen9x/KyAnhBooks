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
<title>KyAnhBooks - Trang quản trị</title>
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
	<script src="${url}/static/js/formValidationAll.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->
</head>
<body>
	<%
		NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
		String thanhCong = (String)session.getAttribute("thanhCong");
		String thatBai = (String)session.getAttribute("thatBai");
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
						<li><a href="/SachKyAnh/KhoTrangChu"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="/SachKyAnh/KhoXemDonHangChuanBi"><i class="fa fa-table"></i> Đơn hàng cần chuẩn bị</a></li>
						<li><a href="/SachKyAnh/KhoCapNhatTTDH"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
						<li><a href="/SachKyAnh/KhoNhapSach"><i class="fa fa-edit"></i> Nhập sách</a></li>
						<li><a href="/SachKyAnh/KhoCapNhatTaiKhoan" class="active"><i class="fa fa-address-book"></i> Cập nhật tài khoản</a></li>
						<li><a href="/SachKyAnh/KhoDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
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
							<p class="tieude_bang">Cập nhật tài khoản</p>
							
							<%
		                    	if(  thanhCong != null ){
	                    	%>
	                    			<div class="col-xs-12 alert alert-success"><%=thanhCong %></div>
	                    	<%
	                    			session.removeAttribute("thanhCong");
	                    		}
		                    	if(  thatBai != null ){
	                    	%>
	                    		<div class="col-xs-12 alert alert-danger"><%=thatBai %></div>
	                    	<%
	                    		session.removeAttribute("thatBai");
	                    	}
	                    	%>
	                    	<form method="post" action="/SachKyAnh/KhoCapNhatTaiKhoan" id="formCN" onsubmit="return formValidationAll();" class="form-horizontal">
								<div class="form-group">
					                <label for="name" class="col-sm-3 control-label">Họ tên (<span class="warning">*</span>)</label>
					                <div class="col-sm-9">
					                    <input type="text" class="form-control" name="hoten" id="hoten" value="<%=nhanVien.getTenNV() %>" />
					                    <span id="errorHoten" class="col-xs-12 error warning"></span>
					                </div>
					            </div>
					            <div class="form-group">
					            	<label for="pwd" class="col-sm-3 control-label">Mật khẩu (<span class="warning">*</span>)</label>
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
					            	<label for="email" class="col-sm-3 control-label">Email (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="email" class="form-control" name="email" id="email" value="<%=nhanVien.getEmail() %>" >
					            		<span id="errorEmail" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					            <div class="form-group">
					            	<label for="dienthoai" class="col-sm-3 control-label">Điện thoại (<span class="warning">*</span>)</label>
					            	<div class="col-sm-9">
					            		<input type="text" class="form-control" name="dienthoai" id="dienthoai" value="<%=nhanVien.getDienThoai() %>" >
					            		<span id="errorDienthoai" class="col-xs-12 error warning"></span>
					            	</div>
					            </div>
					            <div class="form-group form-inline">
					            	<label for="" class="col-sm-3 control-label">Giới Tính</label>
					            	<div class="col-sm-9">
					            		<%
					            			String gioiTinh = nhanVien.getGioiTinh(); 
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
					            			Date ngaySinhDB = nhanVien.getNgaySinh();
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
					            		<input type="text"class="form-control" name="diachi" id="diachi" value="<%=nhanVien.getDiaChi() %>" >
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