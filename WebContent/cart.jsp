<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/cartnbuy.css?ver=2"> 
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#chkAll').click(function(){
			if($("#chkAll").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		});
/* 		$(document).ready(function(){
		$('#checkdel').click(function(){
			if(confirm("삭제하시겠습니까??")){
				$("input[name=chekRow]:checked").each(function(){
					var tr_value=$(this).val();
					var tr=$("tr[value='"+tr_value+"']");
					tr.remove();
					});
				}else{
					return false;
				}
			});
	});	
 */	
 function cart_del(){
		var input_cart = document.getElementsByName("chekRow");
		var checked = false;
		var indexid = false;
		for(var i=0;i<input_cart.length;i++){
			if(input_cart[i].checked){
				cartp=input_cart[i].value;
				alert(cartp);
				
			}
		}
	
</script>
<style type="text/css">
.cart_td{
		text-align: center;
	
	
	}

</style>

</head>
<body>

<header>
<div class="main">
<div style="margin-top: 15px;">
<a href="main.do"><img src="./img/Logo.png"></a>

<c:choose>
<c:when test="${session_stype eq '1'}">
<a class="top_button">위시리스트</a>
<a href="cart.do" class="top_button">장바구니</a>
<a class="top_button">주문/배송</a>
<a href="mypage.do" class="top_button">마이페이지</a>
<a href="main.do?logout=logout" class="top_button">로그아웃</a>
<a class="top_button">${session_sname } 님</a>
</c:when>
<c:when test="${session_stype eq '0'}">
<a href="main.do?logout=logout" class="top_button">로그아웃</a>
<a class="top_button">${session_sname } 님</a>
<a href="adminPage.do" class="top_button">관리페이지</a>
</c:when>
<c:otherwise>
<a class="top_button">위시리스트</a>
<a class="top_button">장바구니</a>
<a class="top_button">주문/배송</a>
<a class="top_button">마이페이지</a>
<a href="login.do" class="top_button">로그인/회원가입</a>
</c:otherwise>
</c:choose>
</div>
</div>
<hr>
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button"><a href="aboutUs.do">ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">

</header>
<div class="main">
	<div class="aa" style="z-index: 2">
		<span class="step1" style=" z-index: 1"><h2>장바구니</h2></span>
		<span class="step2" style=" z-index: 1; color : #848484;"><h2>주문결제</h2></span>
		<span class="step3" style="z-index: 1; color : #848484;"><h2>결제완료</h2></span>
	</div>
	<div class="bb" style="z-index: 2">
	<div style="margin-top: 20px; height: 20px;"></div>
		<h2>${useremail }님의 장바구니</h2>
		<h2><input type="hidden" value="${sid}"></h2>
		<form name="cartForm">
		<table class="cart_tb" id="cartList"  >
		<thead>
		<tr class="cart_tr" >
			<th class="cart_td"><input type="checkbox"  name="chkAll" id="chkAll" ></th>
			<th class="cart_td" >상품코드</th>
			<th class="cart_td">상품명</th>
			<th class="cart_td">판매가격</th>
			<th class="cart_td">수량</th>
			<th class="cart_td">주문금액</th>
		
		</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${list == null }">
					<tr class="cart_tr">
						<td colspan="6" style="text-align: center;"><h4>장바구니에 담기 상품이 없습니다</h4></td>
					</tr>
				</c:when>
				
				<c:otherwise>
				<c:if test=""></c:if>
				<c:forEach var="arr" items="${list }">
 				<tr value="${list}" class="cart_tr" >
					<td class=cart_td><input type="checkbox" name="chekRow" value="${arr.cwid}"></td>
					<td class="cart_td"><h4>${arr.pid}</h4></td>
					<td class="cart_td"><h4>${arr.pname}</h4></td>
					<td class="cart_td"><h4>${arr.pprice}</h4></td>
					<td class="cart_td"><h4>${arr.cwqty}</h4></td>
					<td class="cart_td"><h4></h4>${arr.pprice*arr.cwqty}</td>
					<input type="hidden" name="cwid" value="${arr.cwid }">
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
		</table>
		
		</form>
	 		
		
		
		
	<br>	
	</div>
	<div class="cc">
		<div class="result" >
<!-- 총 상품 금액 계산 + 배송비 계산  -->
		<div style="height: 60px;"></div>
		총<span>${count }</span>개 
 		상품 총 금액
 		<b>
 			<c:set var="sum" value="0"/>
			<c:forEach var="arr" items="${list }">
				<c:set var="sum" value="${sum+arr.pprice*arr.cwqty}"></c:set>
			</c:forEach>	
			<fmt:formatNumber value="${sum }" pattern="#,###"></fmt:formatNumber>
		</b>원 
		+
		
		배송비<b>
			<c:if test="${sum >=30000 }">
			0
			</c:if>
		
		<c:if test="${sum < 30000 }">
		3000
		</c:if>
		</b>원
		=
		총 결제 금액<b>
		<c:if test="${sum >=30000 }">
		<fmt:formatNumber value="${sum}" pattern="#,###"></fmt:formatNumber>
		
		</c:if>
		
		<c:if test="${sum < 30000 }">
		<fmt:formatNumber value="${sum+3000}" pattern="#,###"></fmt:formatNumber>
		
		</c:if>
		</b>원 
		
	
	
		</span>
		</div>
	</div>
	
	<div class="main">
	<span><input type="button" value="전체삭제 "onclick="location.href='cartDelete.do'" class="del" id="wholedel"></span>
		<span><input type="button" value="선택삭제 "onclick="" class="del" id="checkdel"></span>
		<span><input type="submit" value="전체주문 "onclick="location.href='order.do?sum=${sum}'" class="buy" id="wholebuy"></span>
		<span><input type="submit" value="선택주문 "onclick="" class="buy" id="checkbuy"></span>
	</div>

</div>

<div style="height: 340px;">
</div>
<div class="main" style="height: 50px; background-color: #767171; display: table;">
<div style="width: 10px;">
</div>
<div style="display: table-cell; vertical-align: middle; margin-left: 5px;">
대표 : 임주혜 / 사업자등록번호 : 123-45-67899
</div>
<div style="display: table-cell; vertical-align: middle; text-align: right;">
<a>이용약관</a> /
<a>개인정보처리방침</a> /
<a>입점문의</a>
</div>
<div style="width: 10px;">
</div>
</div>
</body>
</html>