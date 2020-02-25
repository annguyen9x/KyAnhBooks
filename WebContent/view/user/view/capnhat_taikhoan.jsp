<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.KhachHang" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cập nhật thông tin tài khoản thành viên</title>
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
		<!-- phần header  -->
		<jsp:include page="block/header.jsp" />
		<!-- kt header  -->
		
		<!-- phần nội dung sản phẩm -->
		<section class="main_dangky main_center">
			<div class="container">
				<div class="row">
					<div class="col-md-3 padding-left0 left">
						<div class="menu_taikhoan my_border">
						    <h2>
						        <span>
						            Quản lý tài khoản
						        </span>
						    </h2>
						    <ul>
						        <li class="list-li"><a href="/SachKyAnh/userCapNhatTaiKhoan" class="text-a"><span class="glyphicon glyphicon-user"></span> Cập nhật tài khoản</a></li>
						        <li class="list-li"><a href="/SachKyAnh/LichSuMuaHang" class="text-a"><i class="glyphicon glyphicon-list"></i> Xem lịch sử mua hàng</a></li>
						        <li class="list-li"><a href="/SachKyAnh/userDangXuat" class="text-a"><i class="glyphicon glyphicon-log-out"></i> Đăng xuất</a></li>
						    </ul>
						</div>
					</div>
					<div class="col-md-9 padding-0 right">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<a href="#" class="text-a">Cập nhật thông tin tài khoản</a>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0 my_border">
			                    <div class="col-sx-12">
			                    	<h2 class="col-xs-12 text-center">
			                    		<span>Cập nhật tài khoản</span>
			                    	</h2>
			                    	<%
				                    	String thanhCong = (String)session.getAttribute("thanhCong");
				                    	if(  thanhCong != null ){
			                    	%>
			                    			<div class="col-xs-12 alert alert-success"><%=thanhCong %></div>
			                    	<%
			                    		session.removeAttribute("thanhCong");
			                    		}
				                    	String thatBai = (String)session.getAttribute("thatBai");
				                    	if(  thatBai != null ){
			                    	%>
			                    		<div class="col-xs-12 alert alert-danger"><%=thatBai %></div>
			                    	<%
			                    		session.removeAttribute("thatBai");
			                    	}
			                    	%>
			                    	
			                    	<%
				            			KhachHang khachHang = (KhachHang) session.getAttribute("TaiKhoan");
				            			if( khachHang != null ){
			                    	%>
									<form method="post" action="/SachKyAnh/userCapNhatTaiKhoan" id="formCN" onsubmit="return validation();" class="form-horizontal">
										<div class="form-group">
							                <label for="name" class="col-sm-3 control-label">Họ tên<span class="warning"> (*)</span></label>
							                <div class="col-sm-9">
							                    <input type="text" class="form-control" name="hoten" id="hoten" value="<%=khachHang.getTenKH() %>" />
							                    <span id="errorHoten" class="col-xs-12 error warning"></span>
							                </div>
							            </div>
							            <div class="form-group">
							            	<label for="pwd" class="col-sm-3 control-label">Mật khẩu<span class="warning"> (*)</span></label>
							            	<div class="col-sm-9">
							            		<input type="password" class="form-control" name="matkhau" id="matkhau" placeholder="Vui lòng nhập mật khẩu cần thay đổi" >
							            		<span id="errorMatkhau" class="col-xs-12 error warning"></span>
							            	</div>
							            </div>
							            <div class="form-group">
							            	<label for="rePassword" class="col-sm-3 control-label">Nhập lại mật khẩu<span class="warning"> (*)</span></label>
							            	<div class="col-sm-9">
							            		<input type="password" class="form-control" name="nlMatkhau" id="nlMatkhau" placeholder="Nhập lại mật khẩu" >
							            		<span id="errorNlMatkhau" class="col-xs-12 error warning"></span>
							            	</div>
							            </div>
							            <div class="form-group">
							            	<label for="email" class="col-sm-3 control-label">Email<span class="warning"> (*)</span></label>
							            	<div class="col-sm-9">
							            		<input type="email" class="form-control" name="email" id="email" value="<%=khachHang.getEmail() %>" >
							            		<span id="errorEmail" class="col-xs-12 error warning"></span>
							            	</div>
							            </div>
							            <div class="form-group">
							            	<label for="dienthoai" class="col-sm-3 control-label">Điện thoại<span class="warning"> (*)</span></label>
							            	<div class="col-sm-9">
							            		<input type="text" class="form-control" name="dienthoai" id="dienthoai" value="<%=khachHang.getDienThoai() %>" >
							            		<span id="errorDienthoai" class="col-xs-12 error warning"></span>
							            	</div>
							            </div>
							            <div class="form-group form-inline">
							            	<label for="" class="col-sm-3 control-label">Giới Tính</label>
							            	<div class="col-sm-9">
							            		<%
							            			String gioiTinh = khachHang.getGioiTinh(); 
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
							            	<label for="ngaysinh" class="col-sm-3 control-label">Ngày sinh<span class="warning"> (*)</span></label>
							            	<div class="col-sm-9">
							            		<%
							            			Date ngaySinhDB = khachHang.getNgaySinh();
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
							            	<label for="diachi" class="col-sm-3 control-label">Địa chỉ<span class="warning"> (*)</span></label>
							            	<div class="col-sm-9">
							            		<input type="text"class="form-control" name="diachi" id="diachi" value="<%=khachHang.getDiaChi() %>" >
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
									<%
			                    		}
									%>
			                    </div>
							</div>
						</div>
						<!-- kt phần nội dung trang -->
					</div>
				</div>
			</div>
		</section>
		<!-- kt phần nội dung sản phẩm -->

		<!-- phần footer  -->
		<jsp:include page="block/footer.jsp" />
		<!-- kt footer  -->
	</div>
</body>
</html>