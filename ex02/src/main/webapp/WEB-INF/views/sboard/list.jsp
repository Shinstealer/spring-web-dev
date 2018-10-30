<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../header.jsp"%>
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
<title>SBOARD List page</title>
<style type="text/css">
#indexBody{
padding-top: 200px;
}
</style>
</head>

<body id="indexBody">
	<!--sBoard List  -->
	<div class='box-body'>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType ==  null?'selected' :''}"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected' :''}"/>>
				Title</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected' :''}"/>>
				Content</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected' :''}"/>>
				Writer</option>
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected' :''}"/>>
				Title or Content</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected' :''}"/>>
				Content or Writer</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected' :''}"/>>
				Title or Content or Writer</option>
		</select> 
		
		<input type="text" name="keyword" id="keywordInput"
			value="${cri.keyword }">
		<button id="searchbtn">Search</button>
		<button id="newbtn">New Board</button>
	</div>

	<!-- 페이지 목록 -->
	<table class="table table-bordered">
		<tr>
			<th style="width: 10px">BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th style="width: 40px">VIEWCNT</th>
		</tr>
	<!--댓글 갯수를 보여주는 기능  -->
	
		<c:forEach items="${list}" var="boardVO">

			<tr>
				<td>${boardVO.bno}</td>
				<td><a
					href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }
				&bno=${boardVO.bno }'>
				${boardVO.title}<strong>[${boardVO.replycnt }]</strong>
				</a></td>
				<td>${boardVO.writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${boardVO.regdate}" /></td>
				<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
			</tr>
		</c:forEach>
	</table>
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>
	<!-- 페이징 처리 -->
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="list${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;
				</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class= active' : '' }"/>>
					<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
				</li>

			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;
				</a></li>
			</c:if>
		</ul>
	</div>
	
	
	
	<script>
	$(document).ready(
			function(){
				
				$('#searchbtn').on("click" ,
				function(event){
					self.location = "list"
					+'${pageMaker.makeQuery(1)}'
					+"&searchType="
					+$("select option:selected").val()
					+"&keyword=" + encodeURIComponent($('#keywordInput').val());
				});
				
				$('#newbtn').on("click", function(evt){
					self.location = "register";
				});
				
			});
	
	</script>



	<%@include file="../footer.jsp"%>
</body>
</html>