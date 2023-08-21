<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@include file ="resources/js/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
	th{
		padding: 10px 0 20px 0;
	}
	
	td{
		padding: 5px 0 0 0;
	}
</style>
</head>
<body>
<div id="container" align="center">
	<h1>COMMUNITY</h1>
	
	<!-- 검색을 위한 폼 -->
	<form action="getCommunityList.do" method="get">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	
	<form>
	</form>
	<table>
		<thead>
			<tr>
				<th width="100">번호</th>
				<th width="300">제목</th>
				<th width="200">날짜</th>
				<th width="100">공감</th>
			</tr>
		</thead>
		<tbody align = "center">
		<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.mCode}</td>
				<td>
					<a href="getCommunity.do?mCode=${board.mCode }"> ${board.mTitle}</a>
				</td>
				<td>${board.mDate}</td>
				<td>${board.mGood}</td>
			</tr>
		</c:forEach>
		<c:if test="${empty boardList }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
	</table>
	<br>
	<a href="insertCommunity.jsp">글 등록</a>
	<br><br>
</div>
</body>
</html>
<%@include file ="resources/js/footer.jsp" %>