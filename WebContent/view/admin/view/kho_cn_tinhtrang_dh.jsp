<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NguoiNhanHang"%>
<%@page import="model.HoaDon"%>
<%@page import="model.NhanVien"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
</head>
<body>
	<%
	NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
	List dsDonHangVaKhachHang = (List)session.getAttribute("DsDonHangVaKhachHang");
	Map<Integer, NhanVien> mapNVGiaoHang = (Map<Integer, NhanVien>)session.getAttribute("MapNVGiaoHang");
	String dsDonHangChon = (String)session.getAttribute("DsDonHangChon");
	if( dsDonHangChon == null ){
		dsDonHangChon = "Đang chuẩn bị hàng";
	}
	if( dsDonHangVaKhachHang != null && nhanVien != null ){
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
						<li><a href="/SachKyAnh/KhoCapNhatTTDH" class="active"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
						<li><a href="/SachKyAnh/KhoNhapSach"><i class="fa fa-edit"></i> Nhập sách</a></li>
						<li><a href="/SachKyAnh/KhoCapNhatTaiKhoan"><i class="fa fa-address-book"></i> Cập nhật tài khoản</a></li>
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
					<section class="content">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Cập nhật tình trạng đơn hàng</p>
							<div class="tim_kiem">
								<form action="/SachKyAnh/KhoCapNhatTTDH" method="post" accept-charset="utf-8">
									<div class="col-md-4 col-sm-5 col-xs-12 col-md-offset-3 col-md-offset-3" style="padding:0px; ">
										<select name="DsDonHangChon" class="form-control">
											<%
												if( dsDonHangChon.equals("Đang chuẩn bị hàng") ){
											%>
												<option value="Đang chuẩn bị hàng" selected="selected">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Giao hàng thành công">Giao hàng thành công</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
											<%
												}
												else if( dsDonHangChon.equals("Đợi người giao lấy hàng") ){
											%>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng" selected="selected">Đợi người giao lấy hàng</option>
												<option value="Giao hàng thành công">Giao hàng thành công</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
											<%
												}
												else if( dsDonHangChon.equals("Giao hàng thành công") ){
											%>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Giao hàng thành công" selected="selected">Giao hàng thành công</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
											<%
												}
												else if( dsDonHangChon.equals("Trả lại hàng") ){
											%>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Giao hàng thành công">Giao hàng thành công</option>
												<option value="Trả lại hàng" selected="selected">Trả lại hàng</option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-md-2 col-sm-3 col-xs-12" style="padding:0px; ">
										<button type="submit" class="btn">Xem danh sách</button>
									</div>
								</form>
							</div>
							<div class="bang">
								<%
									String TrangThaiXuLyCapNhatTTDH = (String)session.getAttribute("TrangThaiXuLyCapNhatTTDH");
									if(TrangThaiXuLyCapNhatTTDH != null){
										List DsDHCNTTDHloi = (List)session.getAttribute("DsDHCNTTDHloi");
										if( DsDHCNTTDHloi != null ){
								%>
											<div class="alert alert-danger">
												<p><strong>Cập nhật tình trạng đơn hàng bị lỗi.</strong> Các đơn hàng cập nhật bị lỗi là: </p>
												<%
													for(int i=0; i< DsDHCNTTDHloi.size(); i++){
														out.print(DsDHCNTTDHloi.get(i)+",");
													}
												%>
											</div>
								<%			
											session.removeAttribute("DsDHCNTTDHloi");
										}
										else{
								%>	
											<div class="alert alert-success">
												<p><strong>Cập nhật tình trạng đơn hàng thành công !</strong></p>
											</div>
								<%		
										}
										session.removeAttribute("TrangThaiXuLyCapNhatTTDH");
									}
								%>
								<form action="/SachKyAnh/KhoXuLyCapNhatTTDH" method="post" accept-charset="utf-8">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Mã Đơn Hàng</th>
												<th>Người Nhận</th>
												<th>Nhân Viên Giao Hàng</th>
												<th>Tình Trạng Đơn Hàng</th>
												<th>Ngày Đặt</th>
											</tr>
										</thead>
										<tbody>
											<%
												boolean dhTrongDanhSach = false;
												for(int i=0; i< dsDonHangVaKhachHang.size(); i++){
													Map<String, Object> chiTietDonHang = (Map<String, Object>)dsDonHangVaKhachHang.get(i);
													NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)chiTietDonHang.get("NguoiNhanHang");
													HoaDon hoaDon = (HoaDon)chiTietDonHang.get("HoaDon");
													if (hoaDon != null && nguoiNhanHang != null ){
														if( dsDonHangChon.equals(hoaDon.getTinhTrangDH()) ){
															dhTrongDanhSach = true;
											%>
														<tr>
															<td style="font-weight:bold; ">
																<a href="/SachKyAnh/KhoThongTinDH?SoHD=<%=hoaDon.getSoHD()%>">
																	<%=hoaDon.getSoHD() %>
																</a>
															</td>
															<td><%=nguoiNhanHang.getTenNN() %></td>
															<td>
																<%
																	NhanVien nhanVienGH = mapNVGiaoHang.get(hoaDon.getMaNVGiao());
																	out.print(nhanVienGH.getTenNV());
																%>
															</td>
															<td>
																<input type="hidden" name="SoHD" value="<%=hoaDon.getSoHD()%>">
																<table class="table"  style="border:none; margin:0px;">
																	<%
																		if( dsDonHangChon.equals("Đang chuẩn bị hàng") ){
																	%>
																		<tr>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="1" checked="checked">Đang chuẩn bị hàng
																			</td>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="2">Đợi người giao lấy hàng
																			</td>
																		</tr>
																	<%
																		}
																		else if( dsDonHangChon.equals("Đợi người giao lấy hàng") ){
																	%>
																		<tr>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="2" checked="checked">Đợi người giao lấy hàng
																			</td>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="3">Đang giao hàng
																			</td>
																		</tr>
																	<%
																		}
																		else if( dsDonHangChon.equals("Giao hàng thành công") ){
																	%>
																		<tr>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="4" checked="checked">Giao hàng thành công
																			</td>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="5">Hoàn tất
																			</td>
																		</tr>
																	<%
																		}
																		else if( dsDonHangChon.equals("Trả lại hàng") ){
																	%>
																		<tr>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="6" checked="checked">Trả lại hàng
																			</td>
																			<td style="border:none; padding:0px;">
																				<input type="radio" name="TinhTrangDH<%=hoaDon.getSoHD() %>" value="7">Trả lại hàng về kho
																			</td>
																		</tr>
																	<%
																		}
																	%>
																</table>
															</td>
															<td><%=hoaDon.getNgayDat() %></td>
														</tr>
													<%	
															}
														}
														else{
															response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
														}
													}
													if( dhTrongDanhSach == false){
													%>
													<tr>
														<td colspan="5" class="alert alert-warning text-center">Không có đơn hàng nào trong danh sách !</td>
													</tr>
											<%
												}
											%>
										</tbody>
									</table>
									<div class="nut" style="text-align:center;">
										<a class="btn btn-default" href="/SachKyAnh/KhoTrangChu">Thoát</a>
										<button type="submit" class="btn mybtn" style="background:#F47920; color:#fff;">Lưu</button>
									</div>
								</form>
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