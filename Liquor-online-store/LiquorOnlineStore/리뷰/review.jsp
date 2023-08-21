<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
/* function insertReview(){
	const rTitle = document.getElementById("rTitle").value;
	const rContent = document.getElementById("rContent").value;
	const rStar = document.getElementById("rStar").value;
	
	console.log(rTitle);
	console.log(rContent);
	console.log(rStar);
 
	$.ajax("insertReview.do", {
		type: "post",
		data : {rTitle : rTitle, rContent : rContent, rStar : rStar},
		success : function(){
			alert("리뷰가 등록 되었습니다");
			location.reload();
		},
		error : function(request, status, error){
			alert("실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})  
}
 */
function deleteReview(rCode){
	 
	let isDelete = confirm("리뷰를 삭제하시겠습니까?");

	if(isDelete){
		$.ajax("deleteReview.do", {
			type: "post",
			data : {rCode : rCode},
			success : function(){
				alert("리뷰가 삭제 되었습니다");
				location.reload();
			},
			error : function(request, status, error){
				alert("실패");
				console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}
		})  
 	} else {
 		return;
 	}
}

function btnReview(rCode){
	 
	 $.ajax("getReview.do", {
			type: "post",
			data : {rCode : rCode},
			success : function(){
				location.reload();
				$('#Review').html("<textarea rows='3' cols='30'>"
			             +"</textarea>");
			},
			error : function(request, status, error){
				alert("실패");
				console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}
		})  
}

/* function updateReview(rCode){
	console.log(rCode);

	$.ajax("updateReview.do", {
		type: "post",
		data : {rCode : rCode},
		success : function(){
			$('#Review').html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt
		                +"</textarea>");
			location.reload();
		},
		error : function(request, status, error){
			alert("실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})  
} */

function WriteReview(frm) {
    window.open("insertReview.jsp", 'insertReview', 'width=400, height=400');
}

function btnReview(rCode){
	alert(rCode);
	var rcode = rCode;
	window.open("getReview.do?rCode=rcode", 'updateReview', 'width=400, height=400');
}
  
</script>
<body>
<div id="contatiner" align="center">
<a href onclick="WriteReview(this.form); return false;" class="rvB">리뷰 작성</a>
	<div class="reviewList">
	<hr width="500px">
	<c:forEach var="review" items="${reviewList }">
		<br>
		<form action="getReviewList.do" method="get" >
			<h3>닉네임 </h3> 
 			<div class="Review">
				<c:choose>
	    		<c:when test="${review.rStar == '5'}">
			   		  ★★★★★
		    	</c:when>
		      	<c:when test="${review.rStar == '4'}">
		        	★★★★
		      	</c:when>
		       	<c:when test="${review.rStar == '3'}">
		      		 ★★★
		      	</c:when>
		       	<c:when test="${review.rStar == '2'}">
		      		  ★★
		      	</c:when>
		       	<c:when test="${review.rStar == '1'}">
		       		★
		      	</c:when>
		       	<c:otherwise>
		       		 별점 없음
		      	</c:otherwise>
		     	</c:choose>&nbsp;
				${review.rContent }
				</div>
			<br><br>
			<a href="javascript:btnReview(${review.rCode })">수정</a>
			<%-- <a href="javascript:insrtReview(${review.rCode })">수정</a> --%>
			<a href="javascript:deleteReview(${review.rCode })">삭제</a>
		</form>
		<br>
		<hr width="500px">
	</c:forEach>
	<c:if test="${empty reviewList }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
	<br>
	</div>
</div>
</body>
</html>