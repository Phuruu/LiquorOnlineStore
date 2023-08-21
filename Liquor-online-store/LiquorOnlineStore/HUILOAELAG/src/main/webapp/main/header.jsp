<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>희로애락</title>
    <!-- fontawesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- css -->
    <link rel="stylesheet" href="resources/css/common.css" />
  </head>
  <body>
    <div>
      <div class="Container">
        <!-- user 관련 헤드 -->
        <div class="user-header">
          <section class="user-menu">
            <div class="user-inner">
              <ul class="user-list">
                <li class="user-login" aria-labelledby="mui-4">
                  <a href="login.jsp">로그인/회원가입</a>
                </li>
                <li class="user-myPage">
                  <a href="myPage.jsp">마이페이지</a>
                </li>
                <li class="user-cart">
                  <a href="" onclick="GotoShoppingBag()">
                    <span class="icon-cart"></span> 장바구니<span id="spbCNT" name="spbCNT"></span>
                  </a>
                </li>
              </ul>
            </div>
          </section>
        </div>
        <div class="divider"></div>
        <!-- 메인 헤드 -->
        <div class="main-header">
          <div class="navigation-menu">
            <section class="nav-logo">
              <div class="img-wrapper">
                <a class="main-logo" href="main.jsp" alt="메인바로가기"></a>
              </div>
            </section>
            <form action="getSearchList.do">
	            <ul class="list">
	              <li class="searchInputWrapper">
	                <div class="search-box">
	                  <input
	                    type="text"
	                    class="search-txt"
	                    name="searchKeyword"
	                    placeholder="무엇을 찾고 계신가요?"
	                  />
	                  <a class="search-btn" href="getSearchList.do">
	                    <i
	                      class="fa-solid fa-magnifying-glass search-icon"
	                      alt="search_icon"
	                    ></i>
	                  </a>
	                </div>
	              </li>
	            </ul>
            </form>
          </div>
        </div>
        <div class="divider"></div>
    </div>
    <!-- Start Script -->
    <script src="js/common.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- End Script -->
  </body>
</html>
