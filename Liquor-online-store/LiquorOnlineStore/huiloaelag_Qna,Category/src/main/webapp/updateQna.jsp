<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<link rel="stylesheet" href="./resources/css/common.css">
</head>
<body>
<jsp:include page="/resources/js/header.jsp" />

<div id="container">

	<form action="updateQna.do" method="post">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<select id="selectbox" name="qTitle" disabled>
					<option selected>${qna.qTitle }</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td></td>
		</tr>
		<tr>
			<th>작성 비밀번호</th>
			<td>
				<input type="password" name="qPwd" value="${qna.qPwd }" disabled>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="qContent" rows="10" cols="40">${qna.qContent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="QnA 수정">
			</td>
		</tr>
	</table>
	</form>
</div>

<jsp:include page="/resources/js/footer.jsp" />
</body>
</html>