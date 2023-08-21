<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/* String getPwd = request.getParameter("qPwd"); */
	int qCode = Integer.parseInt(request.getParameter("qCode"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 암호 확인</title>
<link rel="stylesheet" href="./resources/css/common.css">
<script>
	function getQna_go() {
		let setPwd = document.getElementById("setPwd").value;
		let getPwd = sessionStorage.getItem("getPwd");
		if (getPwd == setPwd) {
			location.href = 'getQna.do?qCode=<%=qCode %>';
		} else {
			alert("비밀번호가 일치하지 않습니다.\n" + "다시 입력해주세요");
		}
	}
</script>
</head>
<body>
<jsp:include page="/resources/js/header.jsp" />

<div id="container" align="center">
	작성한 비밀번호를 입력하세요<br>
	<input type="password" name="setPwd" id="setPwd">
	<input type="button" value="확인" onclick="getQna_go()">
</div>	

<br><br><br>
<jsp:include page="/resources/js/footer.jsp" />
</body>
</html>