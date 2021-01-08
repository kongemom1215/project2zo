<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<style type="text/css">
h1{font-weight: 900;}
	#find{text-align: center; width: 300px; overflow: hidden; position: absolute; right: 50%; top: 30%;}
</style>
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
<hr style="width: 900px; border-bottom: 0xp;">
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button"><a href="aboutUs.do">ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>
<hr style="width: 900px; margin-bottom: 0px; border-bottom: 0px;">

<div id="find">
<h1>계정찾기</h1>
<c:if test="${not empty result }">
	찾으시는 계정은 ${result }입니다. <p>
	<a href="login.do">로그인하러가기</a>
</c:if>
<c:if test="${empty result }">
<script type="text/javascript">
alert("잘못입력했습니다");
history.go(-1);
</script>
</c:if>
</div>
</body>
</html>