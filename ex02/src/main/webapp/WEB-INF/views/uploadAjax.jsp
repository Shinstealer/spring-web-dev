<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.fileDrop{
width: 100%;
height: 200px;
border: 1px dotted blue;
}

small{
margin-left: 3px;
font-weight: bold;
color: gray;
}

</style>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<script src ="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		//file drag and drop을 ajax로 처리
	$(".fileDrop").on("dragenter dragover" , function(event) {
		event.preventDefault();
		
	});
	
		
	//파일 출력을 ajax로 처리
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;
		
		return fileName.match(pattern)
		
	}
	//uuid코드를 substr하고 오리지널 이름 표시
	function getOriginalName(fileName) {
		
		if(checkImageType(fileName)){
			return;
			
		}
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	//thumbnail 이름빼고 이미지만 보여줌 
	function getImageLink(fileName) {
		
		if(!checkImageType(fileName)){
			return;
			
		}
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		
		return front + end;
	}
	
	
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
				
				var str = "";
				
				console.log(data);
				console.log(checkImageType(data));
				
				
				/* img src 띄어쓰기 주의! 스페이스 값이 먹혀서 절대주소 참조 문제로 이미지가 액박뜸!! */
				if(checkImageType(data)){
					str = "<div>"
						+ "<a href='displayFile?fileName="+getImageLink(data)+"'>" 
						+"<img src='displayFile?fileName="+data+"'/>"
						+ "</a><small data-src="+data+">X</small></div>";
								
					
				}else{
					str="<div><a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data)+"</a>"
						+"<small data-src="+data+">X</small></div></div>";
						
				}
				
				$(".uploadList").append(str);
			}
		});
	});//thumbnail 업로드 끝
	
	//업로드된 이미지 삭제 
	$(".uploadList").on("click" , "small" , function(event) {
		
		var that = $(this);
		
		$.ajax({
			url:"deleteFile",
			type:"post",
			data:{fileName:$(this).attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result == 'deleted'){
					alert("deleted");
					that.parent("div").remove();
				}
			}
		});
	});
	
	
	
	
	
	
	
	
});
	
	
	
	

</script>
<body>

<h3>Ajax File Upload</h3>
<div class="fileDrop"></div>

<div class="uploadList"></div>



</body>
</html>