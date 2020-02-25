
function ktDiaChiGiaoHang(trangThaiDangNhap){
	var hople = true;
	$(".error").empty();
	
	//Nếu chọn: Địa chỉ tài khoản đã đăng ký => kiểm tra đăng nhập
	if( document.getElementById("loaitk_dangky").checked == true && trangThaiDangNhap == "chuaDN"){
		hople = false;
		alert('Bạn chọn "địa chỉ tài khoản đăng ký" nhưng chưa đăng nhập, mời đăng nhập !');
		return hople;
	}
	
	//Nếu chọn: Giao hàng địa chỉ khác, mà không đăng nhập 
	if( document.getElementById("loaitk_nguoikhac").checked == true && trangThaiDangNhap == "chuaDN"){
		hople = false;
		alert('Bạn chưa đăng nhập, mời đăng nhập trước !');
		return hople;
	}
	
	//Nếu chọn: Giao hàng địa chỉ khác, va da dang nhap => kiểm tra các thẻ input
	if( document.getElementById("loaitk_nguoikhac").checked == true && trangThaiDangNhap == "DaDN" ){
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
