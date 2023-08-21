<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<%@ include file="header.jsp"%>
	<div class="Container">
		<div class="ContentWrapper">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../resources/img/event-banner-001.png"
							style="width: 100%; height: 100%" class="d-block" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="../resources/img/event-banner-002.png"
							style="width: 100%; height: 100%" class="d-block" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="../resources/img/event-banner-003.png"
							style="width: 100%; height: 100%" class="d-block" alt="..." />
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- End Banner Hero -->
			<div class="soolTypeSelectWrapper">
				<div class="soolTypeSelectInnerWrapper">
					<div class="soolTypeSelect">
						<a href="category-takju.jsp">
							<div>
								<img src="../resources/img/icon-takju.png" alt="메인 카테고리 아이콘" />
							</div> <label class="name">탁주</label>
						</a>
					</div>
					<div class="soolTypeSelect">
						<div>
							<img src="../resources/img/icon-yakju.png" alt="메인 카테고리 아이콘" />
						</div>
						<label class="name">약·청주</label>
					</div>
					<div class="soolTypeSelect">
						<div>
							<img src="../resources/img/icon-gwasilju.png" alt="메인 카테고리 아이콘" />
						</div>
						<label class="name">과실주</label>
					</div>
					<div class="soolTypeSelect">
						<div>
							<img src="../resources/img/icon-jeunglyujuju.png"
								alt="메인 카테고리 아이콘" />
						</div>
						<label class="name">증류주</label>
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<!-- 오늘의 추천 상품 (8개)soolRecommendWrapper  -->
			<div class="soolRcmWrapper">
				<div class="soolRcmHeader">
					<img src="../resources/img/today-pick.png" alt="추천" width="45"
						height="45" />
					<div class="title">
						<div class="main-title">이번 주 희로애락 PICK!</div>
						<div class="sub-title">고민된다면 이 술 어때요?</div>
					</div>
				</div>
				<div class="soolRcmPrdListWrapper">
					<div class="rcmPrdListContent">
						<c:forEach var="vo" items="${productList }">
							<div class="rcmPrdListBox"
								style="margin-right: 15px; width: 265.25px">
								<div class="rcmPrd">
									<!-- 해당 상품으로 이동할 경로 설정 -->
									<a href="#">
										<div class="img-wrapper">
											<span
												style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
												<span
												style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 126.923% 0px 0px;"></span>
												<img src="${vo.pctyImg }" decoding="async"
												data-nimg="responsive"
												style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;" />
											</span>
										</div>
										<div class="cardContentWrapper">
											<div class="wrapper">
												<div class="productName">${vo.pname }상품이름</div>
											</div>
											<div class="wrapper">
												<div class="priceWrapper">
													<div class="flex original-wrapper">
														<p class="originalPrice">
															<fmt:formatNumber value="${vo.pprice }" pattern="#,###원" />
															<span>원</span>
														</p>
													</div>
												</div>
												<div class="score-review-wrapper flex">
													<img src="../resources/img/star.png" alt="별" height="12" />
													<p class="ratedScore">{vo.reatedScore}</p>
													<div class="column-line"></div>
													<p class="numberOfReview">리뷰 {vo.리뷰갯수}</p>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script src="../resources/js/common.js"></script>
</body>
</html>