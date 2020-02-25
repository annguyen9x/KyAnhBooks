
function ktThemSuaLoaiSach(){
	var hople = true;
	$(".error").empty();

	//maloaisach 4 ký tự
	var maloaisach = (document.getElementById("maloaisach").value).trim();
	if( maloaisach.length != 4)
	{
		document.getElementById("errorMaLoaiSach").innerHTML="Mã loại sách gồm 4 ký tự !";
		document.getElementById("maloaisach").focus();
		hople= false;
	}

	//tenloaisach tối đa 100 ký tự, không được rỗng
	var tenloaisach = (document.getElementById("tenloaisach").value).trim();
	if( tenloaisach=="" || tenloaisach.length > 100)
	{
		document.getElementById("errorTenLoaiSach").innerHTML="Tên loại sách không được rỗng, tối đa 100 ký tự !";
		if( hople ){
			document.getElementById("tenloaisach").focus();
		}
		hople = false;
	}
	
	// alert("Bạn chưa điền đúng thông tin, vui lòng nhập lại !");
	return hople;
}	
