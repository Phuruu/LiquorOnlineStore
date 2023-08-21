<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<%@include file ="../common/header.jsp" %>
<link rel="stylesheet" href="resources/css/findId.css">
<body>	
	<div class=all-body>
		<div id="body-wrap">
			<div class="info">
				<p>아이디 찾기</p>
				<span>회원가입 시, 입력하신 이름 + 휴대폰 번호로 아이디를 확인하실 수 있습니다.</span>
			</div>
			<div class="findId-wrapper">
			<form action="findId.do" method="POST" name="findId" class="form">
				<label class="user-name">이름</label>
				<div class="msg00"></div>
				<input class type="text" placeholder="이름을 입력해주세요." >
				<div class="msg01"></div>
				
				<label class="phoneNum">휴대폰 번호</label>
				<div class="msg00"></div>
				<input class type="tel" maxlength="14" placeholder="휴대폰 번호를 입력해 주세요.(- 제외)" >
				<div class="msg01"></div>
				
				<div class="forgot">
						<a href="pwdSearch.do">비밀번호 찾기</a> | <a href="login.do">로그인</a> | <a href="userCheck.do">회원가입</a>
				</div>
				
				<div class="button-area">
				<button type="submit" class="form-btn-w" value="check">아이디 찾기</button>
				<button type="button" class="form-btn" onclick="main.jsp">메인으로</button>
				</div>
				
				
				<c:if test="${check == 1}">
					<script>
						alert("일치하는 정보가 존재하지 않습니다.");
					</script>
				</c:if>
				<c:if test="${check == 0 }">
					<script>
						alert("찾으시는 아이디는' ${userId}' 입니다.");
						location.href="loginPage.do";
					</script>
				</c:if>
			</form>
			</div>
		</div>
	</div>
<%@include file ="../common/footer.jsp" %>
</body>
</html>