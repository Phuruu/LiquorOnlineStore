<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지(index)</title>
</head>
<body>
	<a href="<%=cPath %>/main/main.jsp">검색</a>
	<a href="<%=cPath %>/getAllList.do">전체상품카테고리</a>
	<a href="<%=cPath %>/category.jsp">카테고리</a>
	<a href="#">마이페이지</a>
</body>
</html>