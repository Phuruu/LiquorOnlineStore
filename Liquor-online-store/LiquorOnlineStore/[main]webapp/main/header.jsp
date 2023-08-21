<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>희로애락: 喜怒哀樂</title>
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="../resources/css/common.css" />
</head>
<body>
	<div>
		<div class="Container">
			<!-- user 관련 헤드 -->
			<div class="user-header">
				<section class="user-menu">
					<div class="user-inner">
						<ul class="user-list">
							<li class="user-login" aria-labelledby="mui-4"><a
								href="login.jsp">로그인/회원가입</a></li>
							<li class="user-myPage"><a href="myPage.jsp">마이페이지</a></li>
							<li class="user-cart"><a href="" onclick="GotoShoppingBag()">
									<span class="icon-cart"></span> 장바구니 <span id="spbCNT"
									name="spbCNT"></span>
							</a></li>
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
					<ul class="list">
						<li class="searchInputWrapper">
							<div class="search-box">
								<input type="text" class="search-txt" name="searchKeyword"
									placeholder="무엇을 찾고 계신가요?" /> <a class="search-button"
									href="getSearchList.do"> <i
									class="fa-solid fa-magnifying-glass search-icon"
									alt="search-icon"></i>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="divider"></div>
			<!-- 카테고리 헤드 -->
			<div class="category-header">
				<div class="category-list-wrapper">
					<ul class="category-list">
						<li class="main">
							<div>
								<a href="main.jsp">홈</a>
							</div>
						</li>
						<li class="product-total">
							<div>
								<a href="total.jsp">전체상품</a>
							</div>
						</li>
						<li class="product-local">
							<div>
								<a href="local.jsp">지역상품</a>
							</div>
						</li>
						<li class="community">
							<div>
								<a href="community.jsp">커뮤니티</a>
							</div>
						</li>
						<li class="event">
							<div>
								<a href="event.jsp">이벤트</a>
							</div>
						</li>
						<li class="notice">
							<div>
								<a href="notice.jsp">공지사항</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="divider"></div>
		</div>
	</div>
</body>
</html>
