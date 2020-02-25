
function diaChiGiaoHangTheoLoaiTaiKhoan(evt, loaiTaiKhoan){
	var i, giaban, nam_xb;
	thongTinGiaoHang = document.getElementsByClassName("thongtin_giaohang");
 
	//ẩn tất cả thongTinGiaoHang
	for(i=0; i < thongTinGiaoHang.length ; i++){
		thongTinGiaoHang[i].style.display = "none";
	}

	//loaiTaiKhoan được chọn hiển thị giá tương ứng
	document.getElementById(loaiTaiKhoan).style.display = "block";
}
document.getElementById("loaitk_diachicu").click();//hiển thị giá mặc định 




