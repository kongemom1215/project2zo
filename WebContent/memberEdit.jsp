<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberinfo.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=2">
</head>
<body>
<!--로고 및 로그인 메뉴  -->
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
	<!--관리자메뉴  -->
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button" style="width: 300psx; height: 10px;"></div>
<div class="nav_button"><a href="adminPage.do">ADMINISTRATOR SERVICE</a></div>
<div class="nav_button" style="width: 300psx; height: 10px;"></div>
</div>
</div>
<hr style="width: 900px; margin-bottom: 0px; border-bottom: 0px;">

	<div class="main" style="width:1000px;">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회" class="button"
						style="color: #00B9FF; font-weight: bold;" onclick="location.href='memberAdminPage.do'" ></input><br> <input
						type="button" value="● 회원 추가" class="button" onclick="location.href='memberInsert.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="search">
				<div id="select">
					<form>
						<select name="option" class="option">
							<option value="none">==선택==</option>
							<option value="sid">회원번호</option>
							<option value="sname">회원이름</option>
							<option value="scotnact">이메일</option>
						</select> <input type="text" name="search_value" size="50px"> <input
							type="submit" value="검색">
					</form>
				</div>
			</div>
			<br>
			<div id="search_content">
				<div id="search_content2">
					<div id="search_table">
						<form action="memberEditPro.do?sid=${sid }" method="post">
						<table>
							<tr>
								<td>회원 고유 번호</td>
								<td>${sid }</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="sname" value="${shoppinguser.getSname() }" required="required"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${shoppinguser.getSemail() }</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input type="text" pattern="[0-9]{3}-[0-9]{3-4}-[0-9]{4}" placeholder="###-####-####" name="scontact" value="${shoppinguser.getScontact() }" required="required"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input type="text" name="spost" value="${shoppinguser.getSpost() }" required="required"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="saddress" value="${shoppinguser.getSaddress() }" required="required"></td>
							</tr>
							<tr>
								<td>마켓팅 동의 여부</td>
								<td>
									<c:if test="${shoppinguser.getSagree() eq 'y' }">
										<input type="radio" name="sagree" value="y" checked>
										<label for='y'>예</label>
										<input type="radio" name="sagree" value="n">
										<label for='n'>아니오</label>
									</c:if>
									<c:if test="${shoppinguser.getSagree() eq 'n' }">
										<input type="radio" name="sagree" value="y">
										<label for='y'>예</label>
										<input type="radio" name="sagree" value="n" checked>
										<label for='n'>아니오</label>
									</c:if>	
								</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td>${shoppinguser.getSregdate() }</td>
							</tr>
						</table>
						<br><br><br><br>
						<input type="submit" class="button2" value="수정">
						<input type="button" value="뒤로가기" class="button2" onclick="location.href='memberInfo.do?sid=${sid}&pageNum=${pageNum }'">
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
</body>
</html>