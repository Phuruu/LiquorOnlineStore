<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<style>
	.b {
		text-align : right;
	}
</style>
</head>
<body>
	<div>
		<h1>- 관리자 페이지 -</h1>
	</div>
	<hr>
	<div class="b">
		<a href="loginPage.do" class="a">홈페이지</a>/
		<a class="a">관리자님, 어서오세요</a>/
		<a href="#" class="a">로그아웃</a>
	</div>
	
	<table>
		<tr>
			<th><a href="javascript:orderHistory();">주문내역관리</a></th>
			<th><a href="javascript:salesManagement();">매출정보</a></th>
			<th><a href="javascript:storeManagement();">매장관리</a></th>
			<th><a href="javascript:memberManagement();">회원관리</a></th>
			<th><a href="javascript:">?</a></th>
			<th><a href="javascript:">?</a></th>
		</tr>
		
	</table>
</body>
<script>
	function orderHistory() {
		$.ajax({
			type : "post",
			url : "userIdChack.do",
			data : data,
			success : function(result){
				alert(result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");				
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
				}
			}
			
		});
	}
	function salesManagement() {
		
	}
	function storeManagement() {
		
	}
	function memberManagement() {
		
	}
	
	
</script>
</html>