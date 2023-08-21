<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/common.css">
<%@include file ="/main/header.jsp" %>
<body>
	<h1>jsp</h1>
	<c:if test="${sessionScope.unick != null}">
		<p>
			${sessionScope.unick}님 환영합니다	
		</p>
	</c:if>
	<c:if test="${sessionScope.userId != null}">
		<form action="logout.do" method="post">
			<input type="submit" value="로그아웃">
		</form>
	</c:if>
	
</body>
</html>