<%@page import="com.spring.huiloaelag.qna.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.huiloaelag.qna.dao.QnaDAO"%>
<%@page import="com.spring.huiloaelag.qna.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 현재 페이지에 표시할 데이터를 구해서 화면에 표시 
	1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
	2. 페이징 객체에 설정할 데이터 저장
	3. (DB) 전체 데이터 건수 조회
	4. (DB) 현재 페이지에 표시할 게시글 데이터 조회
	5. 데이터 화면 표시(화면컨트롤 - 스타일 지정)
--%>
<%-- <%
	//0. 페이징 처리를 위한 객체(Paging) 생성
	Paging p = new Paging();
	
	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(QnaDAO.getTotalCount());
	p.setTotalPage();
	
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> Paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	//3-1. (선택적) 끝번호가 데이터 건수보다 크면 데이터 건수와 동일하게 처리
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//------- 블록(Block) 계산하기 ---------
	//4. 블록 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
	//4-1. 시작페이지, 끝페이지 구하기
	int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getPagePerBlock() - 1);
	
	//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체페이지 수로 변경 처리
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
	
	//=========================
	// 현재 페이지 기준으로 DB 데이터(게시글) 가져오기
	List<QnaVO> list = QnaDAO.getQna(p.getBegin(), p.getEnd());
	System.out.println(">> 현재페이지 글목록(list) : " + list);
	
	// 데이터를 화면에 표시(출력)
	pageContext.setAttribute("list", list); //게시글 데이터
	pageContext.setAttribute("pvo", p); //페이지 관련 데이터
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
<link rel="stylesheet" href="./resources/css/common.css">
<script>
	function goViewQna(val1,val2) {
		var f = document.viewQna;
		console.log("val1 : " + val1);
		console.log("val2 : " + val2);
		/* f.action="viewQna.jsp";
		f.method="post"; */
		sessionStorage.setItem("getPwd", val2);
		location.href = 'viewQna.jsp?qCode=' + val1;
	}
</script>
</head>
<body>
<jsp:include page="/resources/js/header.jsp" />

<div id="container" align = "center">
	<h1>QnA</h1>
	
	<form action="getQnaList.do" method="post">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">
					<option value="NAME">작성자</option>
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	
	<!-- <form action="viewQna.jsp" method="post"> -->
	<form name="viewQna">
	<table>
		<thead>
			<tr>
				<th width="100">번호</th>
				<th width="200">제목</th>
				<th width="150">작성자</th>
				<th width="150">작성일</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="qna" items="${qnaList }">
				<tr>
					<td>${qna.qCode }</td>
					<td>
						<input type="hidden" name="qCode" value="${qna.qCode }">
						<input type="hidden" name="qPwd" value="${qna.qPwd }">
						<a href="javascript:goViewQna('${qna.qCode }', '${qna.qPwd }');">${qna.qTitle }</a>
						<%-- <a href="viewQna.jsp?qCode=${qna.qCode }&qPwd=${qna.qPwd }">${qna.qTitle }</a> --%>
						<%-- <input type="button" value="${qna.qTitle }" onclick="javascript:goViewQna('${qna.qCode }', '${qna.qPwd }');"> --%>
					</td>
					<td>${qna.uName }</td>
					<td>${qna.qDate }</td>
				</tr>
			</c:forEach>
			<c:if test="${empty qnaList }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<ol class="paging">
					<%-- [이전으로]에 대한 사용가능 여부 처리 --%>
					<c:if test="${pvo.beginPage == 1 }">
						<li class="disable">이전으로</li>
					</c:if>	
					<c:if test="${pvo.beginPage != 1 }">
						<li>
							<a href="list.jsp?cPage=${pvo.beginPage - 1 }">이전으로</a>
						</li>
					</c:if>	
						
					<%--블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>	
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:if test="${pageNo == pvo.nowPage}">
							<li class="now">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != pvo.nowPage}">
							<li><a href="list.jsp?cPage=${pageNo }">${pageNo }</a></li>
						</c:if>
						
					</c:forEach>
					
					<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="list.jsp?cPage=${pvo.endPage + 1 }">다음으로</a>
						</li>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음으로</li>
					</c:if>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	<br><br>
	<p><a href="insertQna.jsp" style="text-decoration: underline;"><b>문의 등록</b></a></p>
</div>

<br><br><br>
<jsp:include page="/resources/js/footer.jsp" />
</body>
</html>