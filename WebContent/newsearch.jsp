<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 네이버 차트  -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="js/billboard.js"></script>
<link rel="stylesheet" href="css/billboard.css">
<!--  -->
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!--  -->
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS2.css?ver=1">
</head>
<body class="body">
<div class="top_div">
<input type="button" class="top_div_logo" onclick="location.href='newmain.do'">
<input type="button" value="위시리스트" class="top_div_button"></input>
<input type="button" value="장바구니" class="top_div_button"></input>
<input type="button" value="주문/배송" class="top_div_button"></input>
<input type="button" value="마이페이지" class="top_div_button"></input>
<input type="button" value="로그인" class="top_div_button"></input>
</div>
<div>
<hr class="main_hr">
</div>
<div class="menu_div">
<div class="menu_div_in_div">
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="ABOUT US"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="SHOPPING"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="BOARD"></div>
</div>
</div>
<hr class="main_hr" style="margin-bottom: 0px; border-bottom: 0px;">
<div class="search_box">
<div class="search_box_in_div">
<div class="search_box_in_div_ment">
무엇을 찾으시나요? (상품코드, 상품명, 초성 등)
</div>
<div style="height: 20px;">
</div>
<div style="height: 42px;">
<form action="newsearch.do">
<input type="button" class="search_box_in_div_text_side" disabled="disabled">
<input type="text" value="${search_text }" name="search_text" class="search_box_in_div_text_main">
<input type="submit" class="search_box_in_div_button" value="">
</form>
</div>
</div>
</div>
<div style="height: 50px;">
</div>

<div class="search_div" style="margin-bottom: 25px;">
<div style="float: left;">
검색결과 : ${page_full_num } 개
</div>
<div style="float: right;">
<script type="text/javascript">
function sub() {
	document.frm.submit();
}
</script>
<form name="frm" action="newsearch.do">
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

<hr class="main_hr">

<div class="search_div">
<div>
<table>
	<tr>
<c:forEach var="al" items="${al }" begin="${select_page + (16*select_page) }" end="${select_page + 3 + (16*select_page) }">
		<td><input type="button" style="width: 155px; height: 155px; margin-left: 32px; margin-right: 32px;" > <br> ${al.pname } <br> <fmt:formatNumber value="${al.pprice }" pattern="#,###" /> 원 <p> </td>
</c:forEach>
	</tr>
	<tr>
<c:forEach var="al" items="${al }" begin="${select_page + 4 + (16*select_page) }" end="${select_page + 7 + (16*select_page) }">
		<td><input type="button" style="width: 155px; height: 155px; margin-left: 32px; margin-right: 32px;" > <br> ${al.pname } <br> <fmt:formatNumber value="${al.pprice }" pattern="#,###" /> 원 <p> </td>
</c:forEach>
	</tr>
	<tr>
<c:forEach var="al" items="${al }" begin="${select_page + 8 + (16*select_page) }" end="${select_page + 11 + (16*select_page) }">
		<td><input type="button" style="width: 155px; height: 155px; margin-left: 32px; margin-right: 32px;" > <br> ${al.pname } <br> <fmt:formatNumber value="${al.pprice }" pattern="#,###" /> 원 <p> </td>
</c:forEach>
	</tr>
	<tr>
<c:forEach var="al" items="${al }" begin="${select_page + 12 + (16*select_page) }" end="${select_page + 15 + (16*select_page)  }">
		<td><input type="button" style="width: 155px; height: 155px; margin-left: 32px; margin-right: 32px;" > <br> ${al.pname } <br> <fmt:formatNumber value="${al.pprice }" pattern="#,###" /> 원 <p> </td>
</c:forEach>
	</tr>
</table>
</div>
<c:forEach var="page" begin="1" end="${page_num }">
<input type="button" value="${page }" onclick="location.href='newsearch.do?page=${page}&search_text=${search_text }'">
</c:forEach>
</div>
<div class="foot_1">
</div>
<div class="foot_2">
<div class="foot_3">
<div style="float: left;">
<input class="foot_button" type="button" value="이용약관">
<input class="foot_button" type="button" value="개인정보처리방침">
<input class="foot_button" type="button" value="입점문의">
</div>
<div style="float: right;" >
대표 : 임주혜 / 사업자등록번호 : 123-45-67899
</div>
</div>
</div>
</body>
</html>