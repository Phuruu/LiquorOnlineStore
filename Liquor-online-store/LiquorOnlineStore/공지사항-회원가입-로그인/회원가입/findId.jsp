<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<%@include file ="/main/header.jsp" %>
<link rel="stylesheet" href="resources/css/findId.css">
<body>	
	<div class=all-body>
		<div id="body-wrap">
			<div class="id-comment">
				<h3 class="tit"> 아이디 찾기 </h3>
				<p class="comment">회원가입 시, 입력하신 이름 + 휴대폰 번호로 아이디를 확인하실 수 있습니다.</p>
			</div>
			<form action="findId.do" method="POST" name="findId" class="form">
				<div class="form-info">
					<table class="frm-list">
						<tr>
							<th>name</th>
							<td>
								<input type="text"  class="input-text" name="uname"  placeholder="이름을 입력해주세요." >
							</td>
						</tr>
						<tr>
							<th>Tel</th>
							<td>
								<input type="text" class="input-text" name="uphone" placeholder="핸드폰 번호를 입력해주세요.">
							</td>
						</tr>
					</table>
					<div class="forgot">
						<a href="pwdSearch.do">비밀번호 찾기</a> | <a href="loginPage.do">로그인</a> | <a href="userCheck.do">회원가입</a>
					</div>
					<div class="button-area">
						<button type="submit" class="form-btn-w" value="check">아이디 찾기</button>
						<button type="button" class="form-btn" onclick="#">메인으로</button>
					</div>
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
<%@include file ="/main/footer.jsp" %>
</body>
</html>