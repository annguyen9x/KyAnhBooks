function ktSoLuongCapNhat(){
	var hopLe = true;
	var mangSoLuong  = document.getElementsByClassName("soLuong");
	var mangTenSach  = document.getElementsByClassName("TenSachHidden");
	var mangSoLuongDB  = document.getElementsByClassName("TongSoLuongDB");
	
	for(var i = 0; i < mangSoLuong.length; i++){
		var soLuong = mangSoLuong[i].value;
		var tongSoLuongDB = parseInt(mangSoLuongDB[i].value);
		var tenSach = mangTenSach[i].value;
		
		//Số lượng mua phải là kiểu số, và lớn hơn 0
		if( isNaN(soLuong) == true || soLuong <= 0){
			alert('Số lượng mua phải là kiểu số, lớn hơn 0. Vui lòng kiểm tra lại !');
			document.getElementsByClassName("soLuong")[i].focus();
			return false;
		}
		
		//Số lượng mua không được vượt quá số lượng trong DB
		if(soLuong > tongSoLuongDB){
			document.getElementsByClassName("soLuong")[i].focus();
			alert('Thêm thất bại. Sách \"' + tenSach + '\" chỉ còn ' + tongSoLuongDB + ' sản phẩm !');
			return false;
		}
	}
	
	return hopLe;
}