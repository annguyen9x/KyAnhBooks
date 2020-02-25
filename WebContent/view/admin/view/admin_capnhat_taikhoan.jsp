<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@page import="model.NhanVien"%>
<%@page import="java.util.List" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị cập nhật tài khoản</title>
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
	List<NhanVien> dsNhanVien = (List<NhanVien>)session.getAttribute("DsNhanVien");
	String LoiXoaNhanVien = (String)session.getAttribute("LoiXoaNhanVien");
	NumberFormat numberFormat = new DecimalFormat("###,###,###");
	if( nhanVien != null && dsNhanVien != null ){
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
							<p class="tieude_bang">Cập nhật nhân viên</p>
							<div class="bang">
								<table class="table table-bordered">
									<thead class="bg_xanhla">
										<tr class="text-center">
											<th style="white-space:nowrap">Mã NV</th>
											<th style="white-space:nowrap">Tên nhân viên</th>
											<th style="white-space:nowrap">Chức vụ</th>
											<th style="white-space:nowrap">Email</th>
											<th style="white-space:nowrap">Điện thoại</th>
											<th style="white-space:nowrap">Giới tính</th>
											<th style="white-space:nowrap">Ngày sinh</th>
											<th style="white-space:nowrap">Địa chỉ</th>
											<th colspan="2" class="text-center">
												<a type="button" href="/SachKyAnh/AdminThemTaiKhoanNhanVien" class="btn btn-default" style="background:#F47920; color:#fff">Thêm nhân viên</a>
											</th>
										</tr>
									</thead>
									<tbody>
										<%
										for(int i= 0; i < dsNhanVien.size(); i++){
											NhanVien nv = dsNhanVien.get(i);
										%>
											<tr>
												<th><%=nv.getMaNV()%></th>
												<th><%=nv.getTenNV()%></th>
												<th><%=nv.getChucVu()%></th>
												<th><%=nv.getEmail()%></th>
												<th><%=nv.getDienThoai()%></th>
												<th><%=nv.getGioiTinh()%></th>
												<th><%=nv.getNgaySinh()%></th>
												<th><%=nv.getDiaChi()%></th>
												<th class="text-center">
													<a type="button" href="/SachKyAnh/AdminSuaTaiKhoanNhanVien?MaNV=<%=nv.getMaNV() %>" class="btn btn-primary">Sửa</a>
												</th class="text-center">
												<th>
													<a type="button" onclick="return xacNhanXoaNhanVien();" href="/SachKyAnh/AdminXoaTaiKhoanNhanVien?MaNV=<%=nv.getMaNV() %>" class="btn btn-danger" style="color:#111">Xóa</a>
													<script type="text/javascript">
														function xacNhanXoaNhanVien(){
															var xacNhan = confirm("Bạn có chắc chắn muốn xóa nhân viên này không ?");
															if( xacNhan == true ){
																return true;
															}else{
																return false;
															}
														}		
													</script>
												</th>
											</tr>
										<%
										}
										%>
									</tbody>
								</table>
								<%
								if(LoiXoaNhanVien != null){
								%>
									<script type="text/javascript">
										alert('Lỗi khóa ngoại khi xóa nhân viên, vui lòng xóa nhân viên có ở các table bên một trước !');
									</script>
								<%
									session.removeAttribute("LoiXoaNhanVien");
								}
								%>
							</div>
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