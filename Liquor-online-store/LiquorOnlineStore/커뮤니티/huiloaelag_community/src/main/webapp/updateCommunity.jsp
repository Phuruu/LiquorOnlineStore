<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="resources/js/header.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String mCode = request.getParameter("mCode");
	String mTitle = request.getParameter("mTitle");
	String mContent = request.getParameter("mContent");
	String mDate = request.getParameter("mDate");
	String mGood = request.getParameter("mGood");
	//int mGood = Integer.parseInt(request.getParameter("mGood"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
</head>
<body>
<div id="container" align="center">
	<h1>POST</h1>
	<form action="updateCommunity.do" method="post">
		<input type="hidden" name="mCode" value="<%=mCode %>">
		<%--<input type="hidden" name="mPwd" value="${community.mPwd }"> --%>
		<table>
		<tr>
			<td>제목</td>
			<td><input type="text" value="<%=mTitle %>" id="mTitle" name="mTitle"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="uCode" value="닉네임" disabled></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><input type="text" name="mDate" value="<%=mDate %>" disabled></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="mContent" name="mContent" rows="4" cols="40"><%=mContent %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				추천 수 <input type="text" name="mGood" value="<%=mGood %>" disabled>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="btnUpdate" value="수정완료">
			</td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>
<%@include file ="resources/js/footer.jsp" %>