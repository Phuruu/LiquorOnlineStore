<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
<script>
window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}

</script>
<meta charset="UTF-8">
<title>공지사항</title>
<%@include file ="/main/header.jsp" %>
<link rel="stylesheet" href="resources/css/notifyList.css">
</head>
<body>
    <div class = "forEx">
	    <h1 style="text-align: center; color: white; padding: 190px;">공지사항 </h1>
	</div>
    
    	
    <div class="parent">
	<div class="content">
	    <br>
	    <table>
	      <thead>
	        <tr>
	          <th>No</th>
	          <th width="90%;">제목</th>
	          <th>작성일</th>
	        </tr>
	      </thead>
	      <tbody class="text-center" style="text-align: center;">
	        <c:forEach items="${NotifyList }" var="list">
	        <tr>
	          <td>${list.nCode }</td>
	          <td class="text-left" width="50%">
	            <div class="panel-faq-container">
	              <p class="panel-faq-title">${list.nTitle }</p>
	              <div class="panel-faq-answer">
	                <div class="nContent">${list.nContent }</div>
	              </div>
	            </div>
	          </td>
	          <td><fmt:formatDate value="${list.nDate }" pattern="yyyy/MM/dd"/></td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	  </div>
	  </div>
	  <div id="space"></div>
<%@include file ="/main/footer.jsp" %>
</body>
</html>