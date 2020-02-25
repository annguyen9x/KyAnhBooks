function ktSoLuongMua(soLuongDB, tenSach){
	var hopLe = true;
	var mangSoLuong  = document.getElementsByClassName("sl_mua");
	
	var soLuong = Number(mangSoLuong[0].value);
	
	//Số lượng mua phải là kiểu số, và lớn hơn 0
	if( isNaN(soLuong) == true || soLuong <= 0){
		hopLe = false;
		alert('Số lượng mua phải là kiểu số, lớn hơn 0. Vui lòng kiểm tra lại !');
		return hopLe;
	}

	//Số lượng mua không được vượt quá số lượng trong DB
	if(soLuong > soLuongDB){
		hopLe = false;
		alert('Thêm thất bại. Sách \"' + tenSach+ '\" chỉ còn ' + soLuongDB + ' sản phẩm !');
		return hopLe;
	}
	
	return hopLe;
}