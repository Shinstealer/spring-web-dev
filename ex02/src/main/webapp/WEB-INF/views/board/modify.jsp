<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<form role="form" action="modify" method="post">
		<input type="hidden" name="page" value="${cri.page} ">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum} ">
		
		<div class="box-body">

			<div class="form-group">
				<label for="exampleInputEmail">BNO</label>
				<input type="text"
					name='bno' class="form-control" value="${boardVO.bno }"
					readonly="readonly">
			</div>

			<div class="form-group">
				<label for="exampleInputEmail">Title</label><input type="text"
					name='title' class="form-control" value="${boardVO.title }">
			</div>

			<div class="form-group">
				<label for="exampleInputEmail">Content</label>
				<textarea class="form-control" name="content" rows="30" cols="275">${boardVO.content }</textarea>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail">Writer</label><input type="text"
					name="writer" class="form-control" value="${boardVO.writer }">
			</div>

		</div>
		<!-- /. box-body -->
	</form>

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>

	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-warning").on("click", function() {
				self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
			});
			$(".btn-primary").on("click", function() {
				formObj.submit();
			});
		});
	</script>

	<%@include file="include/footer.jsp"%>
	<script src="/resources/bootstrap/css/bootstrap/.css"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>