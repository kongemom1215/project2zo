<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<style type="text/css">
	.mypagehead{
		width: 900px;
		margin-left: 350px;
		position: relative;
		float: left;
		background-color:white;
		
	}
	.mypagepersonicon{
		width: 180px;
		float: left;
		margin-left: 25px;
		margin-top: 10px;
	}
	<!-- 쿠폰/이름 출력	-->
	.mypageinfo{
		width:690px;
		float: right;
		margin-left: 10px;
	}
	.mypagecoupon{
		width:350px;
		float: right;
		margin-left: 10px;
		margin-top: 85px;
	}
	.mypagename{
		width:290px;
		float: right;
		margin-left: 10px;
		margin-top: 85px;
	}
	.down {
		width: 900px;
		margin-left: 350px;
		position: relative;
		float: left;
		background-color:white;
	}
	.mypagemainside {
	float: left;
	width: 10%;
	margin-left: 10px;
	width: 180px;
	height: 40%;
	
	font-size: 18px;
	font-color: black;
	margin-left: 10px;
	background-color: #B9FFFF;
}

	.mypageside {
		margin-left: 10px;
		float: left;
		height: 30%;
		width: 160px;
	
	}
	.myorderview {
	float: right;
	margin-left: 10px;
	width: 690px;
	height: 365px;
	}
	.myorderviewdetail {
	float: right;
	margin-left: 10px;
	width: 690px;
	height: 365px;
	}
	.myorderviewdetail_price {
	float: right;
	margin-left: 10px;
	width: 100px;
	height: 365px;
	}
	
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
<hr>
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button"><a>ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">

	<div class="main">
		<input type="button" value="마이페이지" style="margin-top: 30px; font-weight:bold; font-size: 30px; color: #00EBFF; background-color: white; width: 170px; border: 0; outline: 0;" onclick="location.href='mypage.do'">
	<hr>
	<!-- 회원아이콘 출력-->
	<div class="mypagepersonicon">
		<img src="./img/personicon.PNG" width="140px"/>
	</div>
	<!-- 쿠폰/이름 출력-->
	<div class="mypageinfo">
		<div class="mypagecoupon">
		<a href="mypageCoupon.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span>사용가능 쿠폰 : </span>
		<span style=" color:blue; font-weight:bold;"></span>
		<span >장</span>
		</a>
		</div>
		<div class="mypagename">
		<span style="color:black; font-weight:bold;">   ${shoppinguser.sname }</span>
		<span>${session_sname } 님</span> <p>
		</div>
	</div>
	</div>
	
<div class="main">


<div class="mypagemainside">
	<div class="mypageside">
		<br>
		<a href="mypageOrder.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span>주문조회</span>
		<span style="float:right;">></span>
		</a><p>
		<a href="mypageCoupon.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span>쿠폰</span>
		<span style="float:right;">></span>
		</a><p>
		<a href="mypageWrite.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span>리뷰/문의</span>
		<span style="float:right;">></span>
		</a><p>
		<a href="mypageEditForm.do?sid=${2 }" style="text-decoration: none; color: black;">
		<span>회원정보수정</span>
		<span style="float:right;">></span>
		</a><p>
		<a href="mypageDeleteForm.do?sid=${2 }" style="text-decoration: none; color: black;">
		<span>회원탈퇴</span>
		<span style="float:right;">></span>
		</a><p>
	</div>
	</div>
	<div class="myorderview">
		<h3>주문내역</h3>
	<div class="myorderviewdetail">
		<a href="mypageOrder.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span ></span>	
		<span style="float:right; color:blue; fon-weight:bold;"></span>
		<span style="float:right;">주문번호 : </span>
		</a>
		<hr>
		
		<table>
		</table>
	</div>
	
<!-- <c:forEach var="order_tb" items=""> -->	
		
<!-- 	</c:forEach>	-->		
	</div>
</div>
<table>
</table>
</body>
</html>