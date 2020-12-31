<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Byerus</title>
<link rel="stylesheet" type="text/css" href="css/ShoppingMainCss.css?ver=1">
</head>
<body>
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
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="ABOUT US"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="SHOPPING" onclick="location.href='shoppingMain.do'"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="BOARD" onclick="location.href='board.do'"></div>
</div>
</div>
	<hr class="main_hr" style="margin-bottom: 0px; margin-top: 8px; border-bottom: 0px;">
	<div class="down">

		<div class="catemenu">
			<div class="catesmallmenu">
				<br /> <input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 20px;"
					value="전체상품(100)"></input> <br /> <input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 16px;"
					value="체온측정(25)"></input> <br /> <input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 16px;"
					value="손소독(15)"></input> <br /> <input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 16px;"
					value="알콜스왑(8)"></input> <br /> <input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 16px;"
					value="마스크/방독면(25)"></input> <br /> <input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 16px;"
					value="장갑/방호복/고글(27)"></input> <br />
			</div>
			<div class="catespecialmenu">
				<input type="button"
					style="width: 170px; background-color: white; border: 0px; font-size: 26px; color: #00EBFF;"
					value="ON SALE"></input>
			</div>
		</div>
		<div class="product">
			<div class="best3text">Bye-rus 인기 상품</div>
			<div class="bestimages">
				<table class="besttable">
					<tr height="50px">
						<th>Top 1</th>
						<th>Top 2</th>
						<th>Top 3</th>
					</tr>

					<tr height="165px">
						<td><img src="./img/sodok.png" width="150" height="150"></img></td>
						<td><img src="./img/sodok.png" width="150" height="150"></img></td>
						<td><img src="./img/sodok.png" width="150" height="150"></img></td>
					</tr>
					<tr height="20px">
						<c:forEach var="best3" items="${BESTPRODUCTS }">
							<td>${best3.pname }</td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="best3" items="${BESTPRODUCTS }">
							<td><fmt:formatNumber type="number" pattern="#,###"
									value="${best3.pprice - (best3.pdiscount / 100 * best3.pprice) }" />
							</td>
						</c:forEach>
					</tr>
				</table>

			</div>
			<hr>
			<div class="productdisplaygroup">
				<div class="dropdown">
					<form action="" name="displayform">
						<select name="display">
							<option value="popular">인기상품순</option>
							<option value="new">최신순</option>
							<option value="hot">판매많은순</option>
							<option value="nohot">판매적은순</option>
						</select>
					</form>
				</div>
				<div>
					<c:forEach var="dproduct" items="${BESTPRODUCTS }">
						<table class="displaytable">
							<tr height="120px">
								<td><img src="./img/sodok.png" width="120" height="120"></img></td>
							</tr>
							<tr height="15px">
								<td>${dproduct.pname}</td>
							</tr>
							<tr>
								<td>${dproduct.pprice}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>
			<div class="pages">[1] 쪽번호 표시 부분</div>
		</div>
	</div>
	<div>
		<div class="footer">
			<h6>BYE-RUS</h6>
		</div>
	</div>
</body>
</html>