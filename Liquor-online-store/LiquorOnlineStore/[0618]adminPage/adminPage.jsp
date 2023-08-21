<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>희로애락: 관리자</title>
    <!-- fontawesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- jquery -->
      <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="resources/adminCss/admin.css" />
  </head>
  <body>
    <div class="Container">
      <!-- 화면 영역 -->
      <div id="main">
        <div class="head">
          <div class="head-menu">
            <div class="side-open">
              <button class="open-sidebar" onclick="openMenu()">
                <i class="fa-solid fa-bars fa-2xl" style="color: #6d3114"></i>
              </button>
            </div>
            <div class="admin-menu">
              <div class="admin-content">
                <ul class="admin-list">
                  <li>
                    <a class="welcome">관리자님, 어서오세요</a>
                  </li>
                  <li>
                    <a href="loginPage.do" class="home">HOME</a>
                  </li>
                  <li>
                    <a href="logout.do" class="logout">로그아웃</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <!-- 사이드메뉴에 따른 메인 영역 -->
        <div class="content-wrapper">
          <div id="order_div">
            <table class="order-table">
              <thead class="order-th">
                <tr class="order-tr">
                  <th>NO</th>
                  <th>이름</th>
                  <th>연락처</th>
                  <th>배송지주소</th>
                  <th>상품명</th>
                  <th>수량</th>
                  <th>금액</th>
                  <th>결제수단</th>
                  <th>주문일자</th>
                </tr>
              </thead>
              <tbody>
                <td>
                  <!-- test -->
                </td>
              </tbody>
            </table>
          </div>
          <div id="chart_div" style="width: 700px; height: 900px"></div>
          <div id="detailSales">
            <h3 class="detailTitle">기간별 매출현황</h3>
            <input class="datetimes" type="text" name="datetimes" readonly="readonly" />
            <div class="detail-content">
              <table class="detail-table">
                <thead class="detail-th">
                  <tr>
                    <th>NO</th>
                    <th>상품코드</th>
                    <th>상품명</th>
                    <th>금액</th>
                    <th>판매량</th>
                    <th>총매출금액</th>
                  </tr>
                </thead>
                <tbody id="detailSales_tbody"></tbody>
              </table>
            </div>
          </div>

          <div id="store_div">
            <div id="product_table">
              <ul id="product_ul">
                <!-- detail부분에 들어갈 파라미터 값 상품 코드 넣기 -->
                <li id="product_li">
                  <a href="javascript:detail(1);">탁주</a>
                </li>
                <li id="product_li">
                  <a href="javascript:detail(2);">약·청주</a>
                </li>
                <li id="product_li">
                  <a href="javascript:detail(3);">과실주</a>
                </li>
                <li id="product_li">
                  <a href="javascript:detail(4);">증류주</a>
                </li>
              </ul>
            </div>
            <div id="detail_product">
              <table>
                <thead id="product_head">
                  <tr>
                    <th>상품코드</th>
                    <th>상품명</th>
                    <th>상품가격</th>
                    <th>상품설명</th>
                    <th>
                      <a href="product_state.do?state=1&pcode=0"
                        ><img
                          id="insertImg"
                          src="resources/image/insert.png"
                          alt="추가"
                      /></a>
                    </th>
                  </tr>
                </thead>

                <tbody id="product_tbody"></tbody>
              </table>
            </div>

            <div id="review_table">
              <table>
                <thead id="review_head">
                  <tr>
                    <th>NO</th>
                    <th>ID</th>
                    <th>상품코드</th>
                    <th>작성일자</th>
                    <th>상품명</th>
                    <th>리뷰내용</th>
                    <th>별점</th>
                    <th>상태처리</th>
                  </tr>
                </thead>
                <tbody id="review_tbody"></tbody>
              </table>
            </div>
          </div>
          <div id="membership_div">
            <form class="searchForm">
              <div class="searchDiv">
                <div class="search-Division">
                  <select name="searchDivision" class="searchNum">
                    <option value="1" selected>아이디</option>
                    <option value="2">이름</option>
                    <option value="3">닉네임</option>
                  </select>
                </div>
                <div class="search-input">
                  <div class="search-input-txt">
                    <input
                      type="text"
                      name="searchKeyword"
                      class="searchText"
                      placeholder="Search.."
                    />
                    <span></span>
                  </div>
                </div>
                <input
                  type="button"
                  value="검색 &#x1F50D"
                  name="searchBtn"
                  class="searchBtn"
                  onclick="memberManagement(searchDivision.value, searchKeyword.value);"
                />
              </div>
            </form>
            <table  class="user-table">
              <thead class="user-th">
                <tr>
                  <th id="user_th">USER CODE</th>
                  <th id="user_th">ID</th>
                  <th id="user_th">이름</th>
                  <th id="user_th">비밀번호</th>
                  <th id="user_th">닉네임</th>
                  <th id="user_th">주소</th>
                  <th id="user_th">성별</th>
                  <th id="user_th">이메일</th>
                  <th id="user_th">생년월일</th>
                  <th id="user_th">휴대폰번호</th>
                  <th id="user_th"></th>
                </tr>
              </thead>
              <tbody id="membership_tbody"></tbody>
            </table>
          </div>

          <div id="QandA_div">
            <form class="searchForm">
              <div class="searchDiv">
                <div class="search-Division">
                  <select name="searchDivision" class="searchNum">
                    <option value="1" selected>문의코드</option>
                    <option value="2">문의내용</option>
                  </select>
                </div>
                <div class="search-input">
                  <div class="search-input-txt">
                    <input
                      type="text"
                      name="searchKeyword"
                      class="searchText"
                      placeholder="Search.."
                    />
                    <span></span>
                  </div>
                </div>
                <input
                  type="button"
                  value="검색 &#x1F50D"
                  name="searchBtn"
                  class="searchBtn"
                  onclick="questionManagement(searchDivision.value, searchKeyword.value);"
                />
              </div>
            </form>
            <table class="qna-table">
              <thead class="qna-th">
                <tr>
                  <th>No</th>
                  <th>문의코드</th>
                  <th>문의제목</th>
                  <th>문의내용</th>
                  <th>문의날짜</th>
                  <th></th>
                </tr>
              </thead>
              <tbody id="QnA_tbody"></tbody>
            </table>
          </div>

          <div id="notice_div">
            <table id="noticecenter" class="noticeTable">
              <thead id="notice_head">
                <tr>
                  <th>No</th>
                  <th>공지코드</th>
                  <th>공지제목</th>
                  <th>공지내용</th>
                  <th>공지날짜</th>
                  <th>
                    <a href="noticeInsert.do"
                      ><img
                        id="insertImg"
                        src="resources/image/insert.png"
                        alt="추가"
                    /></a>
                  </th>
                </tr>
              </thead>
              <tbody id="notice_tbody"></tbody>
            </table>
          </div>
          <!-- footer -->
          <div class="footerWrapper">
            <h2 class="blind">하위영역</h2>
            <div class="footerInnerWrapper">
              <div class="footer-item">
                <div class="footerSubDescriptionWrapper">
                  <p class="company">희로애락㈜</p>
                  <p class="footer-sub-item">고객센터 : 1588-8282</p>
                </div>
              </div>
              <div class="footerMenu">
                <a class="footer-item-modal" id="policy">이용약관</a>
                <div class="modal-wrapper">
                  <div class="fmodal-content">
                    <div class="modal-close">&times;</div>
                    <div class="fmodal-title">[이용약관] 희로애락 주식회사</div>
                    <div class="modal-text">
                      <p>제 1조 (목적)</p>
                      <p>
                        이 약관은 희로애락 주식회사(전자상거래 사업자)(이하
                        "회사")가 운영하는 인터넷사이트 사업자(이하
                        "희로애락")에서 제공하는 전자상거래 관련 서비스(이하
                        "서비스")를 이용함에 있어 사업자 이용자의 권리, 의무 및
                        책임사항을 규정함을 목적으로 합니다. ※ 「PC통신,
                        스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그
                        성질에 반하지 않는 한 준용합니다」
                      </p>
                      <br />
                      <p>제 2조 (정의)</p>
                      <p>
                        ① "희로애락"이란 회사가 재화 또는 용역(이하 "재화
                        등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등
                        정보통신설비를 이용하여 재화 등을 거래할 수 있도록
                        설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는
                        사업자의 의미로도 사용합니다.
                      </p>
                      <p>
                        ② "이용자"란 "희로애락"에 접속하여 이 약관에 따라
                        "희로애락"가 제공하는 서비스를 받는 회원 및 비회원을
                        말합니다.
                      </p>
                      <p>
                        ③ "회원"이라 함은 "희로애락"에 회원등록을 한 자로서,
                        계속적으로 "희로애락"가 제공하는 서비스를 이용할 수 있는
                        자를 말합니다.
                      </p>
                      <p>
                        ④ "비회원"이라 함은 회원에 가입하지 않고 "희로애락"이
                        제공하는 서비스를 이용하는 자를 말합니다.
                      </p>
                      <p>
                        ⑤ "콘텐츠"란 회사 또는 이용자가 서비스 상에 게시 또는
                        등록하는 모든 글, 사진, 동영상, 각종 파일, 링크,
                        회원소개 등(부호, 문자, 영상, 그림 등 그 형태를
                        불문합니다) 희로애락 내에서 게시 또는 사용되는 일체의
                        정보를 말합니다.
                      </p>
                    </div>
                  </div>
                </div>
                <a class="footer-item-modal" id="privacy"> 개인정보처리방침</a>
                <div class="modal-wrapper">
                  <div class="fmodal-content">
                    <span class="modal-close">&times;</span>
                    <div class="fmodal-title">
                      [개인정보처리방침] 희로애락 주식회사
                    </div>
                    <div class="modal-text">
                      <p>
                        희로애락 주식회사(이하 “회사”)는 개인정보 보호 관련
                        법령에 따라 고객의 개인정보를 보호하고 이와 관련한
                        고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여
                        다음과 같이 개인정보 처리방침을 수립·공개합니다.
                      </p>
                      <p>
                        “회사”는 개인정보 처리방침 페이지를 통하여 이용자들이
                        제공하는 개인정보가 어떠한 용도와 방식으로 이용되고
                        있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지
                        알려 드립니다. “회사”는 해당 페이지를 홈페이지 첫 화면에
                        공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록
                        조치하고 있습니다. 개인정보 처리방침을 개정하는 경우나
                        개인정보 처리방침이 변경될 경우 또한 개인정보 처리방침
                        페이지를 통해 고지하고 있습니다. 이용자들께서는 사이트
                        방문 시 수시로 확인하실 것을 권장드립니다.
                      </p>
                      <p>
                        1. 개인정보 수집에 대한 동의 담화컴퍼니 주식회사는
                        이용자들이 회사의 개인정보 처리방침 또는 이용약관의
                        내용에 대하여 회원가입 시 「가입완료」버튼 또는
                        「취소」버튼을 클릭할 수 있는 절차를 마련하여,
                        「가입완료」버튼을 클릭하면 개인정보 수집에 대해 동의한
                        것으로 봅니다. 회사의 물품 및 서비스의 구매를 위해 모든
                        상품 구매자의 본인인증 절차를 걸쳐야 하며, 비회원 고객은
                        물품 및 서비스의 구매를 하실 수 없습니다.
                      </p>
                    </div>
                  </div>
                </div>
                <a
                  class="footer-item-modal"
                  id="forms"
                  href="https://docs.google.com/forms/d/e/1FAIpQLSe9Ck04ROR6Ynevmh5oXJCdsHLYUp_fDbD9aUK8kbD7xfPq4Q/viewform?usp=sf_link"
                >
                  입점문의
                </a>
              </div>
              <div class="footerDescriptionWrapper">
                <div class="footer-info">
                  <p class="mr-12">대표 : 신사임당</p>
                  <p class="mr-8">사업자등록번호 : 123-45-67890</p>
                  <p>통신판매업신고번호 : 제01-2345호</p>
                </div>
                <div class="footer-info">
                  <p class="mr-12">주소 : 서울특별시 강남구 학동로 426</p>
                  <p class="mr-12">
                    <a href="mailto:helpcustomer@huiloaelag.co.kr">
                      이메일 : helpcustomer@huiloaelag.co.kr
                    </a>
                  </p>
                </div>
                <div class="footer-end">
                  <p>
                    희로애락㈜은 통신판매중개자이며, 통신판매의 당사자가
                    아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은
                    판매자에게 있습니다.
                  </p>
                  <p>
                    COPYRIGHT ©<strong>희로애락</strong> ALL RIGHTS RESERVED.
                  </p>
                </div>
              </div>
            </div>
            <div class="top_btn"></div>
          </div>
        </div>
      </div>
      <!-- 사이드 메뉴 영역 -->
      <div class="sidebar">
        <a class="close-sidebar" onclick="closeMenu()">&times;</a>
        <div class="accodion">
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">주문내역관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a
                id="Management"
                class="order"
                href="javascript:orderHistory();"
              >
                주문내역관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">매출정보</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a
                id="Management"
                class="order"
                href="javascript:salesManagement();"
              >
                매출정보
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">매장관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a id="Management" href="javascript:productManagement();">
                제품관리 </a
              ><br />
              <a id="Management" href="javascript:reviewManagement();">
                리뷰관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">회원관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a id="Management" href="javascript:memberManagement();">
                회원관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">Q&A관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a id="Management" href="javascript:questionManagement();">
                Q&A관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">공지사항 등록</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a
                id="Management"
                class="announcement"
                href="javascript:announcement();"
              >
                공지사항 등록
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- 사이드메뉴에 따른 메인 영역 -->
      <div class="content-wrapper">
        <div id="order_div">
          <table id="center">
            <thead id="order_head">
              <tr>
                <th>NO</th>
                <th>이름</th>
                <th>연락처</th>
                <th>배송지주소</th>
                <th>상품명</th>
                <th>수량</th>
                <th>금액</th>
                <th>결제수단</th>
                <th>주문일자</th>
              </tr>
            </thead>
          </table>
        </div>
        <div
          id="chart_div"
          style="
            width: 700px;
            height: 900px;
            margin-left: -250px;
            margin-top: 50px;
          "
        ></div>
        <div id="detailSales">
          <h3 id="coler_h3">기간별 매출현황</h3>
          <input type="text" name="datetimes" readonly="readonly" />
          <div id="div_id">
            <table id="detailcenter">
              <thead id="detail_head">
                <tr>
                  <th>NO</th>
                  <th>상품코드</th>
                  <th>상품명</th>
                  <th>금액</th>
                  <th>판매량</th>
                  <th>총매출금액</th>
                </tr>
              </thead>
              <tbody id="detailSales_tbody"></tbody>
            </table>
          </div>
        </div>

        <div id="store_div">
          <div id="product_table">
            <ul id="product_ul">
              <!-- detail부분에 들어갈 파라미터 값 상품 코드 넣기 -->
              <li id="product_li"><a href="javascript:detail(1);">탁주</a></li>
              <li id="product_li">
                <a href="javascript:detail(2);">약·청주</a>
              </li>
              <li id="product_li">
                <a href="javascript:detail(3);">과실주</a>
              </li>
              <li id="product_li">
                <a href="javascript:detail(4);">증류주</a>
              </li>
            </ul>
          </div>
          <div id="detail_product">
            <table>
              <thead id="product_head">
                <tr>
                  <th>상품코드</th>
                  <th>상품명</th>
                  <th>상품가격</th>
                  <th>상품설명</th>
                  <th>
                    <a href="product_state.do?state=1&pcode=0"
                      ><img
                        id="insertImg"
                        src="resources/image/insert.png"
                        alt="추가"
                    /></a>
                  </th>
                </tr>
              </thead>

              <tbody id="product_tbody"></tbody>
            </table>
          </div>

          <div id="review_table">
            <table>
              <thead id="review_head">
                <tr>
                  <th>NO</th>
                  <th>ID</th>
                  <th>상품코드</th>
                  <th>작성일자</th>
                  <th>상품명</th>
                  <th>리뷰내용</th>
                  <th>별점</th>
                  <th>상태처리</th>
                </tr>
              </thead>
              <tbody id="review_tbody"></tbody>
            </table>
          </div>
        </div>
        <div id="membership_div">
          <form class="searchForm">
            <div class="searchDiv">
              <div class="search-Division">
                <select name="searchDivision" class="searchNum">
                  <option value="1" selected>아이디</option>
                  <option value="2">이름</option>
                  <option value="3">닉네임</option>
                </select>
              </div>
              <input
                type="text"
                name="searchKeyword"
                class="searchText"
                placeholder="Search.."
              />
              <input
                type="button"
                value="검색🔍"
                name="searchBtn"
                class="searchBtn"
                onclick="memberManagement(searchDivision.value, searchKeyword.value);"
              />
            </div>
          </form>
          <table id="usercenter" class="userTable">
            <thead id="user_head">
              <tr>
                <th id="user_th">USERCODE</th>
                <th id="user_th">ID</th>
                <th id="user_th">이름</th>
                <th id="user_th">비밀번호</th>
                <th id="user_th">닉네임</th>
                <th id="user_th">주소</th>
                <th id="user_th">성별</th>
                <th id="user_th">이메일</th>
                <th id="user_th">생년월일</th>
                <th id="user_th">휴대폰번호</th>
                <th id="user_th"></th>
              </tr>
            </thead>
            <tbody id="membership_tbody"></tbody>
          </table>
        </div>
        <div id="QandA_div">
          <form class="searchForm">
            <div class="searchDiv">
              <div class="search-Division">
                <select name="searchDivision" class="searchNum">
                  <option value="1" selected>문의코드</option>
                  <option value="2">문의내용</option>
                </select>
              </div>
              <input
                type="text"
                name="searchKeyword"
                class="searchText"
                placeholder="Search.."
              />
              <input
                type="button"
                value="검색"
                name="searchBtn"
                class="searchBtn"
                onclick="questionManagement(searchDivision.value, searchKeyword.value);"
              />
            </div>
          </form>
          <table id="QnAcenter" class="QnATable">
            <thead id="QnA_head">
              <tr>
                <th>No</th>
                <th>문의코드</th>
                <th>문의제목</th>
                <th>문의내용</th>
                <th>문의날짜</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="QnA_tbody"></tbody>
          </table>
        </div>

        <div id="notice_div">
          <table id="noticecenter" class="noticeTable">
            <thead id="notice_head">
              <tr>
                <th>No</th>
                <th>공지코드</th>
                <th>공지제목</th>
                <th>공지내용</th>
                <th>공지날짜</th>
                <th>
                  <a href="noticeInsert.do"
                    ><img
                      id="insertImg"
                      src="resources/image/insert.png"
                      alt="추가"
                  /></a>
                </th>
              </tr>
            </thead>
            <tbody id="notice_tbody"></tbody>
          </table>
        </div>

        <div id="footer_div">
          <footer class="footer">
            <%-- <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include> --%>
          </footer>
        </div>
    </div>
  </body>
  <script
    type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"
  ></script>
  <script
    type="text/javascript"
    src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"
  ></script>
  <script
    type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"
  ></script>
  <script src="resources/adminJs/adminPageJs.js"></script>
  <script>
    function openMenu() {
      document.getElementById("main").style.marginLeft = "250px";
      document.querySelector(".sidebar").style.width = "250px";
      document.querySelector(".open-sidebar").style.display = "none";
    }

    function closeMenu() {
      document.getElementById("main").style.marginLeft = "0";
      document.querySelector(".sidebar").style.width = "0";
      document.querySelector(".open-sidebar").style.display = "block";
    }

    (function ($) {
      $(".cate .detail-menu").hide();
      $(".cate .cate-menu .subopen").click(function () {
        if ($(this).hasClass("active")) {
          $(this).parent().next().slideUp("fast");
          $(this).removeClass("active");
        } else {
          $(".accordion").find(".active").parent().next().slideUp("fast");
          $(".accordion").find(".active").removeClass("active");
          $(this).parent().next().slideDown("fast");
          $(this).addClass("active");
        }
      });
    })(jQuery);
  </script>
</html>
