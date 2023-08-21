<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세</title>
<link rel="stylesheet" href="./resources/css/common.css">
<!-- <style>
	#container {
      width: 1180px;
      background-color: pink;
      margin : 0 auto;
   }
</style> -->
</head>
<body>
<jsp:include page="/resources/js/header.jsp" />

<div id="container" align="center">
	<table>
		<tr>
			<th>작성 일자</th>
			<td>${qna.qDate }</td>
		</tr>
		<tr>
			<th>문의 사항</th>
			<td>${qna.qTitle }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${qna.uName }</td>
		</tr>
		<tr>
			<th>작성 내용</th>
			<td>${qna.qContent }</td>
		</tr>
	</table>
	<p>
		<a href="updateQna.jsp">글수정</a>
		<a href="deleteQna.do?qCode=${qna.qCode }">글삭제</a>
		<a href="getQnaList.do">글목록</a>
	</p>
	<br><br><br>
			<c:if test="${qna.qComment != null}">
				문의 답변<p>
				<b>관리자 작성내용</b> : ${qna.qComment }
			</c:if> 
		<c:if test="${qna.qComment == null }">
				문의 답변<p>
				<b>답변이 아직 작성되지 않았습니다.</b>
		</c:if>
</div>

<br><br><br>
<jsp:include page="/resources/js/footer.jsp" />
</body>
</html>