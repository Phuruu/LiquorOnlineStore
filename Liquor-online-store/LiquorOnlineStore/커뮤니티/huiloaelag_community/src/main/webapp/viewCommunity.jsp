<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="resources/js/header.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String mCode = request.getParameter("mCode");
	String mPwd = request.getParameter("mPwd");
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
</head>
<script>
	function check_pwd(frm){
		
		var checkPwd = document.getElementById("checkPwd").value;
		//console.log('checkPwd : ' + checkPwd);
		var mPwd = <%=mPwd %>;
		
		if(checkPwd == mPwd){
			alert("비밀번호가 일치합니다\n수정페이지로 이동합니다");
			frm.action="updateCommunity.jsp";
		} else {
			alert("비밀번호가 일치하지않습니다.");
			history.back();
		}
	}
</script>
<body>
${community.mPwd }
<div id="container" align="center">
	<h1>수정을 위한 비밀번호 입력</h1>
	<form>
		<input type="password" name="checkPwd" id="checkPwd" placeholder="비밀번호 입력">
		<input type="submit" id="check" value="수정하기" onclick="check_pwd(this.form)">
		<input type="hidden" name="mCode" value="<%=mCode %>">
		<input type="hidden" name="mPwd" id="mPwd" value="<%=mPwd %>">
		<input type="hidden" name="mTitle" id="mTitle" value="<%=mTitle %>">
		<input type="hidden" name="mContent" id="mContent" value="<%=mContent %>">
		<input type="hidden" name="mDate" id="mDate" value="<%=mDate %>">
		<input type="hidden" name="mGood" id="mGood" value="<%=mGood %>">
	</form>
</div>
</body>
</html>
<%@include file ="resources/js/footer.jsp" %>