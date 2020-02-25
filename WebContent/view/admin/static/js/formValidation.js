
function validation(){
	var hople = true;
	$(".error").empty();

	//Họ tên từ 2 đến 25 ký tự
	var hoten = (document.getElementById("hoten").value).trim();
	if( hoten.length < 2 || hoten.length > 25)
	{
		document.getElementById("errorHoten").innerHTML="Tên phải từ 2 đến 25 ký tự !";
		document.getElementById("hoten").focus();
		hople= false;
	}

	//Mật khẩu tối thiểu 6 ký tự
//	var mk = (document.getElementById("matkhau").value).trim();
//	if(mk.length < 6)
//	{
//		document.getElementById("errorMatkhau").innerHTML="Mật khẩu phải từ 6 ký tự !";
//		if( hople ){
//			document.getElementById("matkhau").focus();
//		}
//		hople = false;
//	}
	
	//Mật khẩu nhập lại phải khớp với mật khẩu
//	var nlMatkhau = (document.getElementById("nlMatkhau").value).trim();
//	if(nlMatkhau != mk)
//	{
//		document.getElementById("errorNlMatkhau").innerHTML="Mật khẩu nhập lại chưa đúng !";
//		if( hople ){
//			document.getElementById("nlMatkhau").focus();
//		}
//		hople = false;
//	}

	//Email phải đúng định dạng
	var email=(document.getElementById("email").value).trim();
	var reg_mail=/^[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*@[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*(\.[A-Za-z]+)+$/;
	if(reg_mail.test(email) == false)
	{		
		document.getElementById("errorEmail").innerHTML="Địa chỉ email không hợp lệ !";
		if( hople ){
			document.getElementById("email").focus();
		}
		hople = false;
	}
	
	//Số dt phải là dữ liệu kiểu số, không được để trống	
	var dt = (document.getElementById("dienthoai").value).trim();
	if(isNaN(dt) == true || dt.length != 10 )
	{
		document.getElementById("errorDienthoai").innerHTML="Điện thoại phải là kiểu số (10 số) !";
		if( hople ){
			document.getElementById("dienthoai").focus();
		}
		hople = false;
	}
	
	//Kiểm tra ngày tháng năm hợp lệ
	var ngay = document.getElementById("ngaysinh").value;
	var thang = document.getElementById("thangsinh").value;
	var nam = document.getElementById("namsinh").value;
	if( (thang == 4 || thang == 6 || thang == 9 || thang == 11) && ngay > 30)
	{
			document.getElementById("errorNgaysinh").innerHTML="Ngày sinh không đúng !";
			if( hople ){
				document.getElementById("ngaySinh").focus();
			}
			hople = false;
	}
	if( (nam % 400 == 0 ) || ( nam % 4 == 0 && nam % 100 != 0) )//năm nhuận tháng 2 có 29 ngày
	{
		if( thang == 2 && ngay > 29  )
		{
			document.getElementById("errorNgaysinh").innerHTML="Ngày sinh không đúng !";
			if( hople ){
				document.getElementById("ngaySinh").focus();
			}
			hople = false;
		}
	}
	else//năm không nhuận tháng 2 có 28 ngày
	{
		if(thang == 2 && ngay > 28 )
		{
			
			document.getElementById("errorNgaysinh").innerHTML="Ngày sinh không đúng !";
			if ( hople ){
				document.getElementById("ngaySinh").focus();
			}
			hople = false;
		}
	}

	//Địa chỉ không được để trống, tối đa 200 ký tự
	var dc=(document.getElementById("diachi").value).trim();
	if(dc == "" || dc.length > 200)
	{
		document.getElementById("errorDiachi").innerHTML = "Địa chỉ không được rỗng, tối đa 200 ký tự !";
		if ( hople ){
			document.getElementById("diachi").focus();
		}
		hople = false;
	}
	// alert("Bạn chưa điền đúng thông tin, vui lòng nhập lại !");
	return hople;
}	
