<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShowOff AWESOME MEMBER</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Lobster');
	
* {
	font-family: 'Lobster', cursive;
}
body, ul {
	margin: 0;
	padding: 0;
}

a {
	color: black;
	text-decoration: none;
}

.panel {
	width: 100%;
	height: 50px;
	margin-bottom: 18px;
	background-color: #fff;
	padding: 2rem 4rem;
}

.panel_heading {
	padding: 0;
}

.panel_title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 13px;
}

.route {
	display: inline-block;
}

.route > a {
	padding: 2rem;
	margin: 0;
}
#only_span{
	display: block;
	
}

.container {
	margin-right: auto;
	margin-left: auto;
	padding-left: 15px;
	padding-right: 15px;
	width: 1170px;
	height: 1000px;
}

.userPage {
	padding: 0px 30px 0px 60px
}

.row {
	margin: 5px -15px;
}

.socialWrap {
	width: 50%;
	display: inline-block;
	float: left;
}

.text_center {
	text-align: center;
}

.userPage h2 {
	margin-bottom: 27px;
	font-size: 15px;
	font-weight: 300;
	line-height: 1.1;
}

.social-list {
	height: 700px;
	display: block;
	border-right: 1px solid black;
	margin-top: 81px
}

.join_sns{
	margin: 0 0 10px;
}
.variable_join{
display: inline-block;
margin-top: 12px;
}
.btn-social {
	height: 4.5rem;
	width: 29rem;
	border: 1px solid #939393;
	color: #000;
	background-color: transparent;
	font-size: 1.4rem;
	font-weight: 700;
	margin-bottom: 10px;
	border-radius: 4px;
}

.join_sns i{
	float: left;
    padding: 0.65rem 0.85rem;
    background-color: #8b8687;
    color: #fff;
    font-size: 2.8rem;
    width: 4.5rem;
}
#kakao_icon{
width: 45px;
float: left;
margin-left: 15px;
}

.div-img {
	float: left;
	padding: .55rem 0.4rem;
	background-color: #000;
	color: #fff;
	font-size: 2.8rem;
	width: 6.5rem;
}

img {
	vertical-align: middle;
}
/*로그인*/
.loginWrap {
	width: 50%;
	float: right;
	position: relative;
}

.loginPage {
	text-align: center;
	width: 370px;
	margin: auto;
	display: inline-block;
	float: right;
}

.signup-padding {
	box-sizing: border-box;
}

input {
	margin-bottom: 20px;
	width: 50%;
	height: 32px;
	padding: 6px, 12px;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 0;
	box-shadow: insert 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

label {
	display: block;
	float: left;
	line-height: 45px;
	width: 40%;
	margin-bottom: 20px;
	font-weight: 700;
}

.form-control {
	display: inline-block;
	float: right;
	height: 32px;
	padding: 6px 12px;
	margin:0;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 0;
	box-shadow: insert 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.email-control{

}

#input_email {
position: relative;
width: 100px;
}
#input_email > *{

width: 10rem;
height: 50px;
padding: 6px, 12px;
border-radius: 0;
/* box-shadow: 0 1px 1px rgba(0, 0, 0, .075); */
transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;

}
#inputemail {
display: inherit;
position: absolute;
width: 180px;
height: 34px;
right: -269px;
top: 45px;
border-radius: 4px;
}
#inputemail_ID{
display: inherit;
position: absolute;
top: 45px;
width: 128px;
height: 34px;
border-radius: 4px;

}
#span_em{
position: absolute;
left: 142px;
top: 50px;
width: 2rem;
}
#span_em > i {
background-color: white;
color: black;
padding:0;
font-size: 24px;
float: left;
width: 23px;
}


#sel_mail{
position: absolute;
width: 8rem;
top: 45px;
left: 390px;
height: 34px;
}



#input_email > input select{


}
#em_join{
height: 87px;
}

.joinpage > {
position: relative;

}
#input_address{
position: absolute;
width:369px;
top:775px;
right:2px;
padding: 6px, 12px;
background-color: #fff;
background-image: none;
box-shadow: 0 1px 1px rgba(0, 0, 0, .075);
transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
border-radius: 2;

border: none;
}
.postcode{
width:269px;
float:left;
display: inline-block;
margin-bottom: 10px;
}
.postbutton{
width:98px;
float: right;
display: inline-block;
}
.address{
width:368px;
display: block;
text-align: left;
width: 370px;
margin-bottom: 10px;
}
.address2{
width:368px;
display: block;
text-align: center;
width: 370px;
}

.login_button {
	position: absolute;
	height: 40px;
	width: 367px;
	right: 20px;
	left: 172px;
	top: 774px;
}

.btn-sign {
	width: 100%;
	height: 40px;
	font-size: 15px;
	margin-top: margin: .3rem auto;
	color: white;
	background-color: black;
}
#joinpage_body{
padding-top:200px;
}

#footer {
	padding: 15px 0;
}

#footer * {
	font-size: 12px;
	line-height: normal;
	list-style: none;
	color: #333;
}

#footer>ul {
	text-align: center;
	margin: 0 auto 9px;
}

#footer>ul>li {
	display: inline-block;
	/*li는 block이기 때문에 가로로 나열하기위해서는 inline -block을 주면된다!  */
	border-left: 1px solid #dadada;
	padding: 0 5px 0 7px;
}

#footer>ul>li:first-child { /*첫번째 선택자만 선택하는 거  */
	border-left: 0px !important; /* !important 최우선으로 CSS적용 (root) */
	/* 남발해서 사용x */
}

#address {
	margin: 0 auto;
	text-align: center;
}

#address * {
	font: 9px verdana;
}

#addr_logo {
	width: 63px;
	height: 11px;
}

#address a {
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
}

#footer>ul>li>a:hover {
	color: #1fbc02;
}

.err_check {
	 display: none; 
}

#err_check_msg {
	display: inline-block;
	width: 370px;
	height: 20px;
	font-size: 10px;
	font-weight: 700;
	line-height: 24px;
	color: #f46665;
	padding: 0 15px;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		
		/* error pup_up */
		$("#inputemail").blur(function() {
			alert("클릭")
			var em_ck = $(this).val(); 
			if(em_ck == ""){
			$(".err_check").css("display" , "block");
				
			}else if($("#inputemail").focuse(function() {
				
			})){
			$(".err_check").css("display" , "none");
			}
		});
		
		$("#inputpw").blur(function() {
			var pw_ck = $(this).val(); 
			
			if(pw_ck == ""){
			$(".err_check").css("display" , "block");
				
			}else{
			$(".err_check").css("display" , "none");
			}
		});
		
		$("#ck_pw").blur(function() {
			var repw_ck = $(this).val(); 
			if(repw_ck == ""){
			$(".err_check").css("display" , "block");
				
			}else{
			$(".err_check").css("display" , "none");
			}
		});
		
		$("#inputname").blur(function() {
			var name_ck = $(this).val(); 
			if(name_ck == ""){
			$(".err_check").css("display" , "block");
				
			}else{
			$(".err_check").css("display" , "none");
			}
		});
		$("#input_nick_name").blur(function() {
			var nickname_ck = $(this).val(); 
			if(nickname_ck == ""){
			$(".err_check").css("display" , "block");
				
			}else{
			$(".err_check").css("display" , "none");
			}
		});
		
		$("#inputphone").blur(function() {
			var phone_ck = $(this).val(); 
			if(phone_ck == ""){
			$(".err_check").css("display" , "block");
				
			}else{
			$(".err_check").css("display" , "none");
			}
		});
		
		
		/* auto-selected domain */
		$("#sel_mail").change(function() {
			var sel_mail = $("#sel_mail").val()
			
			if(sel_mail == "directVal"){
				$("#inputemail").val("");
				$("#inputemail").focus();
			}else{
				$("#inputemail").val(sel_mail);
			}
		});
		
		
		
		$("#join_confirm").click(function() {
			var em_ck = $("#inputemail").val(); 
			var pw_ck = $("#inputpw").val();
			var repw_ck = $("#ck_pw").val();
			var name_ck = $("#inputname").val();
			var nickname_ck = $("#input_nick_name").val();
			var phone_ck = $("#inputphone").val();
			
		
			 
			
			
			
		});
		
		
	});
</script>
</head>
<body id="joinpage_body">
	<div id="header"></div>

	<!-- 로그인 페이지 -->
	<div>
		<div class="panel category-navi">
			<div class="panel_heading">
				<div class="panel_title">
					<div class="route">
						<a class="btn btn-link" href="index.jsp">홈 </a> <span> > </span>
					</div>
					<div class="route">
					<span id="only_span">회원가입</span> 
				</div>
			</div>

		</div>

			
      </div>
		<div class="container">
			<div class="userPage">
				<div class="row">
					<div class="socialWrap">
						<div class="text_center">
							<h2>SNS 계정으로 가입하기</h2>
							<main class="social-list">
							<p class="join_sns">
								<span style="transition: opacity 0.5s ease 0s;">

									<button type="button" class="btn-social metro">
										<i class="fab fa-facebook-square"></i>
										<span class="variable_join">Join by Facebook</span>
									</button>

								</span>
							</p>



							<p class="join_sns">
								<button type="button" class="btn-social" style>
									<div>
										<i class="fab fa-google"></i>
										<span class="variable_join">Join by Google</span>
									</div>

								</button>

							</p>

							<p class="join_sns">
								<button type="button" class="btn-social" style>
									<div>
										<i class="fab fa-instagram"></i>
										<span class="variable_join">Join by Instagram</span>
									</div>

								</button>

							</p>
							
							<p class="join_sns">
								<button type="button" class="btn-social" style>
									<div>
											<img alt="카카오톡 " src="../resources/img/kakao.jpg" id="kakao_icon">
										<span class="variable_join">Join by KaKaoTalk</span>
									</div>

								</button>

							</p>
							</main>

						</div>


					</div>
					<!--socialwrap-->

					<div class="loginWrap sub-border">
						<!--loginWrap-->
						<div class="loginPage">
							<h2>계정 가입하기</h2>
							<div class="signup-padding">
								<div class="form-horizontal">
									<div class="joinPage" id="em_join">
										<div class="input_label">
											<label for="inputemail">이메일</label>
										</div>
											<div id="input_email" >
										<form action="">
											<input type="text" id="inputemail_ID" placeholder="　ID" class="email-control">
											<span id="span_em"><i class="fas fa-at"></i></span>
											<input type="email" placeholder="　example@showoff.com" id="inputemail" class="email-control">
											<select id="sel_mail">
												<option value="directVal">직접 입력</option>
												<option value="naver.com">naver.com(네이버)</option>
												<option value="daum.net">daum.net(다음)</option>
												<option value="gmail.com">gmail.com(지메일)</option>
												<option value="outlook.com">outlook.com(아웃룩)</option>
											</select>
										</form>
											</div>
									</div>
									<!--error message  -->
						
								    <div class="err_check">
								    	<span id="err_check_msg">E-mail을 입력해주세요</span>
								    
								    </div>
																	
									<div class="joinPage">
										<div class="input_label">
											<label for="inputpw">패스워드</label>
										</div>
										<form action="">
											<div id="input_pw">
												<input type="password" placeholder="최소 8자 이상 입력해주세요"
													id="inputpw" class="form-control">
											</div>
										</form>
									</div>
									<div class="err_check">
								    	<span id="err_check_msg">패스워드를 입력해주세요</span>
								    </div>
									
									<div class="joinPage">
										<div class="input_label">
											<label for="ck_pw">패스워드 확인란</label>
										</div>
										<form action="">
											<div id="input_pw">
												<input type="password" placeholder="패스워드를 다시 입력해주세요"
													id="ck_pw" class="form-control">
											</div>
										</form>
									</div>
									<div class="err_check">
								    	<span id="err_check_msg">설정한 패스워드가 다릅니다.</span>
								    </div>

									<div class="joinPage">
										<div class="input_label">
											<label for="inputname">이름</label>
										</div>
										<form action="">
											<div id="input_name">
												<input type="text" placeholder="반드시 실명을 입력하세요"
													id="inputname" class="form-control">
											</div>
										</form>
									</div>
									<div class="err_check">
								    	<span id="err_check_msg">성함을 입력해주세요.</span>
								    </div>

									<div class="joinPage">
										<div class="input_label">
											<label for="inputname">닉네임</label>
										</div>
										<form action="">
											<div id="input_name">
												<input type="text" placeholder="ex)스웩" id="input_nick_name"
													class="form-control">
											</div>
										</form>
									</div>
									<div class="err_check">
								    	<span id="err_check_msg">닉네임을 입력해주세요</span>
								    </div>

									<div class="joinPage">
										<div class="input_label">
											<label for="inputphone">연락처</label>
										</div>
										<form action="">
											<div id="input_phone">
												<input type="tel" placeholder="010-xxxx-xxxx"
													id="inputphone"  class="form-control">
											</div>
										</form>
									</div>
									<div class="err_check">
								    	<span id="err_check_msg">연락처를 입력해주세요</span>
								    </div>
									<div class="joinPage">
										<div class="input_label">
												<label for="input_address">주소</label>
											</div>
									
									</div>
									
									<div class="postPage">
										
										<form action="">
											<div id="input_address">
											<input type="text"  id="sample6_postcode" class="postcode" placeholder="　우편번호" >
											<input type="button" id="sample6_postcode"  class="postbutton" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>
											<input type="text" id="sample6_address"  class="address" placeholder="　주소" >
											<input type="text" id="sample6_address2"  class="address2"  placeholder="　상세주소" >
											</div>
										</form>
									</div>
									
									<div class="login_button">
										<button type="button" class="btn btn-sign" id="join_confirm">Confirm</button>
									</div>
									
								</div>
								<div class="static-modal"></div>

							</div>

						</div>
						
						

						

					</div>
					<!--login end-->

				</div>
				<!--row-->


			</div>


		</div>
		<!--container-->

		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>

				<div id="address">
					<span> <a href="http://www.naver.com"> <img
							src="../resources/img/Slogo.png" alt="로고" id="addr_logo">
					</a>
					</span> <span>Copyright</span> <span>ⓒ</span> <span> <strong>
							<a href="#">ShowOff Corp,.</a>
					</strong>
					</span> <span>All Rights Reserved</span>
				</div>
			</div>
		</footer>
	</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>


</body>
</html>