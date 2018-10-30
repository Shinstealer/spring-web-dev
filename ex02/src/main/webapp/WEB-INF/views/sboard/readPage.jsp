<!DOCTYPE html>

<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ include file="../header.jsp" %>
<title>read page</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.popup{position: absolute;}
.back{background-color: gray; opacity: 0.5; width: 100%; height: 300%; overflow: hidden; z-index: 1101;}
.front{
z-index: 1110; opacity: 1; border: 1px; margin: auto;
}
.show{
position: relative;
max-width: 1200px;
max-height: 800px;
overflow: auto;
}
#indexBody{
padding-top: 200px;
}
</style>


<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src ="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../resources/js/upload.js"></script>
	<!-- 수정/삭제 링크 Jquery처리 -->
	<script>
	$(document).ready(function(){
		
		/* modify , remove , list 처리 */	
		var formObj = $("form[role='form']");
	
		console.log(formObj);
	
	    $("#modifyBtn").on("click", function(){
		formObj.attr("action","/sboard/modifyPage");
		formObj.attr("method","get");
		formObj.submit();
		});
		
	    /*Ajax를 이용해서 게시물 첨부파일 삭제 지시 -> form tag를 이용해서 DB의 삭제처리를 수행 ,페이지 이동*/
		$("#removeBtn").on("click", function(){
			
			var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g,"");
			
			if(replyCnt > 0 ){
				alert("댓글이 달린 게시물을 삭제 할 수 없습니다.!")
				return;
			}
			
			var arr = [];
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
			});
			
			if(arr.length > 0 ){
				$.post("/deleteAllFiles" , {files:arr}, function() {
					
				});
			}
			
		formObj.attr("action","/sboard/removePage");
		formObj.submit()
		});
		
		$("#goListBtn").on("click", function(){
		formObj.attr("method" ,"get");
		formObj.attr("action" ,"/sboard/list");
		formObj.submit();
		});
		
		/* 날짜 추출 handlebars */
		Handlebars.registerHelper("prettifyDate" , function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date =dateObj.getDate();
			return year + "/" + month + "/" + date;
		}); //handlebars
		
		/* 로그인한 사용자의 경우 값을 비교하는 handlebars */
		Handlebars.registerHelper("eqReplyer" ,function(replyer , block){
			var accum = '';
			if(replyer == '${login.uid}'){
				accum += block.fn();
			}
			return accum;
		});
		
		/* 페이지 처리 JS */
		
		var bno = ${boardVO.bno};
		var replyPage = 1;
		
		function getPage(pageInfo){
			$.getJSON(pageInfo , function(data){
			  printData(data.list, $("#repliesDiv") , $("#template"));
			  printPaging(data.pageMaker , $(".pagination"));
			  
			  $("#modifyModal").modal('hide');
			  $("#replycntSmall").html("[" + data.pageMaker.totalCount + "]");
				
			});
		} //getPage

			
 	    var printData = function(replyArr , target , templateObject){
		var template =Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		
		$(".replyLi").remove();
			target.after(html);
		} //printData
		
			
		var printPaging = function(pageMaker , target){
			var str = "";
			if(pageMaker.prev){
				str +="<li><a href = '"+(pageMaker.startPage - 1)+"'> << </a></li>";
			}
			
			for(var i =pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class = active' : '';
				str += "<li "+strClass+"><a href ='"+i+"'>"+i+"</a></li>";
			}
			if(pageMaker.next){
				str +="<li><a href = '"+ (pageMaker.endPage + 1)+"'> >> </a></li>";
			}
			target.html(str);
		}; //printPaging
			
		$("#repliesDiv").on("click", function() {
			if ($(".timeline li").size() > 1)	return;
			getPage("/replies/" + bno + "/1");
		});
			
		$(".pagination").on("click" , "li a" , function(event){
			event.preventDefault();
				
			replyPage = $(this).attr("href");
			getPage("/replies/"  +bno+ "/" + replyPage);
		}); //pagination

		$("#replyAddBtn").on("click", function() {
		  
			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
				
			$.ajax({
				type:'post',
				url : '/replies/',
				headers : {
				    "Content-Type":"application/json",
				    "X-HTTP-Method-Override":"POST"
				    },
				dataType : 'text',
				data : JSON.stringify({bno:bno,replyer:replyer, replytext:replytext}),
				success: function(result){
					console.log("result:"+result);
					if(result=='SUCCESS') {
					    alert("등록되었습니다.");
					    replyPage=1;    
					    getPage("/replies/"+bno+"/"+replyPage);
					    replyerObj.val("");   
					    replytextObj.val("");
				  	}
				}
		    });
		}); //replyAddBtn 끝
		
		/* modal */
			
			
		/*댓글 버튼 이벤트 처리  */
		 $(".timeline").on("click" , ".replyLi" , function(event){
			//alert("클릭")
			var reply = $(this);
				
				$("#replytext").val(reply.find('.timeline-body').text());
				$(".modal-title").html(reply.attr("data-rno"));
			}); // 댓글 버튼 이벤트 처리 끝
			
			/* modal수정 */
			$("#replyModBtn").on("click" , function() {
				
				//alert("클릭")
				var rno = $(".modal-title").html();
				var replytext = $("#replytext").val();
				
				$.ajax({
					type:'put',
					url:'/replies/' + rno,
					headers:{
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"},
					data:JSON.stringify({replytext : replytext}),
					dataType:'text',
					success:function(result){
						console.log("result : "  + result);
						if(result == 'SUCCESS'){
							alert("수정 되었습니다.");
							getPage("/replies/" + bno + "/" + replyPage);
							}
						}
					});
				}); // modify modal 수정 끝 
			
			/*delete modal처리  */
			
			$("#replyDelBtn").on("click" ,  function() {
				
				var rno = $(".modal-title").html();
				
				$.ajax({
					type:'delete',
					url:'/replies/' + rno,
					headers:{
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"},
					dataType:'text',
					success:function(result){
						console.log("result : "  + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							getPage("/replies/" + bno + "/" + replyPage);
						}
					}});
			}); //delete modal끝
		
		/* 첨부파일 데이터 보여주기 */
		/* getJSON과ajax 차이 ajax 함수의 약자로서 
		.ajax{url:url , dataType:'JSON' , data:data, success:callback}과 동일 */
		var bno = ${boardVO.bno};
		var template = Handlebars.compile($("#templateAttach").html());
		
		$.getJSON("/sboard/getAttach/"+bno, function(list){
			$(list).each(function() {
				var fileInfo = getFileInfo(this);
				var html = template(fileInfo);

				$(".uploadedList").append(html);
			});
		});
		
		$(".uploadedList").on("click" , ".mailbox-attachment-info a" , function(event) {
			
			var fileLink = $(this).attr("href");
			
			if(checkImageType(fileLink)){
				
				event.preventDefault();//화면이동 방지
				
				var imgTag = $("#popup_img");
				imgTag.attr("src" , fileLink);
				
				console.log(imgTag.attr("src"));
				
				$(".popup").show('slow');
				imgTag.addClass("show");
			}
		});
		
		$("#popup_img").on("click" , function() {
			$(".popup").hide('slow');
		});
		
	});
	</script>
	  
</head>
<body id="indexBody">

<!--첨부파일 썸네일 이미지  -->
	
<!-- 이미지를 보여주기 위해 <div> 작성 파일명 클릭하면 큰 크기로 보여줌 -->
   <div class='popup back' style="display:none;"></div>
   <div id="popup_front" class='popup front' style="display:none;">
    	<img id="popup_img">
   </div>
	
<!--게시글 box  -->
<form role="form" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno  }">
	</form>
	<!-- /. box-body -->
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail">Title</label> <input type="text"
				name='title' class="form-control" value="${boardVO.title }"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword">Content</label>
			<textarea class="text" name="content" cols="275px" rows="30" readonly="readonly">${boardVO.content }</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail">Writer</label> <input type="text"
				name='writer' class="form-control" value=${boardVO.writer }
				readonly="readonly">
		</div>
	</div><!--box body  -->
	
	<!--기존에 업로드 된 파일  -->
	<ul class="mailbox-attachments clearfix uploadedList"></ul>
	
	<!--box footer  -->
	<div class="box-footer">
		<c:if test="${login.uid == boardVO.writer }">
		<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
		<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
		</c:if>
		<button type="submit" class="btn btn-primary" id="goListBtn">Go LIST</button>
	</div>
	
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="bno" value="${boardVO.bno} ">
		<input type="hidden" name="page" value="${cri.page} ">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum} ">
		<input type="hidden" name="searchType" value="${cri.searchType} ">
		<input type="hidden" name="keyword" value="${cri.keyword} ">
	</form>
	
	<!--댓글 등록  -->
	<div class="row">
		<div class="col-md-12">
			
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
			 <c:if test="${not empty login }">
				<div class="box-body">
					<label for="newReplyWriter">writer</label>
						<input class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter">
					<label for="newReplyText">ReplyText</label>
						<input class="form-control" type="text" placeholder="REPLY" 
						id="newReplyText">	
				</div>
				<!-- box-body -->
				<div class="box-footer">
					<button type="submit" class="btn btn-primary" id="replyAddBtn">
					ADD REPLY</button>
				</div>
			</c:if>
			
			<c:if test="${empty login }">
				<div class="box-body">
					<div><a href="javascript:goLogin();">Login Please</a></div>
				</div>
			</c:if>
			
			</div>
		
		</div>
	</div><!-- 댓글등록 -->
	
	<!-- reply List / pagination   -->
	<!--timeline  -->
	<ul class="timeline">
		<!--timeline time label  -->
		<li class="time-label" id="repliesDiv"><span class="bg-green">
		Replies LIST<small id="replycntSmall">[${boardVO.replycnt }]</small>
		</span>
		</li>
	</ul>
	
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin ">
		
		</ul>
	</div>
	
	<!--Modal box -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" data-rno></h4>
				</div>
				<div class="modal-body" >
					<p><input type="text" id="replytext" class="form-control"></p>
				</div>
				<!-- modal button -->
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">MODIFY</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
				</div>			
			</div>		
		</div>
	</div>
	
	

	
	
	
	<!-- replyList Handlebars -->
	<script id="template" type="text/x-Handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
	{{#eqReplyer replyer}}
     <a class="btn btn-primary btn-xs"
        data-toggle="modal" data-target="#modifyModal">Modify</a>
	{{/eqReplyer}}
    </div>
  </div>
</li>
{{/each}}
	</script>
	
<!-- 첨부파일 handlebars -->
<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{fullName}}'>
     <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
     <div class="mailbox-attachment-info">
	 <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
     </div>
   </li>                
</script>
	
</body>
<%@include file="../footer.jsp"%>
</html>