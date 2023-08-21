<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="resources/js/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>	
	td{
		padding: 10px 0 5px 0;
	}
</style>
</head>
<body>

<div id="container" align="center">
	<h1>POST</h1>
	<form action="insertCommunity.do" method="post">
		<table>
		<tr>
			<td width="70px">제목</td>
			<td><input type="text" placeholder="제목" id="mTitle" name="mTitle"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>uNick</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="mContent" name="mContent" rows="4" cols="40"></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" placeholder="수정을 위한 비밀번호" id="mPwd" name="mPwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" id="btnInsert" value="등록"></td>
		</tr>
		</table>
	</form>
	
</div>	
</body>
</html> 
<%@include file ="resources/js/footer.jsp" %>