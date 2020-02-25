<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="model.HoaDon" %>
<%@page import="model.KhachHang" %>
<%@page import="model.NguoiNhanHang"%>
<%@page import="model.Sach" %>
<%@page import="model.ChiTietHoaDon" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Xem đơn hàng</title>
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

		<section class="main_center">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-offset-3 padding-0 main_title_line">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<span>Xem đơn hàng</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<form method="post" action="/SachKyAnh/XemDonHang" class="form-inline">
						            <div class="form-group">
					            		<label>Nhập mã đơn hàng </label>
					            		<input type="text" class="form-control" name="maDH" placeholder="Mã số đơn hàng (VD:10000001)" size="30" required="required">
						            </div>
					            	<button type="submit" class="btn">Xem ngay</button>
								</form>
								<%
									Map<String, Object> thongTinDonHang = (Map<String, Object>)session.getAttribute("ThongTinDonHang");
									String trangThai = (String)session.getAttribute("TrangThai");
									if( ((thongTinDonHang != null && thongTinDonHang.size() == 0) && (trangThai != null && trangThai.equals("DaTimKiemDH"))) || (thongTinDonHang == null && trangThai != null && trangThai.equals("DaTimKiemDH")) ){
								%>
									<div class="alert alert-danger">
										<strong>Không tìm thấy đơn hàng trong hệ thống.</strong> Vui lòng kiểm tra lại mã đơn hàng của bạn !
									</div> 
								<%
										session.removeAttribute("TrangThai");
									}
									if( thongTinDonHang != null && thongTinDonHang.size() > 0 ){
										HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
										NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)thongTinDonHang.get("NguoiNhanHang");
										KhachHang khachHang = (KhachHang)thongTinDonHang.get("KhachHang");
										
										List<HashMap> dsChiTietHoaDonBan = (List<HashMap>)thongTinDonHang.get("DanhSachChiTietHoaDon");
										NumberFormat numberFormat = new DecimalFormat("###,###,###");
								%>
									<!-- thong_tin_dh -->
									<div class="thong_tin_dh">
										<div class="text-center" style="margin-bottom:22px;"><h3>Thông tin chi tiết đơn hàng</h3></div>
										<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px; padding:0px;">
											<div class="col-md-4 col-sm-4 col-xs-12" style="padding:0px;">
												Mã ĐH: <%=hoaDon.getSoHD() %>
											</div>
											<div class="col-md-8 col-sm-8 col-xs-12" style="float:right; padding:0px; text-align:right;">
												<%
												if( hoaDon.getMaKH() != 0 ){
													out.print("Người đặt: " + khachHang.getTenKH() + ", Email: " + khachHang.getEmail());
												}else{
													out.print("Người đặt: Lỗi thông tin người đặt");
												}
												%>
											</div>
										</div>
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>
													Tên sách
													</th>
													<th>
													Hình ảnh
													</th>
													<th>
													Giá
													</th>
													<th>
													Số lượng
													</th>
													<th>
													Thành tiền
													</th>
												</tr>
											</thead>
											<tbody>
												<%
													for(int i = 0; i < dsChiTietHoaDonBan.size() ; i++){
														Map mapSachVaChiTiet = dsChiTietHoaDonBan.get(i);
														ChiTietHoaDon chiTietHoaDon = (ChiTietHoaDon)mapSachVaChiTiet.get("ChiTietHoaDon");
														Sach sach = (Sach)mapSachVaChiTiet.get("Sach");
												%>
														<tr>
															<td class="ten_sp">
															<%=sach.getTenSach() %>
															</td>
															<td class="hinh">
																<img src="${url}/static/img/sanpham/<%=sach.getUrlHinh() %>" alt="anh">
															</td>
															<td class="tien">
																<%=numberFormat.format(chiTietHoaDon.getDonGia()) %> <span class="text_underline">đ</span>
															</td>
															<td class="so_luong">
																<%=chiTietHoaDon.getSoLuong() %>
															</td>
															<td class="tien">
																<%=numberFormat.format(chiTietHoaDon.getDonGia()*chiTietHoaDon.getSoLuong()) %> <span class="text_underline">đ</span>
															</td>
														</tr>
												<%
													}
												%>
											</tbody>
										</table>
										<div class="thongtin_giaohang_tongtien">
											<div class="tong_tien">
												<b>Tổng tiền: </b>
												<span class="tien">
													<%=numberFormat.format(hoaDon.getTongTien()) %> <span class="text_underline">đ</span>
												</span>
											</div>
											<div class="thongtin_giaohang">
												<h4 class="text-center">Thông tin giao hàng</h4>
												<table class="table">
													<tr>
														<td>
															<b>Tên người nhận: </b><%=nguoiNhanHang.getTenNN() %>
														</td>
														<td>
														</td>
													</tr>
													<tr>
														<td>
															<b>Số điện thoại: </b><%=nguoiNhanHang.getDienThoai() %>
														</td>
														<td>
															<b>Ngày đặt: </b>
															<%
																SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
																out.print( simpleDateFormat.format(hoaDon.getNgayDat()) );
															%>
														</td>
													</tr>
													<tr>
														<td>
															<b>Địa chỉ: </b><%=nguoiNhanHang.getDiaChi() %>	
														</td>
														<td>
															<%
																if( hoaDon.getNgayGiao() == null ){
																	Date ngayDat = hoaDon.getNgayDat();
																	
											            			Calendar calendar = Calendar.getInstance();
											            			calendar.setTime(ngayDat);
											            			calendar.add(Calendar.DAY_OF_MONTH, 3);
											            			
											            			String ngayGiao = simpleDateFormat.format(calendar.getTime());
											            			
																	out.print("<b>Ngày giao (dự kiến): </b>" +  ngayGiao);
																}else{
																	String ngayGiao = simpleDateFormat.format(hoaDon.getNgayGiao());
																	out.print("<b>Ngày giao: </b>" + ngayGiao);
																}
															%>
														</td>
													</tr>
													<tr>
														<td>
															<b>Tình trạng đơn hàng: </b><%=hoaDon.getTinhTrangDH() %>
														</td>
														<td>
															<%
																if( hoaDon.getTinhTrangDH().equals("Đợi xác nhận đơn hàng") || hoaDon.getTinhTrangDH().equals("Đang chuẩn bị hàng") || hoaDon.getTinhTrangDH().equals("Đợi người giao lấy hàng")){
																	KhachHang khachHangSession = (KhachHang)session.getAttribute("TaiKhoan");
																	if( khachHangSession != null && khachHang != null && (khachHangSession.getEmail()).equals(khachHang.getEmail()) ){
															%>
																		<a href="/SachKyAnh/XemCapNhatDonHang" class="btn btn-default">Cập nhật đơn hàng?</a>
															<%
																	}else{
															%>
																		<a href="/SachKyAnh/XacNhanEmailDatHang" class="btn btn-default">Cập nhật đơn hàng?</a>
															<%
																	}
																}
															%>
														</td>
													</tr>
												</table>
											</div>
											
										</div>
										<div class="nut" style="margin-top:15px;float: left;">
											<a href="/SachKyAnh/userTrangChu" class="btn btn-default">Trở về trang chủ</a>
										</div>
									</div>
									<!-- kt thong_tin_dh -->
								<%
									}
								%> 
							</div>
						</div>
						<!-- kt phần nội dung trang -->
					</div>
				</div>
			</div>
		</section>

		<!-- phần footer  -->
		<jsp:include page="block/footer.jsp" />
		<!-- kt footer  -->
	</div>
</body>
</html>