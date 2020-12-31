<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberadmin.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/YoungCSS2.css?ver=2">
<style type="text/css">
a{
	color:black;
}

a:visited {
	color:black;
}

a:link{
	color:black;
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
		
	<div id="adminMember">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회" class="button" style="color:#00B9FF; font-weight:bold;"></input><br>
					<input type="button" value="● 회원 추가" class="button"></input>
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
						</select>
						<input type="text" name="search_value" size="50px">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
			<br>
			<div id="search_content">
				<div id="search_table">
					<table>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>가입일</th>
						</tr>
						<c:forEach var="user" items="${userlist }">
							<tr>
								<td>${user.sid }</td>
								<td><a href="memberInfo.do?sid=${user.sid }">${user.sname }</a></td>
								<td>${user.semail }</td>
								<td>${user.scontact }</td>
								<td>${user.sregdate }</td>
							</tr>
						</c:forEach>	
					</table>
					<div style="text-align : center">
						<c:if test="${startPage>blockSize }">
							<a href="memberAdminPage.do?pageNum=${startPage-blockSize }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}">
							<a href="memberAdminPage.do?pageNum=${i }">[${i }]</a>
						</c:forEach>
						<c:if test="${endPage< pageCnt}">
							<a href="memberAdminPage.do?pageNum=${startPage+blockPage }">[다음]</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>