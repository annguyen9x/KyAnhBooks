 $(document).ready(function(){
 	var tag = document.getElementById('top_menu_an');
 	tag.onclick = changeMenuAn;
 });

 var co = false;
 function changeMenuAn(){
 	if( co == false ){
 		$('.an_menu').attr("class","main_menu_sp collapse navbar-collapse hien_menu");
 		co = true;
 	}else{
 		$('.hien_menu').attr("class","main_menu_sp collapse navbar-collapse an_menu");
 		co = false;
 	}
 }