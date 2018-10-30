<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>side navigation</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<style type="text/css">
body , ul{
padding: 0;
margin: 0;
}
ul{
list-style: none;
}
a{
text-decoration: none;
color: black;
}
p{
font-size: 15px;
}
hr{
width: 90%;
}

#nav{
background-color:white;
width: 200px;
font-weight: bold;
color: #757575;
text-align: center;
position: fixed;
height: 100%;
top: 0px;
border-left:1px solid #ddd;
box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
z-index: 19999999;
}
#nav_wrap{
display: block;
width: 100%;
height: 80%;
margin: 170px 0;
}
#nav_search{
display: block;
width: 100%;
height: 30px;
margin: 30px auto;
}
#nav_search > #nav_search_keyword{
float: left; 
width: 85%;
height: 20px;
border-radius: 4px;
}

#nav_search #search_btn{
border: none;
float: right;
visibility: hidden;
}

#nav_search label{
font-size: 10px;
}

#nav_cls_btn{
background-color: black;
width:20px;
height: 70px;
padding: 24px 0;
box-sizing: border-box;
position: absolute;
right: -20px;
top:400px;
}
#nav_cls_btn > i{
color: white;
font-size: 20px;
}

#nav_kakaoinfo{

display: block;
width: 80%;
height: 170px;
margin: 0 auto;
}
#nav_kakaoinfo > a > img{

width: 130px;
height: 105px;
display: block;
}


#nav_snslink{
display:block;
width: 70%;
margin: 20px auto;
}
#nav_snslink > *{
font-size: 35px;
}

#nav_bank_info{
display:block;
width: 70%;
margin: 0 auto;

}

#nav_bank_info > img{
width: 30px;
margin-right: 5px;
vertical-align: middle;
}
#nav_bank_info #only_p {
display: inline-block;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var state = false;
	
	$("#arrowRight").css("display" , "none");
	$("#nav_cls_btn").on("click" ,  function() {
		if(!state){
			$("#nav").animate({left:'-170px'}, 200);
			$("#arrowLeft").css("display" , "none");
			$("#arrowRight").css("display" , "inline-block");
			
			
		}else{
			$("#nav").animate({left:'0'}, 200);
			$("#arrowRight").css("display" , "none");
			$("#arrowLeft").css("display" , "inline-block");
			
		}
		state = !state;
		
	});
	
	
});




</script>
</head>
<body>
<nav id="nav">
 <div id="nav_cls_btn">
	<i class="fa fa-chevron-left" id="arrowLeft"></i>
	<i class="fa fa-chevron-right" id="arrowRight" style="display: none;"></i>
 </div>
	
	
	
<div id="nav_wrap">
	<div id="nav_search">
	
		<form action="" ></form>				
		<input id="nav_search_keyword" type="text" placeholder="검색어를 입력하세요">
		<span><i class="fab fa-searchengin"></i></span>
		<input id="search_btn" type="submit" value="검색">
	
	</div>
	
	<div id="nav_kakaoinfo">
	  <a href="#"><img alt="kakaotalk_img" src="../resources/img/kakaotalk_nav_img.png"></a>
		<span>카카오톡 ID</span>
		<span>ShowOFF</span>
	</div>
	<hr>
	

	<div id="nav_snslink">
		<ul>
			<li><a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-square"></i></a></li>
			<li><a href="https://www.instagram.com/?hl=ko" target="_blank"><i class="fab fa-instagram"></i></a></li>
			<li><a href="https://twitter.com/?lang=ko" target="_blank"><i class="fab fa-twitter"></i></a></li>
			<li><a href="https://kr.linkedin.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
		</ul>
	</div>
	<hr>
	
	
	<div id="nav_bank_info">
		<img alt="kakaob img" src="../resources/img/kakaoBank.jpg"><p id="only_p">카카오 뱅크</p>
		<p>3333-07-80999747</p>
		<p>예금주:SHOWOFF</p>
	</div>
</div>











</nav>




</body>
</html>