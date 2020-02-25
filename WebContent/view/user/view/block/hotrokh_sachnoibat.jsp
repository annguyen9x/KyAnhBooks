<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Sach" %>
<%@ page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="url" value="/view/user"></c:url>

<div class="hotrokh_sachNoiBat">
	<div class="col-md-12 col-sm-12 col-xs-12 padding-0 my_border hotro_kh">
		<div class="top">
			<h2>
				<span class="text-title">
					Hỗ trợ khách hàng
				</span> 
			</h2>
		</div>
		<!-- nd  -->
		<div class="col-md-12 col-sm-12 col-xs-12 padding-0 grid_group_htkh">
			<div class="group_hotrokh">
				<ul>
					<li class="list-li">
						
						<span><i class='fa fa-commenting' style="color:#70ba28;"></i> Tư vấn bán hàng 24/7
						</span>

					</li>
					<li class="list-li">
						<span>
							<span class="glyphicon glyphicon-phone" style="color:#ed4c4c;"></span>
							(84)34.724.4142
						</span>
					</li>
					<li class="list-li">
						<span class="glyphicon glyphicon-phone-alt" style="color:#ff5400;"></span>
						<span>(84)92.910.9072</span>
					</li>
					<li class="list-li">
						<span>
							<span class="fa fa-envelope" style="color:#15aabf;"></span>
							kyanhbooks@gmail.com
						</span>
					</li>
				</ul>
			</div>
		</div>
		<!-- kt nd  -->
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12 padding-0 my_border sp_cungloai sachNoiBat">
		<div class="top">
			<h2>
				<a href="#" class="text-a">
					Sách nổi bật
				</a> 
			</h2>
		</div>
		<%
			List<Sach> sachNoiBat = (List<Sach>)application.getAttribute("SachNoiBat");
			for(int i = 0; i < sachNoiBat.size(); i++ ){
				Sach sach = sachNoiBat.get(i);
		%>
			<div class="col-md-12 col-sm-12 col-xs-12 padding-0 grid_group_sp">
				<div class="group_sp">
					<div class="anh_sp">
						<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach() %>" class="">
							<img class="anh" src="${url}/static/img/sanpham/<%=sach.getUrlHinh() %>" title="sp" alt="anhsp">
							<%
							int soLuongDB;
							Map<String, Object> gioHang = (Map)session.getAttribute("GioHang");
							if( gioHang== null ){
								soLuongDB = sach.getSoLuong();
							}
							else{
								Map<String, Object> danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
								if( danhSachChiTietGioHang.get(sach.getMaSach())== null ){
									soLuongDB = sach.getSoLuong();
								}
								else{
									Map<String, Integer> chiTiet = (Map<String, Integer>)danhSachChiTietGioHang.get(sach.getMaSach());
									soLuongDB = chiTiet.get("SoLuongDB");
									if(soLuongDB > sach.getSoLuong()){
										soLuongDB = sach.getSoLuong();
									}
								}
							}
							if(soLuongDB >= 1){
							%>
								<a href="/SachKyAnh/ThemSachVaoGioHang?MaSach=<%=sach.getMaSach() %>&SoLuong=1" class="them_gh text-a" >
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<span class="text"> Thêm vào giỏ</span>
								</a>
							<%
							}
							%>
						</a>
					</div>
					<div class="tensp_giasp">
						<h3 class="tensp">
							<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach() %>" class="text-a">
								<%=sach.getTenSach() %>
							</a>
						</h3>	
						<div class="giasp">
							<span class="gia_goc">
								<%
									NumberFormat numberFormat = new DecimalFormat("###,###,###");
									out.print(numberFormat.format(sach.getDonGia()));
								%> đ
							</span>
							<a href="/SachKyAnh/ChiTietSach?MaSach=<%=sach.getMaSach() %>" class="chi_tiet">
								Chi Tiết
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- kt sản phẩm  -->
		<%
			}
		%>
		<!-- </div> -->
	</div>
</div>