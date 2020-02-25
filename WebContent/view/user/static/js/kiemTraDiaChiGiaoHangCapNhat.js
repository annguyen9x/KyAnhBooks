
function ktDiaChiGiaoHangCapNhat(){
	var hople = true;
	$(".error").empty();
	
	//Nếu chọn: Giao hàng địa chỉ khác => kiểm tra các thẻ input
	if( document.getElementById("loaitk_nguoikhac").checked == true ){
	 	//Họ tên từ 2 đến 25 ký tự
	 	var hoten = document.getElementById("hoten2").value;
	 	if( hoten.length < 2 || hoten.length > 25)
	 	{
	 		document.getElementById("errorHoten2").innerHTML="Tên phải từ 2 đến 25 ký tự !";
	 		document.getElementById("hoten2").focus();
	 		hople= false;
	 	}
	
	 	//Số dt phải là dữ liệu kiểu số, không được để trống	
	 	var dt = document.getElementById("dienthoai2").value;
	 	if(isNaN(dt) == true || dt.length != 10 )
	 	{
	 		document.getElementById("errorDienthoai2").innerHTML="Điện thoại phải là kiểu số (10 số) !";
	 		if( hople ){
	 			document.getElementById("dienthoai2").focus();
	 		}
	 		hople = false;
	 	}
		
	 	//Địa chỉ không được để trống, tối đa 200 ký tự
	 	var dc=document.getElementById("diachi2").value;
	 	if(dc == "" || dc.length > 200)
	 	{
	 		document.getElementById("errorDiachi2").innerHTML = "Địa chỉ không được rỗng, tối đa 200 ký tự !";
	 		if ( hople ){
	 			document.getElementById("diachi2").focus();
	 		}
	 		hople = false;
	 	}
	 	
		return hople;
	 }
	
}	
