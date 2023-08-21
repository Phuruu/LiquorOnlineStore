<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA등록</title>
<link rel="stylesheet" href="./resources/css/common.css">
<script>
	function insert_go(frm) {
		var select  = document.getElementById("selectbox");
		var value = (select.options[select.selectedIndex].value);
		/* alert("value = " + value); */
		if (value == "선택") {
			alert("제목을 선택해주십시오");
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="/resources/js/header.jsp" />

<div id="container" align="center">
	<h1>QnA 등록</h1>
	
	<form action="insertQna.do" method="post">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<select id="selectbox" name="qTitle">
					<option value="선택" selected disabled>=== 선택 ===</option>
					<option value="배송 문의">배송 문의</option>
					<option value="상품 문의">상품 문의</option>
					<option value="기타 문의">기타 문의</option>
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
				<input type="password" name="qPwd" maxlength="4">
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<p>*작성 비밀번호를 4글자 이하로 입력하세요*</p>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="qContent" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="문의 등록" onclick="insert_go(this.form)">
			</td>
		</tr>
	</table>
	</form>
</div>

<br><br><br>
<jsp:include page="/resources/js/footer.jsp" />
</body>
</html>