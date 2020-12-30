<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YCSS.css?ver=1">
</head>
<body class="body">

<div style="height: 100px;">
<input type="button" class="main_logo" onclick="location.href='main.do'">
<c:choose>
<c:when test="${seesion_login_num eq '3' }">
<input type="button" value="위시리스트" class="top"></input>
<input type="button" value="장바구니" class="top"></input>
<input type="button" value="주문/배송" class="top"></input>
<input type="button" value="마이페이지" class="top"></input>
<input type="button" value="로그아웃" class="top" onclick="location.href='logoutAction.do'"></input>
<c:forEach var="shoppingUser" items="${session_shoppingUser_semail }">
<input type="button" value="${shoppingUser.sname }" class="top"></input>
</c:forEach>
</c:when>
<c:otherwise>
<input type="button" value="위시리스트" class="top"></input>
<input type="button" value="장바구니" class="top"></input>
<input type="button" value="주문/배송" class="top"></input>
<input type="button" value="마이페이지" class="top"></input>
<input type="button" value="로그인/회원가입" class="top" onclick="location.href='loginForm.do?'"></input>
</c:otherwise>
</c:choose>
<hr class="top_hr">
</div>
<div style="height: 25px;">
<input type="submit" class="menu" value="ABOUT US">
<input type="submit" class="menu" value="SHOPPING">
<input type="submit" class="menu" value="BOARD">
</div>
<hr>

</body>
</html>