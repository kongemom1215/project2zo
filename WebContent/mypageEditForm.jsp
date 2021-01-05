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
	.down {
		width: 900px;
		/* margin-left: 350px; */
		position: relative;
		float: left;
		background-color:white;
	}
	.mypagehead{
		width: 900px;
		/* margin-left: 350px; */
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
	.useredit{
		width: 600px;
		margin-left: 10px;
		position: relative;
		background-color:white;
		float : right;
	}
	.input[type="password"]{
		font-size: 18px;
		margin-top: 10px;
		border: 0;
		outline: 0;
		background-color: #B9FFFF; 
		margin-right: 0.5px;
	}
	.input[type="text"]{
		font-size: 18px;
		margin-top: 10px;
		border: 0;
		outline: 0;
		background-color: #B9FFFF; 
		margin-right: 0.5px;
		margin-left: 2px;
	}
	.input[type="radio"]{
		font-size: 18px;
		border: 0;
		outline: 0;
		background-color: #B9FFFF; 
		margin-right: 5%;
		margin-left: 2px;
	}
	.input[type="submit"]{
		font-size: 18px;
		border:3;
		border-color: #14D3FF;
		outline: 0;
		background-color: white; 
		margin-top: 10px;
		margin-right: 5px;
		margin-left: 2px;
	}
	
	table{	
		width:600px;
	}
	table.txc-table{
		width:100%;
		table-layout:fixed;
	}
	table thead tr{
		width:100%;
	}
	.button {
    width:75px;
    background-color: #14D3FF;
    border: none;
    color:#fff;
    padding: 8px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
	border-radius:10px;
}
	.button:hover {
    background-color: blue;
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
<div class="nav_button"><a href="aboutUs.do">ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">
<div class="main">
	<div class="mypagehead">
		<input type="button" value="마이페이지" style="margin-top: 30px; font-weight:bold; font-size: 30px; color: #00EBFF; background-color: white; width: 170px; border: 0; outline: 0;" onclick="location.href='mypage.do?sid=${2 }'">
	<hr>
	</div>
	<div class="down">
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
		<a href="mypageEditForm.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span>회원정보수정</span>
		<span style="float:right;">></span>
		</a><p>
		<a href="mypageDeleteForm.do?sid=${shoppinguser.sid }" style="text-decoration: none; color: black;">
		<span>회원탈퇴</span>
		<span style="float:right;">></span>
		</a><p>
	</div>
	</div>

<div class="useredit">
<form action="mypageEdit.do" method="post">
	<input type="hidden" name="sid" value="${shoppinguser.sid }">
	<table>
		<caption><h2>회원정보 수정</h2></caption>
		<tr><td style="font-size:15px;">이메일	</td><td>></td><td style="background-color:#B9FFFF;">${shoppinguser.getSemail() }</td></tr>
		<tr><td style="font-size:15px;">비밀번호	</td><td>></td><td style="background-color:#B9FFFF;"><input type="password" name="spwd"  required="required" value="${shoppinguser.spwd }" class="input"></td></tr>
		<tr><td style="font-size:15px;">비밀번호 확인	</td><td>></td><td style="background-color:#B9FFFF;"><input type="password" name="spwd2" required="required" value="${shoppinguser.spwd }" class="input"></td></tr>
		<tr><td style="font-size:15px;">이름	</td><td>></td><td style="background-color:#B9FFFF;"><input type="text" name="sname" required="required" value="${shoppinguser.sname }" class="input"></td></tr>
		<tr><td style="font-size:15px;">우편번호	</td><td>></td><td style="background-color:#B9FFFF;"><input type="text" name="spost" required="required" value="${shoppinguser.spost }" class="input"></td></tr>
		<tr><td style="font-size:15px;">주소	</td><td>></td><td style="background-color:#B9FFFF;"><input type="text" name="saddress" required="required" value="${shoppinguser.saddress }" class="input"></td></tr>
		<tr><td style="font-size:15px;">전화번호	</td><td>></td><td style="background-color:#B9FFFF;"><input type="text" name="scontact" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx" title="2,3자리-3,4자리-4자리"
									value="${shoppinguser.scontact }" class="input"></td></tr>
		<tr><td>마케팅동의</td><td>></td><td style="background-color:#B9FFFF;">y<input type="radio" name="sagree" required="required" value="y" class="input">  
								  n<input type="radio" name="sagree" required="required" value="n" class="input"></td></tr>
		<tr><td colspan="3" style="text-align: center;"><input type="submit" value="수정완료" class="button"></td></tr>
	</table>
</form>
</div>	
</div>
</div>
<div style="height: 90%;">
</div>
<div class="main" style="height: 50px; background-color: #767171; display: table;">
<div style="width: 10px;">
</div>
<div style="display: table-cell; vertical-align: middle; margin-left: 5px;">
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
</body>
</html>