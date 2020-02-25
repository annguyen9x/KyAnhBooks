var tt_anh=1;
xu_li(tt_anh); 
//Hàm xử lý khi bấm nút di chuyển tiếp/ quay lại
function Chuyen_slide(n){ 
	tt_anh=tt_anh + n;
	xu_li(tt_anh); 
}
function xu_li(m){
	var i;
	var x=document.getElementsByClassName("slide");
	if( m < 1 )
		tt_anh = x.length;
	if( m > x.length )
		tt_anh = 1;
	for(i=0; i < x.length; i++)
	{
		x[i].style.display="none";
	}
	x[tt_anh-1].style.display="inline";
}
//Hàm tự động chuyển slide cứ sau mỗi 3(s),có tác dụng cả khi bấm nút di chuyển...
setInterval(function(){ Chuyen_slide(1);} , 3000);