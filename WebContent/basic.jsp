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
<style>
    ul,li{list-style:none;}
    .slide{height:300px;overflow:hidden;}
    .slide ul{width:calc(100% * 3);display:flex;animation:slide 12s infinite;} /* slide를 12초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 3);height:300px;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
  </style>
</head>
<body class="body">
<div style="height: 15px;">
</div>
<div class="top_div">
<input type="button" class="top_div_logo" onclick="location.href='main.do'">
<input type="button" value="위시리스트" class="top_div_button"></input>
<input type="button" value="장바구니" class="top_div_button"></input>
<input type="button" value="주문/배송" class="top_div_button"></input>
<input type="button" value="마이페이지" class="top_div_button"></input>
<input type="button" value="로그인" class="top_div_button"></input>
</div>
<hr class="main_hr" style="margin-bottom: 8px; margin-top: 8px;">
<div class="menu_div">
<div class="menu_div_in_div">
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="ABOUT US"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="SHOPPING"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="BOARD"></div>
</div>
</div>
<hr class="main_hr" style="margin-bottom: 0px; margin-top: 8px;">

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