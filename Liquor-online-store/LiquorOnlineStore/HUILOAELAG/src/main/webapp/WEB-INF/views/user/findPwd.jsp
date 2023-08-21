<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<link rel="stylesheet" href="resources/css/common.css">
<style>
</style>
<body>	
	<form action="findPwd.do" method="POST" name="findId">
		<div>
			<div >
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>Id</label>
					<input type="text" name="userId" placeholder="아이디를 입력해주세요." >
				</p>
				
				<p>
					<label>Email</label>
					<input type="email" name="uemail" placeholder="이메일을 입력해주세요.">
				</p>
				
				<p>
					<button type="submit" value="check">find</button>
					<button type="button" onclick="history.go(-1);">Cancel</button>
				</p>
			</div>
		</div>
		
		<c:if test="${check == 1}">
			<script>
				alert("일치하는 정보가 존재하지 않습니다.");
			</script>
		</c:if>

		
		<c:if test="${check == 0 }">
			<script>
				alert("찾으시는 비밀번호는' ${userPwd}' 입니다.");
				location.href="loginPage.do";
			</script>
		</c:if>
		
		
	</form>
</body>
</html>

