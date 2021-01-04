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
	h1{font-weight: 900;}
	#join{ text-align: center; }
	
	table{width: 35%;
		  height: 400px;
		  margin: auto;
		  font-weight: bolder;
		  }
	th:nth-child(2n), td:nth-child(2n){
	background-color: #B9FFFF;}
	
	.semail{width: auto; height: 100%;	background-color: #B9FFFF; border: 0px; font-size: 30px; outline: none;}
	.spwd{width: auto; height: 100%;	background-color: #B9FFFF; border: 0px; font-size: 30px; outline: none;}
	.sname{width: auto; height: 100%;	background-color: #B9FFFF; border: 0px; font-size: 30px; outline: none;}
	.scontact{width: auto; height: 100%;	background-color: #B9FFFF; border: 0px; font-size: 30px; outline: none;}
	.saddress{width: auto; height: 100%;	background-color: #B9FFFF; border: 0px; font-size: 30px; outline: none;}
	.spost{width: auto; height: 100%;	background-color: #B9FFFF; border: 0px; font-size: 30px; outline: none;}
	.button{background-color: #00EBFF; display: inline-block; outline: none; cursor: pointer; text-align: center; width:150px;
	text-decoration: none; padding: 10px 10px 10px 10px; text-shadow: 0 1px 1px rgba(0,0,0,.3);
	border-radius: .5em; box-shadow: 0 1px 2px rgba(0,0,0,.2); border: 0; color:white;}
	.button:hover{background-color: #3CCEFF;}
	
	.sagree{background-color: white;}
	::placeholder{
	text-align:center;
	font-size: 0.5em;	
	font-weight: 100;
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
<a class="top_button">마이페이지</a>
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

<div id="join">
<h1>SIGN UP</h1>
 <form action="joinPro.do">
		<table>
			<tr><td>이메일 </td><td><input   type="email" name="semail"  class="semail" required="required" placeholder="아이디로 사용할 이메일 주소를 입력해주세요."></td></tr>
	<!-- 		<td><input type="button" value="중복확인" ></td> -->
	
			<tr><td>비밀번호 </td><td>   <input  type="password" name="spwd" class="spwd" required="required" placeholder="비밀번호를 입력해주세요."></td></tr>
			<tr><td>이름 </td><td>   <input  type="text" name="sname" class="sname" required="required" placeholder="한글 15자, 영문 30자까지 가능합니다."></td></tr>
			<tr><td>연락처 </td><td>   <input  type="text" name="scontact" class="scontact" required="required"
			pattern="\d{2,3}-\d{3,4}-\d{4}"
			placeholder="XXX   -   XXXX   -   XXXX"
			 title="2,3자리-3,4자리-4자리"></td></tr>
			 
			 <tr><td>주소 </td><td>   <input  type="text" name="saddress" class="saddress" required="required"></td></tr>
			 <tr><td>우편번호 </td><td>   <input  type="number" name="spost" class="spost"
			 title="숫자만 입력" placeholder="숫자만 입력가능합니다."
			 required="required"></td></tr>
			 <tr><td>마케팅동의</td><td>   Y<input  type="radio" name="sagree" value="y">
			N<input  type="radio" name="sagree" value="n" > </td></tr>
		</table>
		<input type="submit" value="회원가입" class="button">
  </form><p>
 </div>
</body>
</html>