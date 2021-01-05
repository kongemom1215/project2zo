<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Byerus</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<link rel="stylesheet" href="./css/ProductDetailCss.css?ver=2">
</head>
<body onload="init();">
<script type="text/javascript">
		function addComma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			return num.toString().replace(regexp, ',');
		}

		var sell_price;
		var howmany;

		function init() {
			sell_price = document.form.sell_price.value;
			howmany = document.form.howmany.value;
			document.form.sum.value = addComma(Math.round(sell_price));
			change();
		}

		function add() {
			hm = document.form.howmany;
			sum = document.form.sum;
			hm.value++;

			sum.value = addComma(Math.round(parseInt(hm.value) * sell_price));
		}

		function del() {
			hm = document.form.howmany;
			sum = document.form.sum;
			if (hm.value > 1) {
				hm.value--;
				sum.value = addComma(Math
						.round(parseInt(hm.value) * sell_price));
			}
		}

		function change() {
			hm = document.form.howmany;
			sum = addComma(Math.round(document.form.sum));

			if (hm.value < 0) {
				hm.value = 0;
			}

			addComma(Math.round(parseInt(hm.value) * sell_price));
		}
	</script>
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
			<div class="nav_button">
				<a href="aboutUs.do">ABOUT US</a>
			</div>
			<div class="nav_button">
				<a href="shoppingMain.do">SHOPPING</a>
			</div>
			<div class="nav_button">
				<a href="board.do?type=notice">BOARD</a>
			</div>
		</div>
		</div>
		<hr style="margin-bottom: 10px; border-bottom: 0px;">
		<div class="main">
			<div class="upmenubutton">
				<a href='shoppingMain.do?cate=total'> <input type="button"
					style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
					value="전체상품"></input></a> <a href='shoppingMain.do?cate=cheon'><input
					type="button"
					style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
					value="체온측정"></input></a> <a href='shoppingMain.do?cate=sodok'> <input
					type="button"
					style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
					value="소독 / 손"></input><a> <a href='shoppingMain.do?cate=alco'><input
							type="button"
							style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
							value="소독 / 알콜"></input></a><a href='shoppingMain.do?cate=mask'><input
							type="button"
							style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
							value="마스크"></input></a> <a href='shoppingMain.do?cate=bangdok'><input
							type="button"
							style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
							value="방독면"></input></a> <a href='shoppingMain.do?cate=sejung'><input
							type="button"
							style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
							value="세정제"></input></a> <a href='shoppingMain.do?cate=home'><input
							type="button"
							style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
							value="재택용품"></input></a> <a href='shoppingMain.do?cate=etc'><input
							type="button"
							style="width: 90px; background-color: white; border: 0px; font-size: 16px;"
							value="기타"></input></a>
			</div>
			<!-- upmenubutton 닫음 -->
		</div>
		<!-- upmenu 닫음 -->
		<br> <br> <br> <br>
		<div class="main">
			<div class="productpath">
				<a href='shoppingMain.do?cate=${pobject.ptype }'> HOME > <c:if
						test="${pobject.ptype eq 'cheon'}">체온측정 </c:if> <c:if
						test="${pobject.ptype eq 'sodok'}">소독 / 손 </c:if> <c:if
						test="${pobject.ptype eq 'alco'}">소독 / 알콜 </c:if> <c:if
						test="${pobject.ptype eq 'mask'}">마스크 </c:if> <c:if
						test="${pobject.ptype eq 'bangdok'}">방독면 등 </c:if> <c:if
						test="${pobject.ptype eq 'sejung'}">세정제 </c:if> <c:if
						test="${pobject.ptype eq 'home'}">재택용품 </c:if> <c:if
						test="${pobject.ptype eq 'etc'}">기타 </c:if>
				</a>
				<hr>
				<br />
				<div class="productimage">
					<img src="${pobject.pthumbimg }" width="400" height="400"></img>
				</div>
				<div class="productinfo">
					<br /> <strong>${pobject.pname }</strong> <br /> <br />
					<hr>
					<form name="form">
						<div class="infotablediv">

							<table class="infotable">
								<tr height="30">
									<td width="130">판매가</td>

									<td><fmt:formatNumber type="number" pattern="#,###"
											value="${pobject.pprice }" />원</td>
								</tr>

								<c:if test="${pobject.pdiscount > 0 }">
									<tr height="30">
										<td width="130">할인판매가</td>
										<td><font color="red"> <fmt:formatNumber
													type="number" pattern="#,###"
													value="${pobject.pprice - (pobject.pdiscount / 100 * pobject.pprice) }" />원
												<font color="gray"><font size=2>(${pobject.pdiscount }%
														off)
														</h5></td>
										</font>
									</tr>
								</c:if>
								<tr height="30">
									<td width="130">주문수량</td>
									<td><input type="button" value=" - " onclick="del();">
										<input type=hidden name="sell_price"
										value="${pobject.pprice - (pobject.pdiscount / 100 * pobject.pprice) }">
										<input type="text" name="howmany" value="1" size="3"
										onchange="change();"> <input type="button" value=" + "
										onclick="add();"></td>
								</tr>
								<tr height="30">
									<td width="130">옵션선택</td>
									<td><select name="option" style="width: 100px;"><option
												value="op1">op1</option>
											<option value="op2">op2</option></select></td>
								</tr>
								<tr height="50"></tr>
								<tr height="50">

									<td width="130">예상결제금액</td>
									<td>금액 : <input type="text" name="sum" size="11" readonly>원
									</td>


								</tr>
							</table>
							<input type="hidden" name="pid" value="${pobject.pid }">
						</div>
						<!-- infotablediv close -->
						<!-- 홍주님과 협업 -->
						<div class="purchase">
							<input type="submit" value="바로구매" class="pbuttons"
								formaction="order.do"></input> <input type="submit" value="장바구니"
								class="pbuttons" formaction="cartAdd.do"></input> <input
								type="submit" value="찜" class="pbuttons" formaction="jjim.do"></input>
						</div>
					</form>
					<!-- purchase close -->
				</div>
				<!-- productinfo close -->
				<div class="detailbody">

					<div class="detailupside"></div>
					<br />
					<br />
					<div class="detailimages">
						<img src="${pobject.col1 }" width="690"></img> <img
							src="${pobject.col2 }" width="690"></img> <img
							src="${pobject.col3 }" width="690"></img> <img
							src="${pobject.col4 }" width="690"></img> <img
							src="${pobject.col5 }" width="690"></img>

					</div>
					<div class="reviewboard">
						<br />
						<br /> 후기게시판 <br />
						<br />
					</div>
					<div class="qnaboard">
						<br />
						<br /> 문의게시판 <br />
						<br />
					</div>
					<div class="main" style="height: 50px; background-color: #767171; display: table;">
<div style="width: 10px;">
</div>
<div style="display: table-cell; vertical-align: middle; margin-left: 5px; text-align: left;">
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
					
				</div>
					</div>
					</div>
					
									
				

				

</body>
</html>