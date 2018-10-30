<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#index-body{
padding-top: 200px;
}
#wrap{
display: block;
width: 30%;
height: 20%;
margin: 50px auto;
}
</style>
</head>
<body id="index-body">


<div id="wrap">
<form action="/user/loginPost" method="POST">
 <div class="form-group has-feedback">
  <input type="text" name="uid" class="form-control" placeholder="USER ID"/>
  <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
 </div>
 <div class="form-group has-feedback">
  <input type="password" name="upw" class="form-control" placeholder="Password"/>
  <span class="glyphicon glyphicon-lock form-control-feedback"></span>
 </div>

<div class="row">
 <div class="col-xs-8">
  <div class="checkbox icheck">
   <label>
    <input type="checkbox" name="useCookie">Remember Me
   </label>
  </div>
 </div><!--col  -->

<div class="col-xs-4">
 <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
</div>
</div>


</form>
</div><!--wrap  -->
</body>
</html>