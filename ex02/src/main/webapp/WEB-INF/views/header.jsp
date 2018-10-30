<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="modal_login.jsp" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header.html</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">




<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400');

* {
	font-family: 'Hanna', sans-serif;
}

body, ul {
	margin: 0;
	padding: 0;
}

ul {
	list-style-type: none;
}

a {
	color: black;
	text-decoration: none;
}

#header_wrap {
	box-sizing: border-box;
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	background-color: white;
	z-index: 99;
}

/* header(로그인 , 회원가입, 마이페이지, 고객센터) */
#header_line1 {
	height: 30px;
	width: 100%;
	background-color: #f3f3f3;
	box-sizing: border-box;
	box-shodow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
				0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

#header_line1_in {
	width: 80%;
	margin: 0 auto; /* 가운데 정렬 */
}

#header_line1_ul {
	float: right;
}

#header_line1_ul>li {
	float: left;
	height: 30px;
}

#header_line1_ul>li:hover { /* 마우스를 올렸을 대  */
	background-color: #d3e0f7;
}

#header_line1_ul>li:hover #header_line1_ul_mypage_dropdown {
	display: block;
}

#header_line1_ul>li>a {
	color: #666;
	font-size: 14px;
	font-weight: light;
	height: 30px;
	padding: 0 10px;
	display: inline-block;
	line-height: 30px;
}

#header_line1_ul_mypage_dropdown {
	position: relative;
	background-color: #D4DFE6;
	display: none;
	margin-top: 0;
	border-top: 1px solid black;
	z-index: 1;
	box-sizing: border-box;
	text-align: center;
	font-size: 17px;
}

#header_line1_ul_mypage_dropdown>ul>li>a {
	color: #4d4d4d;
	width: 150px;
	display: inline-block;
	padding: 5px 0;
	text-decoration: none;
	box-sizing: border-box;
}

#header_line1_ul_mypage_dropdown>ul>li>a:hover {
	background-color: rgba(250, 250, 250, 0.2);
}
/* 회사로고 , 검색창*/
#header_line2 {
	width: 80%;
	height: 70px;
	margin: 15px auto;
	text-align: center;
	box-sizing: border-box;
}

div#header_line2_wrap_search {
	height: 34px;
	display: inline-block;
	float: right;
	padding-top: 46px;
}

div#header_line2_search {
	border: 2px solid #55967e;
	height: 34px;
	box-sizing: border-box;
	position: relative;
	-
}

input#search_keyword {
	width: 353px;
	height: 30px;
	font-size: 13px;
	box-sizing: border-box;
	border: 0px;
	padding-left: 10px;
	outline: none;
}

input#search_btn {
	width: 55px;
	height: 30px;
	background-color: #55967e;
	color: black;
	font-size: 13px;
	border: 0px;
	position: absolute;
	right: 0px;
	top: 0px;
}

#company_logo {
	margin-top: 8px;
	display: inline-block;
}

/* 네비게이션 메뉴바 */
#header_line3 {
	box-sizing: border-box; /* 크기고정 */
	width: 100%;
	height: 40px;
	background-color: #f4f5f9;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	position: relative;
}

#header_line3_ul > li {
	float: left;
	box-sizing: border-box;
	height: 39px;
}

#header_line3_ul>li:hover {
	background-color: #f4f5f9;
	border-bottom: 3px solid black; 
}

#header_line3:hover #header_line4 {
	display: block;
}

#header_line3_ul>li>a {
	width: 130px;
	color: #252c41;
	line-height: 38px;
	font-size: 15px;
	padding: 0px 10px;
	display: inline-block;
	text-align: center;
	text-decoration: none;
}

#header_line3_in {
	width: 45%;
	margin: 0 auto;
}

#header_line4 {
	background-color: #fff;
	border: 1px solid black;
	width: 100%;
	height: 460px;
	box-shadow: 0 10px 15px -5px;
	left: 0;
	right: 0;
	top: 39px;
	position: absolute;
	display: none;
	z-index: 2;
	font-size: 15px;
	color: black;
}

#header_line4 > .list > a {
	text-decoration:none;
	display: block; 
	display: inherit;
	color: black;
}
#header_line4 > .list > a:hover{
color:red;
width: 70px;
}
#line4_list1 {
	position: absolute;
	float: left;
	width: 5%;
	height: 400px;
	line-height: 70px;
	left: 645px;
	top: 50px;
}

#line4_list2 {
	position: absolute;
	width:5%;
	line-height: 70px;
	left: 782px;
	top: 50px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript"></script>
</head>
<body>
	<header>
		<div id="header_wrap">
			<div id="header_line1">
				<div id="header_line1_in">
					<ul id="header_line1_ul">
						<li id="header_login"><a href="#">로그인</a></li>
						<li><a href="joinpage.jsp">회원가입</a></li>
						<li><a href="#">마이페이지▼</a>
							<div id="header_line1_ul_mypage_dropdown">
								<ul>
									<li><a href="#">회원정보</a></li>
									<li><a href="#">장바구니</a></li>
									<li><a href="#">VIP등급</a></li>
									<li><a href="#">나의SHOWOFF</a></li>
								</ul>
							</div></li>
						<li><a href="">고객센터</a></li>
					</ul>
				</div>
			</div>

			<div id="header_line2">
				<a href="index.jsp"> <img id="company_logo" alt="company_logo"
					src="../resources/img/Slogo.png"></a>

				<div id="header_line2_wrap_search">
					<div id="header_line2_search">
						<input id="search_keyword" type="text" placeholder="검색어를 입력하세요">
						<input id="search_btn" type="submit" value="검색">
					</div>
				</div>
			</div>

			<div id="header_line3">
				<div id="header_line3_in">
					<ul id="header_line3_ul">
						<li id="header_line3_Designer"><a href="#">DESIGNERS</a></li>
						<li><a href="#">TRENDY</a></li>
						<li><a href="#">WOMEN</a></li>
						<li><a href="#">MEN</a></li>
						<li><a href="#">DISCOUNT</a></li>
					</ul>
				</div>


				<div id="header_line4">
					<div class="list" id="line4_list1">
						<a href="#">구찌</a> <a href="#">Guzzi</a> <a href="#">샤넬</a> <a
							href="#">Channel</a>
					</div>

					<div class="list" id="line4_list2">
						<a href="#">프라다</a> <a href="#">버버리</a> <a href="#">나이키</a> <a
							href="#">아디다스</a>
					</div>
				</div>

			</div>

		</div>


	</header>

</body>
</html>