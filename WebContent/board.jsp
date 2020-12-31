<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!--  -->
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS2.css?ver=1">
</head>
<body class="body">
<div style="height: 15px;">
</div>
<div class="top_div">
<input type="button" class="top_div_logo" onclick="location.href='main.do'">

<c:choose>
	<c:when test="${seesion_login_num eq '3' }">
		<input type="button" value="위시리스트" class="top_div_button"></input>
		<input type="button" value="장바구니" class="top_div_button"></input>
		<input type="button" value="주문/배송" class="top_div_button"></input>
		<input type="button" value="마이페이지" class="top_div_button"></input>
		<input type="button" value="로그아웃" class="top_div_button" onclick="location.href='logoutAction.do'"></input>
			<c:forEach var="shoppingUser"
				items="${session_shoppingUser_semail }">
			<input type="button" value="${shoppingUser.sname }" class="top"></input>
			</c:forEach>
	</c:when>
	<c:otherwise>
		<input type="button" value="관리자페이지" class="top_div_button" onclick="location.href='adminPage.do'"></input>
		<input type="button" value="위시리스트" class="top_div_button"></input>
		<input type="button" value="장바구니" class="top_div_button"></input>
		<input type="button" value="주문/배송" class="top_div_button"></input>
		<input type="button" value="마이페이지" class="top_div_button"></input>
		<input type="button" value="로그인/회원가입" class="top_div_button" onclick="location.href='loginForm.do'"></input>
	</c:otherwise>
</c:choose>

</div>
<hr class="main_hr" style="margin-bottom: 8px; margin-top: 8px;">
<div class="menu_div">
		<div class="menu_div_in_div">
			<div class="menu_div_in_div_in_div">
				<input type="button" class="menu_div_in_div_button" value="ABOUT US">
			</div>
			<div class="menu_div_in_div_in_div">
				<input type="button" class="menu_div_in_div_button" value="SHOPPING"
					onclick="location.href='shoppingMain.do'">
			</div>
			<div class="menu_div_in_div_in_div">
				<input type="button" class="menu_div_in_div_button" value="BOARD"
					onclick="location.href='board.do'">
			</div>
		</div>
	</div>
</div>
<hr class="main_hr" style="margin-bottom: 0px; margin-top: 8px;">

<div class="board_div">

<div style="height: 15px;"></div>

<div style="width: 900px; height: 690px;">

<table style="border-top: 1px gray solid; border-bottom: 1px gray solid; border-spacing: 5px;">
	<tr>
		<td style="width: 70px; text-align: center;">번호</td>
		<td style="width: 600px;">제목</td>
		<td style="width: 70px;">작성자</td>
		<td style="width: 70px;">작성일</td>
		<td style="width: 70px;">조회수</td>
	</tr>
</table>
<table style="border-top: 2px gray solid; border-bottom: 2px gray solid; border-spacing: 5px; background-color: #CCCCCC;">
	<tr>
		<td style="width: 70px; text-align: center;">공지</td>
		<td style="width: 600px;"><a style="color:black; text-decoration: none;">제목</a></td>
		<td style="width: 70px;">작성자</td>
		<td style="width: 70px;">작성일</td>
		<td style="width: 70px;">조회수</td>
	</tr>
	<tr>
		<td style="width: 70px; text-align: center;">공지</td>
		<td style="width: 600px;"><a>제목</a></td>
		<td style="width: 70px;">작성자</td>
		<td style="width: 70px;">작성일</td>
		<td style="width: 70px;">조회수</td>
	</tr>
	<tr>
		<td style="width: 70px; text-align: center;">공지</td>
		<td style="width: 600px;"><a>제목</a></td>
		<td style="width: 70px;">작성자</td>
		<td style="width: 70px;">작성일</td>
		<td style="width: 70px;">조회수</td>
	</tr>
</table>
<table style="border-top: 1px gray solid; border-bottom: 1px gray solid; border-spacing: 5px;">
	<tr>
		<td style="width: 70px; text-align: center; ">1</td>
		<td style="width: 600px;"><a>test1</a></td>
		<td style="width: 70px;">test1</td>
		<td style="width: 70px;">test1</td>
		<td style="width: 70px;">test1</td>
	</tr>
	<tr>
		<td style="width: 70px; text-align: center;">1</td>
		<td style="width: 600px;"><a>test1</a></td>
		<td style="width: 70px;">test1</td>
		<td style="width: 70px;">test1</td>
		<td style="width: 70px;">test1</td>
	</tr>
</table>

</div>
</div>
</body>
</html>