<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login browser</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

body, ul {
	margin: 0px;
	padding: 0px;
	font-family: 'Nanum Gothic', sans-serif;
}
body{
	/* background-image: linear-gradient(#D7FFF1, #8CD790); */
}
#modal_all{
z-index:101;
position: fixed;
top: 0;
left:0;
width: 30%; 
height:100%;
overflow: auto;
background-color: rgba(0,0,0,0.4);
display: none;
margin: 125px 775px;
}


ul {
	list-style-type: none;
}

a {
	color:#566270;
	text-decoration: none;
}
showoff_index{
overflow: hidden;
position: absolute;
left: -9999px;
width: 0px;
height: 1px;
margin: 0;
padding: 0;
background-color: red;
background-image: linear-gradient(#FDD692, white);
}
showoff_index > a{
display: inherit;
}

#wrap{
position: relative;
/* width:635px; */
height: 100%;
min-height: 700px;
/* margin: 151px auto; */
background-color: #F8F8FF;
opacity: 0.9;
/* z-index: 190000; */
}
#close_btn{
position: absolute;
right: 10px;
top: 9px;
color: black!important;
font-size: 25px;
padding: 5px;
display: block;
}
#close_btn:hover{
background-color: #ccc;
}
.page-active{
display: inline;
}
#showoff_head{
overflow: hidden;
height: 120px;
padding-top: 10px;
border-top:4px solid #d6ecfa;
border-bottom: 1px solid #d6ecfa;

}
#showoff_head h1{
float: left;
margin:40px 25px;
}
#showoff_head .link_logo{
float: left;
height: 22px;
margin-top: 2px;
font-size: 0;
font-weight: normal;
}
#showoff_head .logo_showoff{
	display: inline-block;
	margin-left: 10px;
	vertical-align: middle;
}
#showoff_head .service_showoff{
display: inline-block;
font-weight: normal;
font-size: 30px;
line-height: 20px;
vertical-align: top;
}
#showoffGnb{
float: right;
margin-top: 40px;
margin-right: 25px;
font-size:20px;
font-weight: bold;
}
#showoffGnb .list_help{
float: left;
line-height: 20px;
}
#showoffGnb .list_help li{
float: left;
margin-right: 12px;
}
#showoffGnb .list_help li .link_help{
color: #777;
letter-spacing: -1px;
}
#content{
/* height: 100%; */
margin-bottom: 0;
}
#mArticle{
width: 100%;
height:300px;
min-height: 0;
margin: 140px auto 20px;
}
.cont_login{
float: none;
height:300px;
width: 500px;
margin: 50px auto;
padding:0;
border: 0 none;
}
.cont_login .login_inp{
position: relative;
height: 38px;
margin: 0 2px 8px 0;
border: 1px solid #ddd;
z-index: 2;
}
.login_inp .inp_email{
padding: 0 40px 0 10px;
margin-bottom: 25px;
}

.login_inp .inp_login{
display: block;
min-width: 268px;
width: 100%;
height: 100%;
padding: 0 10px;
border: 1px solid transparent;
border-radius: 0;
color: #000;
line-height: 25px;
box-sizing: border-box;
outline-color: white;
}
.cont_login .set_login{
position: relative;
margin-top: 10px;
line-height: 20px;
}
.set_login .inp_check{
position: absolute;
top: 4px;
left: 0;
width: 12px;
height: 12px;
}
.set_login .lab_check{
display: inline-block;
padding-left: 17px;
margin-top: -3px;
cursor: pointer;
}
.ico_check{
position: absolute;
top: 3px;
left: 0;
width: 12px;
height: 12px;
background-position: -16px -44px;
z-index: 10000000000;
background-color: transparent;
background-image: url("check_on.gif");
}
.cont_login .btn_login{
display: block;
width: 100%;
height: 55px;
border: 1px solid rgba(0,0,0,0.1);
border-radius: 4px;
font-size: 20px;
color: #f4f5f9;
background: #222;
font-weight: bold;
margin: 30px auto;
}
.info_user{
position: static;
padding-top:12px;
border-top: 0 none;
font-size: 12px;
}
.info_user .list_user{
float: right;
}
.info_user .list_user li{
float: left;
}
.info_user .list_user .txt_bar{
margin: 0 4px;
}
#foot{
position:relative;
bottom:0;
left:0;
width:100%;
font-size:12px;
padding:22px 30px 21px;
box-sizing: border-box;
text-align: center;
letter-spacing: -1px;

}
.footer_link{
height: 18px;
}
.footer_link .link_info{
display: inline-block;
line-height: 22px;
color: #898989;
white-space: nowrap;
}
.footer_link .txt_bar{
display: inline-block;
width: 1px;
height: 8px;
margin: 4px 1px 0 3px;
font-size: 11px;
background-color: #ccc;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	
	
	$(".inp_email").focus(function() {
		//alert("클릭")
		$("#loginEmail").css("border" , "1px solid #47C83E");
	});
	
	$(".inp_pw").focus(function() {
		//alert("클릭")
		$("#loginPw").css("border" , "1px solid #47C83E");
	});
	
	$(".inp_email").blur(function() {
		//alert("클릭")
		$("#loginEmail").css("border" , "1px solid transparent");
	});
	
	$(".inp_pw").blur(function() {
		//alert("클릭")
		$("#loginPw").css("border" , "1px solid transparent");
	}); 
	
	/* modal창 켜고 끄기 */
	$("#header_login").click(function() {
		$("#modal_all").css("display", "block");
	$("#close_btn").click(function() {
		$("#loginEmail").val("");
		$("#loginPw").val("");
		$("#modal_all").css("display", "none");
		
	})
	
	});
	
});



	
</script>
</head>
<body>
<div id="modal_all">
	<div id="wrap" class="version">
		<div id="pageLogin" class="page-active">
			<header id="showoff_head">
			<span id="close_btn"><i class="fas fa-times"></i></span>
				<h1>
					<a href="#" id="showoff_logo" class="link_logo" >
						<img alt="logo" class="logo_showoff" height="25" src="../resources/img/Slogo.png"width="57">
						<span class="service_showoff">로그인</span>
					</a>
				</h1>
				<nav id="showoffGnb">
					<ul class="list_help">
						<li>
						<a href ="#" class="link_help">도움말</a>
						</li>
						<li>
						<a href ="#" class="link_help">문의하기</a>
						</li>
					</ul>
				</nav>
			</header>
			<hr class="hide">
			
			<section id="content">
				<div id="main">
					<article id="mArticle">
						<div class="cont_login">
						<div class="login_inp" id="login_Email">
							<input id="loginEmail" type="text" class="inp_login inp_email" placeholder="이메일을 또는 전화번호">
						</div>	
						<!--password  -->
						<div class="login_inp" id="login_PW">
							<input type="password" id="loginPw" class="inp_login inp_pw" placeholder="비밀번호(8~32자리)">
						</div>
						<div class="set_login">
							<input type="checkbox" id="keepLoging" name="keep_login" value="true" class="inp_check">
							<label class="lab_check" for="keepLoging">
							로그인 상태 유지
							<span class="ico_login ico_check"></span>
							</label>
							<button type="submit" class="btn_login submit btn_disabled">
							로그인
							</button>
							<div class="info_user">
								<div class="join_user">
									<a href="joinpage.jsp" id="signup">회원가입</a>
									<ul class="list_user">
										<li>
											<a href="#">계정 찾기</a>
											<span class="txt_bar">|</span>
										</li>
										<li>
											<a href="#">비밀번호 재설정</a>
										</li>						
									</ul>		
								</div>
							
							</div>
						
						</div>
						
						
			</div><!--cong_login  -->
		</article>
	 </div>
</section>

<hr>
			
			<footer id="foot">
				<div class="footer_link">
				<a href="#" class="link_info">공지사항</a>
				<span class="txt_bar"></span>
				<a href="#" class="link_info">이용약관</a>
				<span class="txt_bar"></span>
				<a href="#" class="link_info">개인정보 처리방침</a>
				<span class="txt_bar"></span>
				<a href="#" class="link_info">운영정책</a>
				<span class="txt_bar"></span>
				</div>
				<div class="footer_info">
					<small class="txt_copyright">Copyright ⓒ
						<a href="#" class="link_showoff">ShowOff corp,.</a>
						All rights reserved
					</small>
				
				</div>
			
			</footer>
		
		</div>
	
	
	</div>
</div>
</body>
</html>