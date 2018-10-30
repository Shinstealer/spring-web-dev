<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/header.jsp"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read page</title>
</head>
<body>
<form role="form" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno  }">
	</form>

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
	</div>
	
	<!-- /. box-body -->
	<div class="box-footer">
		<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
		<button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
		<button type="submit" class="btn btn-primary goListBtn">Go LIST</button>
	</div>
	
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="bno" value="${boardVO.bno} ">
		<input type="hidden" name="page" value="${cri.page} ">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum} ">
	</form>
	
	<!-- 수정/삭제 링크 Jquery처리 -->
	<script>
	$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modifyBtn").on("click", function(){
		formObj.attr("action","/board/modify");
		formObj.attr("method","get");
		formObj.submit();
		});
		
		$(".removeBtn").on("click", function(){
		formObj.attr("action","/board/remove");
		formObj.submit()
		});
		
		$(".goListBtn").on("click", function(){
		formObj.attr("method" ,"get");
		formObj.attr("action" ,"/board/listPage");
		formObj.submit();
		});
	});
	</script>


	<%@include file="include/footer.jsp"%>
	<script src="/resources/bootstrap/css/bootstrap/.css"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>