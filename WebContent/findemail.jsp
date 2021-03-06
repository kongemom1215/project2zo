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
#find{text-align: center; width: 300px; overflow: hidden; position: absolute; right: 50%; top: 30%;}

 	.find{background-color: #00EBFF; display: inline-block; outline: none; cursor: pointer; text-align: center;
	text-decoration: none; padding: .5em 2em .55em; text-shadow: 0 1px 1px rgba(0,0,0,.3); color:white; width:295px;
	border-radius: .5em; box-shadow: 0 1px 2px rgba(0,0,0,.2); border: 0;}
	.find:hover{background-color: #3CCEFF}
	

</style>
</head>
<body>

<div class="main">
<div style="margin-top: 15px;">
<a href="main.do"><img src="./img/Logo.png"></a>

<c:choose>
<c:when test="${session_stype eq '1'}">
<a href="jjimForm.do" class="top_button">위시리스트</a>
<a href="cart.do" class="top_button">장바구니</a>
<a href="mypageOrder.do" class="top_button">주문/배송</a>
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
<a href="login.do?url=jjimForm.do" class="top_button">위시리스트</a>
<a href="login.do?url=cart.do" class="top_button">장바구니</a>
<a href="login.do?url=mypageOrder.do" class="top_button">주문/배송</a>
<a href="login.do?url=mypage.do" class="top_button">마이페이지</a>
<a href="login.do?url=main.do" class="top_button">로그인/회원가입</a>
</c:otherwise>
</c:choose>

</div>
</div>
<hr style="width: 900px; border-bottom: 0xp;">
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button"><a href="aboutUs.do">ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>

<hr style="width: 900px; margin-bottom: 0px; border-bottom: 0px;">
	<div class="main" style="display: table;">
	<div style="display: table-cell; text-align: center; vertical-align: middle;">
		<h1>아이디 찾기</h1>
			<form action="findPwdPro.do">
				<table style="margin-left: auto; margin-right: auto;">
					<tr><td><input type="text" name="sname" required="required" placeholder="이름" class="sname"></td></tr>
					<tr><td><select name="squestion">
						<option>출신 고등학교는?</option>
						<option>현재 사는 지역은?</option>
						<option>어떻게 오셨나요?</option>
						<option>성별은?</option>
					</select></td></tr>
					<tr><td><input type="text" name="sanswer" required="required" placeholder="위 질문의 답변"></td></tr>
					<tr><td><input type="submit" value="아이디찾기" class="find" ></td></tr>
				</table>
			</form>
	</div>
	</div>

<div style="margin-top: 200px;">
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
</div>
</body>
</html>