<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="resources/js/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
	.formDiv{
		margin: 80px auto;
	}
	table, th, td{
		text-align: center;
		border: 2px solid #909090;
		border-collapse : collapse;
		border-radius: 3px;
	}
	#order {
		width: 200px;
		height: 30px;
		border: 2px solid #6D3114;
		background-color: rgba(0, 0, 0, 0);
		color: #6D3114;
		padding: 3px;
		border-radius: 8px;
	}
	#order:hover {
		background-color: #6D3114;
		color: white;
	}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

</script>
<body>
<div class="formDiv" align="center">
		<h1 style="color: #6D3114;">Order/Payment</h1><br>
		<hr width="700px"><br>
		<form>
			<h3> 배송 정보 </h3>
			<table>
				<tr height="30px">
					<td width="100px">이름/연락처</td>
					<td width="400px">홍길동/010-1234-5678</td>
				</tr>
				<tr height="30px">
					<td>주소</td>
					<td>서울시 강남구</td>
				</tr>
			</table><br><br>
			<h3> 상품 정보 </h3>
			<table>
				<tr height="30px">
					<th width="350px">상품 정보</th>
					<th width="50px">수량</th>
					<th width="50px">배송비</th>
					<th width="60px">주문금액</th>
				</tr>
				<tr height="30px">
					<td>전통주 이름</td>
					<td>1개</td>
					<td>3000원</td>
					<td>33000원</td>
				</tr>
				<tr>
			</table>
			<p style="font-size: 12px;">· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>
			   · 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</p><br><br>
			<h3> 쿠폰/할인 </h3>
			<table>
				<tr height="30px">
					<td>상품 금액</td>
					<td>33000원</td>
				</tr>
				<tr height="30px">
					<td width="100px"><label for="coupon">쿠폰 할인</label></td>
					<td width="100px"><select id="coupon">
							<option value="">쿠폰 선택</option>
							<option value="coupon1">배송비 무료</option>
							<option value="coupon2">할인 쿠폰</option>
						</select>
					</td>
				</tr>
				<tr>
			</table><br><br>
			<h3> 결제 정보 </h3>
			<table>
				<tr height="30px">
					<td width="100px">결제 수단</td>
					<td width="300px">
						<label>카카오페이<input type="radio" name="payment" value="kakaopay"></label>&nbsp;&nbsp;&nbsp;
						<label>무통장입금<input type="radio" name="payment" value="cash"></label>
					</td>
				</tr>
			</table>
			<p style="font-size: 12px;">· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</p><br><br>
			<table>
				<tr height="30px">
					<td width="150px">품절 시 환불 안내</td>
					<td width="500px" height="150px">
						<p style="font-weight: bold;">결제하신 수단으로 취소됩니다.</p>
						<p style="font-size: 12px;">· 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.<br>
						   · 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.<br>
						   · 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</p>
					</td>
				</tr>
				<tr height="30px">
					<td>주문자 동의</td>
					<td height="90px">
						<input type="checkbox"><font style="font-size: 12px;">[필수] 개인정보 수집 및 이용 동의</font><br>
						<input type="checkbox"><font style="font-size: 12px;">[필수] 개인정보 제 3자 제공 동의</font><br>
						<input type="checkbox"><font style="font-size: 12px;">[필수] 전자결제대행 이용 동의</font>
					</td>
				</tr>
			</table><br><br>
			<br>
			<!-- <font size="5px">총 30000원</font>&nbsp; -->
			<input type="submit" id="order" name="order" value="30000원 주문하기">
		</form>
	</div>
</body>
</html>
<%@include file ="resources/js/footer.jsp" %>