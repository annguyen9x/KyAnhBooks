//Hiển thị giá và mã sách (input ẩn) theo namXB
function giaVaMaSachTheoNamXB(evt, namXB, maSach){
	var i, giaban, nam_xb;
	giaban = document.getElementsByClassName("giaban");
	nam_xb = document.getElementsByClassName("nam_xb");
	//ẩn tất cả giá bán
	for(i=0; i < giaban.length ; i++){
		giaban[i].style.display = "none";
	}
	//bỏ tô màu tất cả năm XB sau khi được chọn trước đó
	for(i=0; i < nam_xb.length ; i++){
		nam_xb[i].className = nam_xb[i].className.replace(" active","");
	}
	//tô màu năm XB được chọn + hiển thị giá tương ứng
	evt.currentTarget.className += " active";
	document.getElementById(namXB).style.display = "block";

	//PHẦN ĐỂ TRUYỀN MÃ SÁCH khi submit form
	$('.ma_sach').remove();//Xóa tất cả class="ma_sach" (MaSach, nếu có) trước khi thêm mới
	//Thêm một thẻ cùng cấp (có class="ma_sach") vào sau thẻ có class="so_luong_mua" để gửi MaSach khi click
	$('.sl_mua').after('<input type="hidden" name="MaSach" value="'+ maSach +'" class="ma_sach" />');
}
document.getElementById("hienthiMacDinh").click();//hiển thị giá mặc định Giá, và MaSach




