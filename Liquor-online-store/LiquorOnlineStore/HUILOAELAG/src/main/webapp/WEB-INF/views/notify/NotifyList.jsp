<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>

.noticeImg{
	background-image: url(resources/img/notice-img.jpg);
	width: 1180px;
	margin: 50px auto 100px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: auto;
}
.panel-faq-container {
  margin-bottom: -16px;
}
.panel-faq-title {
  	cursor: pointer;
	padding: 10px;
}
.panel-faq-answer {
  height: 0;
  overflow: hidden;
  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
  왜? 닫기 버튼을 누를 때 변화가 티남 */
  transition: all 1s;
}

.active {
  display: block;
  /* 높이를 정해줘야지만 transition이 적용됨 */
  height: 300px;
}
.divider{
	text-align: center;
}
.container{
	width: 1180px;
	margin: 0 auto;
	text-align: center;
	padding: 10px;
	margin-left: 300px; 
}

.nContent {
	margin: 5%;
}

#divider{
	border-bottom: 0.5px solid rgb(224, 224, 224);
}

#space{
	margin: 50px auto 100px;
}
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
<link rel="stylesheet" href="resources/css/common.css">
<%@include file ="/main/header.jsp" %>
</head>
<body>
	<div class="noticeImg">
	    <h1 style="text-align: center; padding-top: 50px;">공지사항 </h1>
    </div>
    <div id="divider"></div>
	<div class="container">
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
	  <div id="space"></div>
<%@include file ="/main/footer.jsp" %>
</body>
</html>