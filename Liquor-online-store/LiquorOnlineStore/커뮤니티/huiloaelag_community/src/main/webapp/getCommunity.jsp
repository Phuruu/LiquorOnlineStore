<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	th{
		padding: 10px 0 20px 0;
	}
	
	td{
		padding: 10px 0 0 0;
	}
	a:hover {
  		color : red;
	}

</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
function btn_InsertCommunity(frm){
	var mPwd = document.getElementById("mPwd").value;
	
	var cPwd = prompt("게시글 비밀번호를 입력해주세요"+"");
	
	if(cPwd == mPwd){
		alert("비밀번호가 일치합니다.");
		location.href="updateCommunity.jsp";
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
}

//좋아요(공감)
function goodCheck(){
	$.ajax("Like.do?mCode=${community.mCode }", {
		type: "post",
		success : function(data){
			location.reload();
		},
		error : function(request, status, error){
			alert("좋아요 누르기 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})
}

//댓글
function insert_Comment(mCode){
	//uCode도 추가해야됨
	var cmtContent = document.getElementById("cmtContent").value;
	var cmtPwd = document.getElementById("cmtPwd").value;
 	
/* 	console.log(mCode);
	console.log(cmtContent);
	console.log(cmtPwd); */
	$.ajax("insertComment.do", {
		type: "post",
		data : {mCode : mCode, cmtContent : cmtContent, cmtPwd : cmtPwd},
		success : function(){
			alert("댓글이 등록 되었습니다");
			location.reload();
		},
		error : function(request, status, error){
			alert("댓글 등록 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})
}

function btn_updateComment(cmtCode, cmtContent){
	$.ajax("getComment.do", { 
		type: "post",
		data : {cmtCode : cmtCode},
		success : function(comment){
			var checkPwd = document.getElementById("checkPwd").value;
			if(comment == checkPwd){
				alert("비밀번호가  일치합니다.\n 댓글을 수정해주세요.");
				$(".comment"+cmtCode).html("<textarea rows='3' cols='30' name='updateContent' id='updateContent'>"+cmtContent+"</textarea><br><a href='javascript:update_Comment("+cmtCode+")'>수정완료</a>");
			} else {
				alert("비밀번호가 일치하지 않습니다.\n 비밀번호를 확인해주세요.");
			}
		},
		error : function(request, status, error){
			alert("댓글 수정 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})
}

function update_Comment(cmtCode){
	//alert(cmtCode);
	var updateContent = document.getElementById("updateContent").value;
	
	$.ajax("updateComment.do", { 
		type: "post",
		data : {cmtCode : cmtCode, cmtContent : updateContent},
		success : function(){
			alert("댓글 수정이 완료되었습니다");
			location.reload();
		},
		error : function(request, status, error){
			alert("댓글 수정 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	}) 
}

function delete_Comment(cmtCode){
	var checkPwd = document.getElementById("checkPwd").value;
	
	//console.log(cmtCode);
	//console.log(checkPwd);
	let isDelete = confirm("댓글을 삭제하시겠습니까?");

	if(isDelete){
		$.ajax("deleteComment.do", {
			type: "post",
			data : {cmtCode : cmtCode, cmtPwd : checkPwd},
			success : function(result){
				if(result){
					alert("댓글이 삭제 되었습니다");
					location.reload();
				} else {
					alert("비밀번호가 일치하지 않습니다.\n 비밀번호를 확인해주세요.");
				}
			},
			error : function(request, status, error){
				alert("댓글 삭제 실패");
				console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}
		})  
 	} else {
 		return;
 	}
}
</script>
<body>
<div id="container" align="center">
	<h1>POST</h1>
	<form action="viewCommunity.jsp" method="post">
		<input type="hidden" name="mCode" value="${community.mCode }">
		<input type="hidden" name="mPwd" id="mPwd" value="${community.mPwd }">
		<input type="hidden" name="mTitle" id="mTitle" value="${community.mTitle }">
		<input type="hidden" name="mContent" id="mContent" value="${community.mContent }">
		<input type="hidden" name="mDate" id="mDate" value="${community.mDate }">
		<input type="hidden" name="mGood" id="mGood" value="${community.mGood }">
		<table>
		<tr>
			<td>제목</td>
			<td>${community.mTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${community.uCode }</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${community.mDate }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${community.mContent }</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="수정하기">
				<!-- <a href="javascript:btn_InsertCommunity()">수정하기</a> -->
			</td>
		</tr> 
		</table>
	</form>
	<div>
		 <input type="button" value="♥" onclick="goodCheck()"/> ${community.mGood}
	</div>
	<hr width="700">
	<form>
	<table>
		<tr>
			<td colspan="2"><input type="text" name="uNick" value="닉네임" disabled></td>
		</tr>
		<tr>
			<td colspan="2"><textarea id="cmtContent" name="cmtContent" rows="4" cols="40"></textarea></td>
		</tr>
		<tr>
			<td align="right" width="240">비밀번호&nbsp;<input type="password" id="cmtPwd" name="cmtPwd" size="7"></td>
			<td align="right"><input type="button" value="댓글등록" onclick="insert_Comment(${community.mCode })"></td>
		</tr>                                 
	</table>
	</form>
	<hr width="500px">
	<c:forEach var="comments" items="${commentsList }">
		<br>
		<form action="getComment.do" method="get">
			<h3>닉네임 </h3>
			<div class="comment${comments.cmtCode }">
			${comments.cmtContent }
			<br><br>
			<input type="password" id="checkPwd" name="checkPwd" placeholder="댓글 비밀번호" size="6">
			<a href="javascript:btn_updateComment('${comments.cmtCode }','${comments.cmtContent }')">수정</a>
			<a href="javascript:delete_Comment(${comments.cmtCode })">삭제</a>
			<%-- <input type="button" value="댓글수정" onclick="update_Comment(${comments.cmtCode })"> --%>
			</div>
		</form>
		<br>
		<hr width="500px">
	</c:forEach>
	<br>
</div>
</body>
</html>
<%@include file ="resources/js/footer.jsp" %>