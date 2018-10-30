<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="side_nav.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShowOff Main</title>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400');
	
* {
	font-family: 'Hanna', sans-serif;
}
body ,url{
margin: 0;
padding: 0;
}
a{
text-decoration: none;
color: black;
}

#indexBody{
padding-top: 200px;
}
#wrap-index{
margin-top:65px;
width: 100%;
height: 100%;
z-index: 1;
}
.main-page{
display:block;
width: 70%;
height: 100%;
margin: 0 auto
}

.container{ 
width:100%;
margin: 0 auto;
padding: 0;
z-index: 100000;
}

.carousel-inner {
overflow: hidden;
width: 100%;
}
.carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
.main-page .titleBanner{
  text-align: center;
  font-size: 21px;
  margin-top: 15px;
  margin-bottom: 40px;
  }
  
.main-page .titleBanner .text{
 font-size: 13px;
 }
.main-page .main-content{
min-width: 1400px;
}
.product-list .card-deck{
flex-wrap: wrap;
display: -webkit-flex;
vertical-align: bottom;
padding: 0 5px;
}
.card-img-top{
width: 
}


/* scrolltop btn */

#myBtn{
width:100px;
height:100px;
background-color:black;
color: white;
transform:rotate(315deg);
position: fixed;
right: -50px;
bottom:-50px;
text-align: center;
font-size: 12px;
}
#myBtn:hover {
	background-color: #8C8C8C;
	border-top:1px dashed black;
}
</style>
<script type="text/javascript" src="../../resources/bootstrap-4.1.3-dist/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel({interval: 1000, pause: "hover"});
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    $(".item4").click(function(){
        $("#myCarousel").carousel(3);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".right").click(function(){
        $("#myCarousel").carousel("next");
    });

    
    //scrolltop
    $("#myBtn").css("display" , "none");
    
	$(window).scroll(function() {
		if($(document).scrollTop() > 20){
			$("#myBtn").css("display" , "block");	
		}else{
			$("#myBtn").css("display" , "none");
		}
	});

	$(document).on("click" , "#myBtn" , function() {
		/* $(document).scrollTop(0);  */
		$("html , body" ).animate({scrollTop: 0} , 1000); 
	});
    
});
</script>



</head>
<body id="indexBody">

<div id="myBtn"><span>Top</span></div>

<!-- carousel -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="item1 active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1" class="item2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2" class="item3"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3" class="item4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="../resources/img/shp1.jpg?auto=yes&bg=777&fg=555&text=First slide" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../resources/img/shp2.jpg?auto=yes&bg=666&fg=444&text=Second slide" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../resources/img/shp3.jpg?auto=yes&bg=555&fg=333&text=Third slide" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../resources/img/shp4.jpg?auto=yes&bg=555&fg=333&text=Third slide" alt="Third slide">
    </div>
  </div>
  <a class="left carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- carousel end -->



<div class="main-page">


<!--titleBanner  -->
<div class="titleBanner">
"POP UP"

<div class="text">Show Off your Quality and Loyalty</div>
</div>


<!--img card  -->
<!-- 1row -->
<div class="main-content container-fluid">
<div class="product-list">
<div class="card-deck">
  <div class="card">
    <img class="1row card-img-top" src="../resources/img/20180127_636526505002368405.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="1row card-img-top" src="../resources/img/20180617_636647835006241263.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="1row card-img-top" src="../resources/img/20180821_636704470273647213.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
 </div> 
  
  <!--2 row  -->
  <div class="card-deck">
  <div class="card">
    <img class="2row card-img-top" src="../resources/img/20180822_636704772251974730.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="2row card-img-top" src="../resources/img/20180822_636704807432415100.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="2row card-img-top" src="../resources/img/20180822_636704897701590088.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
   </div> 
  <!--3row  -->
  <div class="card-deck">
  <div class="card">
    <img class="3row card-img-top" src="../resources/img/20180822_636704807432415100.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="3row card-img-top" src="../resources/img/20180822_636704844261602930.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="3row card-img-top" src="../resources/img/20180822_636704897654503796.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Card title</h4>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  </div>
  
  </div><!-- product list -->
  </div><!-- main-content -->
</div><!--main-page end  -->






</body>
<%@ include file="footer.jsp" %>

</html>