<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Register</title>
</head>
<body>
	<form role="form" method="post">
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
				<label for="exampleInputEmail">Writer</label> <input type="text"
					name='writer' class="form-control" placeholder="Enter Writer">
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>

	</form>
	<%@include file="include/footer.jsp"%>
	<script src="/resources/bootstrap/css/bootstrap/.css"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>