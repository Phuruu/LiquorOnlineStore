<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

	/* javascript:takjuJson() */
	function takjuJson(){
		alert("takjuJson() 실행~");
		
		$.ajax({
			type: "post",
			date: JSON.stringify(vo),
			contentType: "application/json",
			dataType: "json",
			success: function(respData){
				console.log(respData);
				
				let dispHtml = "";
			}
		});
	}
	
</script>
</head>
<body>
	<li>
		<a href="javascript:takjuJson()">탁주</a>
		<a href="">약청주</a>
		<a href="">증류주</a>
		<a href="">과실주</a>
	</li>
	
	<div class="container">
			<div>
				<p>탁주</p>
				<span></span>
			</div>
			
			<div>
				<table>
					<c:set var="i" value="0"/>
					<c:set var="j" value="4"/>
					<c:forEach var="result" items="${categoryList}">
						<c:if test="${i%j == 0 }">
						<tr>
						</c:if>
							<td>
								<a href="#">
									<img src="resources/alcohol_img/alcohol/${result.pCtyimg }" alt="product_takju">
									<p>${result.pName }</p>
									<p>가격: ${result.pPrice }원</p>
									<p></p>
									<hr>
									<p>${result.pInfo }</p>
								</a>
							</td>
								
						<c:if test="${i%j == j-1 }">
						</tr>
						</c:if>
						<c:set var="i" value="${i+1 }"/>
					</c:forEach>
				</table>
		</div>
			
	</div>
</body>
</html>