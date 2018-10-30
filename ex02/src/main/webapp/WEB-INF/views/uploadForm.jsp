<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload test</title>
<style type="text/css">
iframe{
width: 0;
height: 0;
border: 0;
}
</style>

</head>
<script type="text/javascript">
/*addFilePath의 부모창  */
function addFilePath(msg) {
	alert(msg)
	document.getElementById("form1").reset();
}
</script>
<body>

<form id="form1" action="uploadForm" method="post" enctype="multipart/form-data" target="zeroFrame">
<input type="file" name="file">
<input type="submit">
</form>

<iframe name="zeroFrame"></iframe>




</body>
</html>