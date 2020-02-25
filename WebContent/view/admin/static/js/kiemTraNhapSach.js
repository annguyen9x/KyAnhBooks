function ktNhapSach(){
	var hople = true;
	$(".error").empty();

	//manhapsach 6 ký tự
	var manhapsach = (document.getElementById("manhapsach").value).trim();
	if( manhapsach.length != 6)
	{
		document.getElementById("errorMaNhapSach").innerHTML="Mã nhập sách gồm 6 ký tự !";
		document.getElementById("manhapsach").focus();
		hople= false;
	}

	//dongia là kiểu số, không được rỗng
	var soluong = (document.getElementById("soluong").value).trim();
	if( soluong == "" || isNaN(soluong)==true )
	{
		document.getElementById("errorSoLuong").innerHTML="Số lượng là kiểu số, không được rỗng !";
		if( hople ){
			document.getElementById("soluong").focus();
		}
		hople = false;
	}

	//ngaynhap không được rỗng
	var ngaynhap = (document.getElementById("ngaynhap").value).trim();
	if( soluong == "" )
	{
		document.getElementById("errorNgayNhap").innerHTML="Ngày nhập không được rỗng !";
		if( hople ){
			document.getElementById("ngaynhap").focus();
		}
		hople = false;
	}

	// alert("Bạn chưa điền đúng thông tin, vui lòng nhập lại !");
	return hople;
}	
