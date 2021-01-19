<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#admin {
	top: 50%;
	left: 50%;
}

.member_button {
	position: relative;
	border: 0;
	outline: 0;
	width: 150px; height: 150px;
	background-image: url('./img/admin_member.JPG');
	background-size: contain;
}

.product_button {
	position: relative;
	border: 0;
	outline: 0;
	width: 150px; height: 150px;
	background-image: url('./img/admin_product.JPG');
	background-size: contain;
}

.board_button {
	position: relative;
	border: 0;
	outline: 0;
	width: 150px; height: 150px;
	background-image: url('./img/admin_board.JPG');
	background-size: contain;
}

.order_button {
	position: relative;
	border: 0;
	outline: 0;
	width: 150px; height: 150px;
	background-image: url('./img/admin_order.JPG');
	background-size: contain;
}
.admin_button[type="button"] {
	vertical-align:center;
	border: 0;
	outline: 0;
	float: left;
	background-color: white;
	width:200px;
}
table{
}
</style>
</head>
<body>
	<!--로고 및 로그인 메뉴  -->
	<div style="width: 900px; margin-left: 350px; position: relative;">
		<img src="img/Logo.png"> 
		<input type="button" value="로그아웃" class="top"	style="float: right; background-color: white; border: 0px;"></input>
		<input type="button" value="관리자페이지" class="top" style="float: right; background-color: white; border: 0px;" onclick="location.href='adminPage.do'"></input>
	</div>
	<hr>
	<!--관리자메뉴  -->
	<div
		style="width: 900px; height: 10px; display: table-cell; vertical-align: middle; position: relative;">
		<div style="width: 900px; margin-left: 350px;">
			<div id="admin" style="position: relative; float: left;">
				<input type="button"
					style="width: 300px; background-color: white; border: 0px;"
					value="ADMINISTRATOR SERVICE"
					onclick="location.href='adminPage.do'">
			</div>
		</div>
	</div>
	<hr>
	<div style="float: left; width: 1200px; height: 500px; display: inline; vertical-align: middle; position: relative; margin-left: 250px; top: 50px;">
		<div>
			<table style="width:60%; height: 100px; margin: auto; text-align: center;" border="0">
				<tr>
					<td><input type="button" class="member_button" onclick="location.href='memberAdminPage.do'"> </td>
					<td><input type="button" class="product_button" onclick="location.href='productAdminPage.do'"> </td>
					<td><input type="button" class="board_button" onclick="location.href='noticeAdminPage.do'"></td>
					<td><input type="button" class="order_button" onclick="location.href='orderAdminPage.jsp'"></td>
				</tr>
				<tr>
					<td><input type="button" value="회원 관리" class="admin_button" onclick="location.href='memberAdminPage.do'"> </td>
					<td><input type="button" value="상품 관리" class="admin_button" onclick="location.href='productAdminPage.do'"></td>
					<td><input type="button" value="게시판 관리" class="admin_button" onclick="location.href='noticeAdminPage.do'"> </td>
					<td><input type="button" value="결제&배송 관리" class="admin_button" onclick="location.href='orderAdminPage.jsp'"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>