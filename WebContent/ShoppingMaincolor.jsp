<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2차 시도</title>
<style>
.down {
	width: 900px;
	background-color: gray;
	margin-left: 350px;
	position: relative;
	float: left;
}

.catemenu {
	float: left;
	width: 10%;
	margin-top: 30px;
	margin-left: 10px;
	width: 170px;
	height: 1030px;
	background-color: orange;
	text-align: center;
	margin-left: 10px;
}

.catesmallmenu {
	font-size: 30px;
}

.catespecialmenu {
	margin-top: 30px;
}

.product {
	float: left;
	margin-left: 10px;
	width: 690px;
	height: 365px;
	background-color: olive;
}

.best3text {
	width: 690px;
	height: 30px;
	font-size: 23px;
	background-color: #B9FFFF;
	margin-top: 10px;
	text-align: center;
}

.bestimages {
	width: 690px;
	margin-top: 10px;
	height: 310px;
	background-color: white;
	text-align: center;
}

.best1 {
	width: 200px;
	height: 305px;
	margin-left: 20px;
	background-color: green;
	float: left;
	background-color: green;
}

.best2 {
	width: 200px;
	height: 305px;
	margin-left: 25px;
	background-color: green;
	float: left;
}

.best3 {
	width: 200px;
	height: 305px;
	margin-left: 25px;
	background-color: green;
	float: left;
}

.productname {
	margin-top: 5px;
	font-size: 15px;
	color: black;
	font-size: 15px;
}

.productprice {
	font-size: 15px;
	color: red;
}

.productoriginalprice {
	color: gray;
	text-decoration: line-through;
}

.salepercent {
	font-size: 9px;
	color: #00EBFF;
}

.productdisplaygroup {
	margin-top: 20px;
	height: 630px;
	background-color: yellow;
}

.dropdown {
	text-align: right;
	margin-right: 10px;
}

.footer {
	text-align: center;
	background-color: #B9FFFF;
	margin-left: 530px;
	position: relative;
	float: left;
	width: 720px;
	height: 40px;
}

.shoppingproduct {
	width: 150px;
	background-color: white;
	text-align: center;
	margin-top: 10px;
	margin-left: 15px;
	float: left;
}

.pages {
	text-align: center;
	color: #00EBFF;
	
}


</style>
</head>
<body>
	<div style="width: 900px; margin-left: 350px; position: relative;">
		<img src="img/Logo.png"> <input type="button" value="위시리스트"
			class="top"
			style="float: right; background-color: white; border: 0px;"></input>
		<input type="button" value="장바구니" class="top"
			style="float: right; background-color: white; border: 0px;"></input>
		<input type="button" value="주문/배송" class="top"
			style="float: right; background-color: white; border: 0px;"></input>
		<input type="button" value="마이페이지" class="top"
			style="float: right; background-color: white; border: 0px;"></input>
		<input type="button" value="로그아웃" class="top"
			style="float: right; background-color: white; border: 0px;"></input>
	</div>
	<hr>
	<div
		style="width: 900px; height: 10px; display: table-cell; vertical-align: middle; position: relative;">
		<div style="width: 900px; margin-left: 350px;">
			<div style="position: relative; float: left;">
				<input type="button"
					style="width: 300px; background-color: white; border: 0px;"
					value="ABOUT US">
			</div>
			<div style="position: relative; float: left;">
				<input type="button"
					style="width: 300px; background-color: white; border: 0px;"
					value="SHOPPING" onclick="location.href='shoppingmain.do?'">
			</div>
			<div style="position: relative; float: left;">
				<input type="button"
					style="width: 300px; background-color: white; border: 0px;"
					value="BOARD">
			</div>
		</div>
	</div>
	<hr>
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
				<div class="best1">
					<h4>TOP 1</h4>
					<img src="./img/sodok.png" width="150"></img>
					<div class="productname">날려라 바이러스 손독제</div>
					<div class="productprice">3,800원</div>
				</div>
				<div class="best2">
					<h4>TOP 2</h4>
					<img src="./img/sodok.png" width="150"></img>
					<div class="productname">너만 없는 마스크스트랩</div>
					<div class="productoriginalprice">3,000원</div>
					<div class="productprice">2,700원</div>
					<div class="salepercent">(10%)</div>
				</div>
				<div class="best3">
					<h4>TOP 3</h4>
					<img src="./img/sodok.png" width="150"></img>
					<div class="productname">덴탈 마스크 10EA</div>
					<div class="productprice">4,000원</div>
				</div>
			</div>
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
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
					<div class="shoppingproduct">
						<img src="./img/sodok.png" width="100"></img>
						<div class="productname">제품</div>
						<div class="productoriginalprice">4,000원</div>
						<div class="productprice">3,600원</div>
						<div class="salepercent">(10%)</div>
					</div>
				</div>
			</div>
			<div class="pages">
			[1] 쪽번호 표시 부분
			</div>
		</div>
	</div>
	<div>
		<div class="footer">
			<h6>BYE-RUS</h6>
		</div>
	</div>
</body>
</html>