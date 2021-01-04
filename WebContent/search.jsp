<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!-- CSS 파일 -->
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<!--  -->
<meta charset="UTF-8">
<!--  -->
<title>Insert title here</title>
</head>
<body>
<div class="main">
<div style="margin-top: 15px;">
<a href="main.do"><img src="./img/Logo.png"></a>

<c:choose>
<c:when test="${session_stype eq '1'}">
<a class="top_button">위시리스트</a>
<a href="cart.do" class="top_button">장바구니</a>
<a class="top_button">주문/배송</a>
<a class="top_button">마이페이지</a>
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
<div class="nav_button"><a>ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">
<div class="main">
<div class="search_box1">
<div class="search_box2">
무엇을 찾으시나요? (상품코드, 상품명, 초성 등)
</div>
</div>
<div class="search_box1">
<div class="search_box2">
<form action="search.do">
<img class="search_side" src="./img/S_side.png">
<input name="search_text" type="text" class="search_text">
<input type="submit" class="seacrh_button" value="">
</form>
</div>
</div>
</div>

<div class="main" style="margin-top: 50px;">
검색결과 : ${page_full_num } 개
<div style="float: right;">
<script type="text/javascript">
function sub() {
	document.frm.submit();
}
</script>
<form name="frm" action="search.do">
<select name="shopping_select" onchange="sub()">
    <option selected="selected">정렬기준</option>
    <option value="sell_hit" ${selected1}>인기상품순</option>
    <option value="pregdate" ${selected2}>최신순</option>
    <option value="price_high" ${selected3}>높은가격순</option>
    <option value="price_low" ${selected4}>낮은가격순</option>
</select>
<input type="hidden" name="search_text" value="${search_text }">
</form>
</div>
</div>
<hr>
<div class="main" style="text-align: center;">
	<table style="text-align: center;">
		<tr>
			<c:forEach var="main_img" items="${main_img }" begin="${(16*select_page) }" end="${3 + (16*select_page) }">
			<td><a href="productDetail.do?pid=${main_img.pid }"><img src="${main_img.pthumbimg}" class="search_img"> <br> ${main_img.pname } <br> <fmt:formatNumber value="${main_img.pprice }" pattern="#,###" /> 원 <p> </a> </td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="main_img" items="${main_img }" begin="${4 + (16*select_page) }" end="${7 + (16*select_page) }">
			<td><a href="productDetail.do?pid=${main_img.pid }"><img src="${main_img.pthumbimg}" class="search_img"> <br> ${main_img.pname } <br> <fmt:formatNumber value="${main_img.pprice }" pattern="#,###" /> 원 <p> </a> </td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="main_img" items="${main_img }" begin="${8 + (16*select_page) }" end="${11 + (16*select_page) }">
			<td><a href="productDetail.do?pid=${main_img.pid }"><img src="${main_img.pthumbimg}" class="search_img"> <br> ${main_img.pname } <br> <fmt:formatNumber value="${main_img.pprice }" pattern="#,###" /> 원 <p> </a> </td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="main_img" items="${main_img }" begin="${12 + (16*select_page) }" end="${15 + (16*select_page)  }">
			<td><a href="productDetail.do?pid=${main_img.pid }"><img src="${main_img.pthumbimg}" class="search_img"> <br> ${main_img.pname } <br> <fmt:formatNumber value="${main_img.pprice }" pattern="#,###" /> 원 <p> </a> </td>
			</c:forEach>
		</tr>
	</table>
	<c:forEach var="page" begin="1" end="${page_num }">
		<a href="search.do?page=${page}&search_text=${search_text }&shopping_select=${shopping_select }">${page }</a>
	</c:forEach>
</div>
	

</body>
</html>