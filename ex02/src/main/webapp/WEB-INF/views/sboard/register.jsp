<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
<title>Board Register</title>
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
<style>
.fileDrop{
width: 80%;
height: 200px;
border: 1px dotted gray;
background-color: lightslategrey;
margin: auto;
}

#indexBody{
padding-top: 200px;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src ="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../resources/js/upload.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	
	
	var template = Handlebars.compile($("#template").html());
	//file drag and drop을 ajax로 처리
	$(".fileDrop").on("dragenter dragover" , function(event) {
		event.preventDefault();
		
	});
	
	
	$(".fileDrop").on("drop" , function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file" ,  file);
		
		$.ajax({
			url:'/uploadAjax',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success:function(data){
				
				var fileInfo = getFileInfo(data);
				
				var html = template(fileInfo);
				
				$(".uploadedList").append(html);
				
				
				
				
			}
		});
	});
	
	$("#registerForm").submit(function(event) {
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		
		$(".uploadedList .delbtn").each(function(index) {
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
		});
		
		that.append(str);
		
		that.get(0).submit(); 
	});
	
	
});




</script>

</head>
<body id="indexBody">
	<form id="registerForm" role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail">Title</label> <input type="text"
					name='title' class="form-control" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword">Content</label>
				<textarea class="text" name="content" cols="275px" rows="30"
					placeholder="Enter..."></textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail">Writer</label> 
				<input type="text" name='writer' class="form-control" value='${login.uid }' readonly>
			</div>
			
				<!--파일 업로드  -->
			<div class="form-group">
					<label for="exampleInputEmail">File DROP Here!</label>
					<div class="fileDrop"></div> 
			</div>
			
		</div><!-- /.box-body -->
		
		
		<div class="box-footer">
			<div>
				<hr>
			</div>
			
			<ul class="mailbox-attachments clearfix uploadedList">
			</ul>
			
			<button type="submit" class="btn btn-primary">Submit</button>
		
		</div>
		
		
		
		<!-- <div class="box-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>-->
		
		<!-- <input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'> -->
		
	</form>
	
	<!-- handlebars로 각 파일을 템플릿 처리 -->
	
	<script id="template" type="text/x-handlebars-template">
		<li>
		 <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  		 <div class="mailbox-attachment-info">
		  <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		  <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove">
		  </i></a>
		 </div>
	    </li>

	</script>
	
	
</body>
<%@include file="../footer.jsp"%>
</html>