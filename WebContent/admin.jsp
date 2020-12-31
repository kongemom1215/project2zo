<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS2.css?ver=1">
<style type="text/css">
#admin {
	top: 50%;
	left: 50%;
}

.member_button {
	position: relative;
	border: 0;
	outline: 0;
	height: 215px;
	width: 216px;
	top: 100px;
	background-image: url('./img/admin_member.JPG');
	background-size: 216px;
}

.product_button {
	position: relative;
	border: 0;
	outline: 0;
	height: 217px;
	width: 216px;
	top: 100px;
	background-image: url('./img/admin_product.JPG');
	background-size: 216px;
	left: 70px;
}

.board_button {
	position: relative;
	border: 0;
	outline: 0;
	height: 218px;
	width: 219px;
	top: 100px;
	background-image: url('./img/admin_board.JPG');
	background-size: 219px;
	left: 140px;
}

.order_button {
	position: relative;
	border: 0;
	outline: 0;
	height: 218px;
	width: 220px;
	top: 100px;
	background-image: url('./img/admin_order.JPG');
	background-size: 220px;
	left: 210px;
}

.admin_button[type="button"] {
	vertical-align: middle;
	border: 0;
	outline: 0;
	float: left;
	background-color: white;
	margin-right: 215px;
}

.admin_div {
	float: left;
	width: 1200px;
	height: 500px;
	display: inline;
	vertical-align: middle;
	position: relative;
	margin-left: calc(7%);
	top: 50px;
}

@media screen and (max-width:1100px) {

.admin_div {
	float: left;
	width: 1200px;
	height: 500px;
	display: inline;
	vertical-align: middle;
	position: relative;
	margin-left: calc(11%);
	top: 50px;
}

}

@media screen and (min-width:1300px) {

.admin_div {
	float: left;
	width: 1200px;
	height: 500px;
	display: inline;
	vertical-align: middle;
	position: relative;
	margin-left: calc(20%);
	top: 50px;
}

}


</style>
</head>
<body>
	<div style="height: 15px;"></div>
	<!--로고 및 로그인 메뉴  -->
	<div class="top_div">
		<input type="button" class="top_div_logo"
			onclick="location.href='main.do'"> <input type="button"
			value="관리자페이지" class="top_div_button"
			onclick="location.href='adminAction.do'"></input> <input
			type="button" value="로그아웃" class="top_div_button"></input>
	</div>

	<!--관리자메뉴  -->
	<hr class="main_hr" style="margin-bottom: 8px; margin-top: 8px;">
	<div class="menu_div">
		<div class="menu_div_in_div">
			<div class="menu_div_in_div_in_div">
				<input type="button" class="menu_div_in_div_button" value="">
			</div>
			<div class="menu_div_in_div_in_div">
				<input type="button" class="menu_div_in_div_button"
					value="ADMINISTRATOR SERVICE"
					onclick="location.href='adminPage.do'">
			</div>
			<div class="menu_div_in_div_in_div">
				<input type="button" class="menu_div_in_div_button" value="">
			</div>
		</div>
	</div>
	<hr class="main_hr"
		style="margin-bottom: 0px; margin-top: 8px; border-bottom: 0px;">

	<div class="admin_div">
		<div>
			<input type="button" class="member_button"
				onclick="location.href='memberAdminPage.do'"> <input
				type="button" class="product_button"> <input type="button"
				class="board_button"> <input type="button"
				class="order_button">
		</div>
		<div style="position: absolute; display: block; top: 320px;">
			<input type="button" value="회원 관리" class="admin_button"
				style="margin-left: 80px;"
				onclick="location.href='memberAdminPage.do'"> <input
				type="button" value="상품 관리" class="admin_button"> <input
				type="button" value="게시판 관리" class="admin_button"> <input
				type="button" value="결제&배송 관리" class="admin_button"
				style="margin-right: 0px;">
		</div>
	</div>
</body>
</html>