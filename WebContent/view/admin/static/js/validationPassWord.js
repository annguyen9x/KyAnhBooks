
function validationPass(){
	var hople = true;
	$(".error").empty();

	//Mật khẩu tối thiểu 6 ký tự
	var mk = (document.getElementById("matkhau").value).trim();
	if(mk.length < 6)
	{
		document.getElementById("errorMatkhau").innerHTML="Mật khẩu phải từ 6 ký tự !";
		if( hople ){
			document.getElementById("matkhau").focus();
		}
		hople = false;
	}
	
	//Mật khẩu nhập lại phải khớp với mật khẩu
	var nlMatkhau = (document.getElementById("nlMatkhau").value).trim();
	if(nlMatkhau != mk)
	{
		document.getElementById("errorNlMatkhau").innerHTML="Mật khẩu nhập lại chưa đúng !";
		if( hople ){
			document.getElementById("nlMatkhau").focus();
		}
		hople = false;
	}

	// alert("Bạn chưa điền đúng thông tin, vui lòng nhập lại !");
	return hople;
}	
