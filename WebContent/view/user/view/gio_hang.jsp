<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Giỏ hàng</title>
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
	<!-- header  -->
	<jsp:include page="block/header.jsp" />
	<!-- kt header  -->
	
	<section class="main_center main_sp_cungloai">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 padding-0 main_title_line">
					<!-- phần top -->
					<div class="col-md-12 padding-0 top_nd_trang">
						<div class="top">
							<h2>
								<span>Giỏ hàng</span>
							</h2>
						</div>
					</div>
					<!-- kt phần top -->
					<!-- phần nội dung trang -->
					<div class="col-md-12 padding-0 nd_trang">
						<div class="row margin-0">
							<!-- noi dung gio hang -->
							<section class="gio_hang">
								<%
									Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
									NumberFormat numberFormat = new DecimalFormat("###,###,###,###");
									if( gioHang == null ){
								%>
									<div class="alert alert-danger">
										<strong>Không có sản phẩm nào trong giỏ hàng.</strong> Nhấn <a href="/SachKyAnh/userTrangChu" class="text-a">"Quay lại"</a> để mua hàng !
									</div>
								<%
									}else{
										Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
										if( danhSachChiTietGioHang != null ){
								%>
									<form action="/SachKyAnh/CapNhatGioHang" method="post" onsubmit="return ktSoLuongCapNhat();" id="gioHang" class="form_giohang">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>
													Hình ảnh
													</th>
													<th>
													Tên sách
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
													<th>
													Xóa
													</th>
												</tr>
											</thead>
											<tbody>
												<%
												Iterator iterator = danhSachChiTietGioHang.entrySet().iterator();
												float tongTien = 0;
												while( iterator.hasNext()){
													Map.Entry ketQua = (Map.Entry)iterator.next();	
													Map<String, Object> chiTietGioHang = (Map<String, Object>)ketQua.getValue();
												%>
												<tr>
													<td class="hinh">
														<img src="${url}/static/img/sanpham/<%=chiTietGioHang.get("UrlHinh") %>" alt="anh">
													</td>
													<td class="ten_sp">
														<%=chiTietGioHang.get("TenSach") %>
														<input type="hidden" name="TenSachHidden" value="<%=(String)chiTietGioHang.get("TenSach") %>" class="TenSachHidden" >
													</td>
													<td class="tien">
														<%=numberFormat.format((float)chiTietGioHang.get("DonGia")) %> <span class="text_underline">đ</span>
													</td>
													<td class="so_luong">
														<input type="number" name="soLuong" value="<%=(int)chiTietGioHang.get("SoLuong") %>" class="soLuong">
														<input type="hidden" name="TSLDB" value="<%=(int)chiTietGioHang.get("TongSoLuongDB") %>" class="TongSoLuongDB" >
													</td>
													<td class="tien">
														<%=numberFormat.format((int)chiTietGioHang.get("SoLuong")*(float)chiTietGioHang.get("DonGia")) %> <span class="text_underline">đ</span>
													</td>
													<td class="trash">
														<a href="/SachKyAnh/XoaGioHang?MaSach=<%=ketQua.getKey()%>">
															<span class="glyphicon glyphicon-trash"></span>
														</a>
													</td>
												</tr>
												<%
												 tongTien += (int)chiTietGioHang.get("SoLuong")*(float)chiTietGioHang.get("DonGia");
												}
												%>
											</tbody>
										</table>
										<div class="tong_tien">
											<b>Tổng tiền tạm tính: </b>
											<span class="tien">
												<%=numberFormat.format(tongTien) %> <span class="text_underline">đ</span>
											</span>
										</div>
										<div class="nut">
											<a href="/SachKyAnh/XoaGioHang?MaSach=XoaTatCa" class="btn btn-default mua_them">Xóa giỏ hàng</a>
											<button type="submit" class="btn  btn-default cap_nhat">Cập nhật</button>
											<a href="/SachKyAnh/DatHang" class="btn  btn-default dat_hang">Tiến hành đặt hàng</a>
										</div>
									</form>
									<%
										}
									}
									%>
						 	</section>
						 	<!-- kt noi dung gio hang -->
						</div>
					</div>
					<!-- kt phần nội dung trang -->
				</div>
			</div>
		</div>
	</section>

	<!-- footer  -->
	<jsp:include page="block/footer.jsp" />
	<!-- kt footer  -->
</div>
	<!-- start my js -->
	<script src="${url}/static/js/kiemTraSoLuongCapNhat.js" type="text/javascript" charset="utf-8"></script>
	<!-- start my js -->
</body>
</html>