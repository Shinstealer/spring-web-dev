<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../header.jsp"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
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
<title>modify</title>
</head>
<body>
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="page" value="${cri.page} ">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum} ">
		<input type="hidden" name="searchType" value="${cri.searchType} ">
		<input type="hidden" name="keyword" value="${cri.keyword} ">

		
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
				self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"searchType=${cri.searchType} & keyword=${cri.keyword}";
			});
			$(".btn-primary").on("click", function() {
				formObj.submit();
			});
		});
	</script>

	<%@include file="../footer.jsp"%>
	<script src="/resources/bootstrap/css/bootstrap/.css"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>