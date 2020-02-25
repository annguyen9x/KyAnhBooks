
function ktSuaSach(){
	var hople = true;
	$(".error").empty();

	//masach 6 ký tự
	var masach = (document.getElementById("masach").value).trim();
	if( masach.length != 6)
	{
		document.getElementById("errorMaSach").innerHTML="Mã sách gồm 6 ký tự !";
		document.getElementById("masach").focus();
		hople= false;
	}

	//tensach tối đa 100 ký tự, không được rỗng
	var tensach = (document.getElementById("tensach").value).trim();
	if( tensach=="" || tensach.length > 100)
	{
		document.getElementById("errorTenSach").innerHTML="Tên sách không được rỗng, tối đa 100 ký tự !";
		if( hople ){
			document.getElementById("tensach").focus();
		}
		hople = false;
	}
	
	//dongia là kiểu số, không được rỗng
	var dongia = (document.getElementById("dongia").value).trim();
	if( dongia == "" || isNaN(dongia)==true )
	{
		document.getElementById("errorDonGia").innerHTML="Đơn giá là kiểu số, không được rỗng !";
		if( hople ){
			document.getElementById("dongia").focus();
		}
		hople = false;
	}

	//noidungsach tối đa 4000 ký tự, không được để trống	
	var noidungsach = (CKEDITOR.instances["noidungsach"].getData()).trim();
	if(noidungsach == "" || noidungsach.length > 4000 )
	{
		document.getElementById("errorNoiDung").innerHTML="Nội dung không được để trống, tối đa 4000 ký tự !";
		if( hople ){
			CKEDITOR.instances["noidungsach"].focus();
		}
		hople = false;
	}
	
	//tacgia không được để trống, tối đa 100 ký tự
	var tacgia=(document.getElementById("tacgia").value).trim();
	if(tacgia == "" || tacgia.length > 100)
	{
		document.getElementById("errorTacGia").innerHTML = "Tác giả không được rỗng, tối đa 100 ký tự !";
		if ( hople ){
			document.getElementById("tacgia").focus();
		}
		hople = false;
	}

	//namxuatban không được để trống, phải là kiểu số
	var namxuatban=(document.getElementById("namxuatban").value).trim();
	if(namxuatban == "" || isNaN(namxuatban)== true)
	{
		document.getElementById("errorNamXB").innerHTML = "Năm xuất bản phải là kiểu số !";
		if ( hople ){
			document.getElementById("namxuatban").focus();
		}
		hople = false;
	}

	//nxb không được để trống, tối đa 100 ký tự
	var nxb=(document.getElementById("nxb").value).trim();
	if(nxb == "" || nxb.length > 100)
	{
		document.getElementById("errorNXB").innerHTML = "NXB không được để trống, tối đa 100 ký tự !";
		if ( hople ){
			document.getElementById("nxb").focus();
		}
		hople = false;
	}

	// alert("Bạn chưa điền đúng thông tin, vui lòng nhập lại !");
	return hople;
}	
