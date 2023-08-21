<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<link rel="stylesheet" href="resources/css/common.css">
<%@include file ="/main/header.jsp" %>
<style>* 

.input-box{
  position:relative;
  margin:10px 0;
} 


.input-box > input{
  background:transparent;
/*   border:none; */
  border: solid 1px #ccc;
  padding:5px 0px 5px 0px;
  font-size:12pt;
  height: 30px;
  
}


input:placeholder-shown + label{
  font-size:14pt;
  top:15px;
} 

input{
	appearance: none;
   /* 	outline: none; */
    height: 40px;
    /* border: 1px solid rgb(224, 224, 224); */
  	border-radius: 5px;
   	color: rgb(62, 62, 62); 
   	line-height: 22px;
}

.links{
      text-align: center;
      margin-bottom: 10px;
}
.card-body {
	text-align: center;
}
.findForm {
	text-align: center;
	position: relative;
	padding: 10px;
	font-size: 16px;
	margin: 0 auto;
	width: 600px;
} 

/* 버튼 영역 */
.btn {
    background-color: #6D3114;
    color: white;
    text-align: center;
    cursor: pointer;
}

.submit{
	padding: 15px;
}
</style>
<body>	
	<div class= "card-body">
	<form action="findId.do" method="POST" name="findId" id="form-find">
		<div class="findForm">
			<div style="margin: 30px;">
				<h3>아이디 찾기</h3>
			</div>
			<div class="input-box">
				<label>name</label>
				<input type="text" name="uname" id="name" placeholder="이름을 입력해주세요." >
			</div>	
			<div class="input-box">
				<label>Tel</label>
				<input type="text" name="uphone" id="phone" placeholder="핸드폰 번호를 입력해주세요.">
			</div>
			<div class="submit">
				<button type="submit" class="btn" value="check">아이디 찾기</button>
				<button type="button" class="btn" onclick="#">메인으로</button>
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
	<div class="links">
        <a href="pwdSearch.do">비밀번호 찾기</a> | <a href="loginPage.do">로그인</a> | <a href="userCheck.do">회원가입</a>
    </div>
<%@include file ="/main/footer.jsp" %>
</body>
</html>

