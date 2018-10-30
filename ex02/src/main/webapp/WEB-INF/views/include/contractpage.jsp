<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join to showoff</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
body ,ul{
margin: 0;
padding: 0;
font-family: 'Nanum Gothic', sans-serif;
}
body{
background-color: #f5f6f7;
}
a{
text-decoration: none;
}
ul{
list-style-type: none;
}

.div_size{
width: 768px;
margin: 0 auto;
box-sizing: border-box;
}
#header{
height: 169px;
padding-top: 62px;
position: relative;
}
#naver_logo{
margin: 0;
padding: 0;
}
.n_logo{
display: block;
width: 240px;
height: 44px;
margin: 0 auto;
box-sizing: border-box;

}

.lang{
position:absolute;/* 포지션을 absoulte를 주었을 때 right top left로 위치 정렬 */
right: 0;
top:14px;
}
#langselect{
font-size: 12px;
font-weight: 400;
height: 30px;
padding: 6px 8px 5px 7px;
min-width: 98px;
color: #333;
border: 1px solid #ccc;
-webkit-appearance:none;
background-color: white!important;
width: 98px;
background: url("img/sel_arr.gif") 100% 50% no-repeat;/* bg에 이미지 넣고 포지션 넣음 */
}

/*container  */
#container{
position: relative;
}
#join_content{
width: 460px;
margin: 0 auto;
}
.terms{
margin-bottom: 20px;
background-color: white;
border: 1px solid #dadada;
}
.terms_p{
position:relative;
margin: 0px;
padding: 15px;
display: block; 
}
.terms_span{
position: relative;
display: block;
height: 58px;
}
.terms_span > input{/* 체크박스 */
position: absolute;
right: 1px;
top:50%;
width: 22px;
height: 22px;
margin-top: -11px;
visibility: hidden;/*숨기고 동작은 계속 할 때  */
}
.terms_span  > input:checked +label {
background-image: url("img/check_on.gif");
}

.terms_span > label{
font-size: 14px;
font-weight: 700;
top:-1px;
height: 58px;
line-height: 20px;
display: block;
cursor: pointer;
background: url("img/check_off.gif") 100% 50% no-repeat;
}


#terms_ul{
padding-bottom: 7px;
}
#terms_ul > li {
display: block;
padding: 13px 15px 7px;
}
#terms_ul_li1{
border-top: 1px solid #f0f0f0;
}
.ul_li_span{
position: relative;
display: block;
height: 24px;
}
.ul_li_span > input {
position: absolute;
right: 1px;
top: 50%;
margin-top: -11px;
width: 22px;
height: 22px;
visibility: hidden;
}

.ul_li_span > label{
background: url("img/check_off.gif") 100% 50% no-repeat;
display: block;
}

.ul_li_span > input:checked + label{
background-image: url("img/check_on.gif"); /* check box 체크 */
}

.label1{
height: 24px;
font-size: 14px;
font-weight: 700;
line-height: 24px;
position: absolute;
color: #333;
top: 0px;
left: 0px;
width: 100%;
}
.span_only{
color: #0d9900;
font-size: 12px;
font-weight: 400;
}
.terms_box{
box-sizing: border-box;
position: relative;
height: 88px;
margin-top: 11px;
padding: 8px 10px;
border: 1px solid #f0f0f0;
background-color: #f7f7f7;
overflow: auto;
}
.article{
margin-top:0px;
}
h3.article_title{
font-size: 12px;
font-weight: 700;
line-height: 16px;
color: #666;
margin: 0;
padding: 0;
padding-bottom: 8px;
}
.article > p{
display: block;
font-size: 12px;
line-height: 16px;
color: #666;
}
.span_select{
color: #0d9900;
font-size: 12px;
font-weight: 400;
}
.btn_type{
width: auto;
margin: 0px 5px;
font-size: 20px;
font-weight: 600;
line-height: 61px;
display: block;
box-sizing: border-box;
height: 61px;
padding-top: 1px;
text-align: center;
}
.btn_agree{
color: #fff;
border: 1px solid #1fbc02;
background-color: #1fbc02;
}
.btn_default{
color: #333;
border: 1px solid #e7e7e7;
background-color: #fff;
}
.btn_double_area{
margin: 30px -5px 0px;
overflow: hidden;
}
.btn_double_area > span{
display: block;
float: left;
width: 50%;
}
.group_join{
margin: 20px 0 65px;
text-align: center;
color: #666;
font-size: 12px;
}
.group_join > a{
text-decoration: underline;
color: #333;
}

#footer{
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
#err_check{
display: none;
}
#err_check_msg{
display: inline-block;
width: 428px;
height: 24px;
font-size: 11px;
font-weight: 700;
line-height: 24px;
color: #f46665;
padding: 0 15px;
text-align: center;
}
</style>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	$("#head").load("header.html"); 
	$("#cbox").click(function() {
		
		var state = $("#cbox").is(":checked");/* checked되었는지 확인 */
		
		if(state == true ){
			$(".ckboxs").prop("checked" ,true);
		}else if(state == false){
			$(".ckboxs").prop("checked" ,false);
		}
		
	});/* cbox 끝나는 시점 */ 
		
	$(".ckboxs").click(function() {
		
		var state = $(".ckboxs").is(":checked");
		
		if(state.length == 4 ){
			$("#cbox").prop("checked" ,true);
		}else{
			$("#cbox").prop("checked" ,false);
		}
	});
/* 	$(".ckboxs"),click(function() {
			if($("input[name='ckboxs']:checked").length == 4){
				$("#cbox").prop("checked" ,true);
			}else{
				$("#cbox").prop("checked" ,false);
			}
			
		}); */
		

	$(".btn_agree").click(function() {
		//alert("클릭")
		var li1 = $("#li1box").is(":checked");
		var li2 = $("#li2box").is(":checked");
		var url = "http://www.naver.com";
		
		if(li1 == true && li2 ==true){
			$(location).attr("href" , url);
		}else{
			$("#err_check").css("display" , "block");
		}
		
		
		
	});
	
});//ready 끝나는 시점 


</script>

</head>
<body>
<div id="head"></div>
<!--header  -->
 <header>
 	<div id="header" class="div_size">
 	 <h1 id="naver_logo">
 	  <a href="http://www.naver.com" class="n_logo"></a>
 	 </h1>
 	 <div class="lang">
       <select id="langselect">
        <option>한국어</option>
        <option>English</option>
        <option>中國語</option>
        <option>一本語</option>
       </select> 	 
 	 </div>
 	
 	
 	</div>
 </header>
 
 
 
 
 <!--container  -->
 <article class="div_size">
  <div id="container">
   <form action="" id="join_content">
    <div class="terms">
    
     <p class="terms_p">
      <span class="terms_span">
       <input type="checkbox" id="cbox">
       <label for="cbox">
	        이용약관,개인정보 수집 밑 이용,<br>
	        위치정보,이용약관(선택),프로모션 안내<br>
	        매일 수신(선택)에 모두 동의합니다.
       </label>      
      </span>
     </p>
     <ul id="terms_ul">
     	<li id="terms_ul_li1">
     		<span class="ul_li_span">
     		 <input type="checkbox" id="li1box" class="ckboxs" name="ckboxs">
     		 <label for="li1box" class="label1">
     		   ShowOff 이용약관 동의<span class="span_only">(필수)</span>
     		 </label>
     		</span>
     		<div class="terms_box" >
     		 <div class="article">
     		  <h3 class="article_title">여러분을 환영합니다.</h3>
     		  <p>ShowOff 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 <br>
     		          다양한 ShowOff 서비스의 이용과 관련하여 네이버 서비스를 제공하는 ShowOff <br>
     		          주식회사(이하 ‘ShowOff’)와 이를 이용하는 ShowOff 회원(이하 ‘회원’) 또<br>
     		          는 비회원과의 관계를 설명하며, 아울러 여러분의 ShowOff 서비스 이용에> 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</p>
     		  <h3 class="article_title">제 2조 (목적)</h3>
     		  </div>
     		</div>
     	</li>
     	
     	<li id="terms_ul_li2">
     		<span class="ul_li_span">
     		 <input type="checkbox" id="li2box" class="ckboxs" name="ckboxs">
     		 <label for="li2box" class="label1">
     		    게인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
     		 </label>
     		</span>
     		<div class="terms_box" >
     		 <div class="article">
     		  <p>정보통신망법 규정에 따라 ShowOff에 회원가입 신청하시는 분께 수집하는 개인<br>
     		           정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간<br>
     		           을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
     		  <h3 class="article_title">1. 수집하는 개인정보<br></h3>
     		  <p> 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 ShowOff <br>
     		             서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페,<br>
     		             블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할<br>
     		             경우, ShowOff는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</p>
              </div>			 
			 </div>	
     	</li> 	
     	
     	
     	
     	
     	<li id="terms_ul_li3">
     		<span class="ul_li_span">
     		 <input type="checkbox" id="li3box" class="ckboxs" name="ckboxs">
     		 <label for="li3box" class="label1">
     		    위치정보 이용약관 동의<span class="span_select">(선택)</span>
     		 </label>
     		</span>
     		<div class="terms_box" >
     		 <div class="article">
     		  <p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하<br>
     		           는 네이버 위치기반 서비스를 이용할 수 있습니다.</p>
     		  <h3 class="article_title">제 1 조 (목적)</h3>
     		  <p>약관은 ShowOff 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치<br>
     		           기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임<br>
     		           사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
     		   </div>        
     		</div>
     	</li> 	
     	
     	
     	<li id="terms_ul_li4">
     		<span class="ul_li_span">
     		 <input type="checkbox" id="li4box" class="ckboxs" name="ckboxs">
     		 <label for="li4box" class="label1">
     		    이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span>
     		 </label>
     		</span>
     	
     	</li> 	
     </ul>
    
    </div>
    <div id="err_check">
    	<span id="err_check_msg">ShowOff 이용약관과 개인정보 수집 및 이용에 대한</span>
    
    
    </div>
    <div class="btn_double_area">
     <span><a href ="#" class="btn_type btn_default">비동의</a></span>
     <span><a href ="#" class="btn_type btn_agree">동의</a></span>
    </div> 
    
      
   </form>
   <div class="group_join">
   	회사,동아리 등 단체에서 사용할 ID가 필요하세요?
   	<a href="#">단체 회원 가입</a>
   </div>
  </div>
 </article> 
 
 

 <!--footer -->
<footer id="footer">
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

</body>
</html>