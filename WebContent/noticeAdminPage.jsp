<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/notice.css?ver=1"/>
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=2">
<style type="text/css">
	table{
		width:600px;
		background-color: white;
		border-top: 3px solid #d2d2d2;
		border-collapse: collapse;
	}
	th, td{
		border-bottom : 3px solid #d2d2d2;
		padding:10px;
	}
	td:nth-child(2), th:nth-child(2) {
		width:300px;
	}
	a{
		color:black;
		text-decoration: none;
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
<!--로고 및 로그인 메뉴  -->
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

	<div class="main" style="width:1100px;">
		<div id="sidebar">
			<img src="./img/admin_board.JPG" id="img1">
			<h2 class="boardMenu">게시판 관리</h2>
			<div class="boardMenuButton">
				<form>
					<input type="button" value="● 공지 게시판" class="button" onclick="location.href='noticeAdminPage.do'" style="color:#00B9FF; font-weight:bold;" ></input><br>
					<input type="button" value="● 문의 게시판" class="button"></input><br>
					<input type="button" value="● 리뷰 게시판" class="button"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="content2">
				<div id="content3">
					<table>
						<tr>
							<th>NO</th>
							<th>SUBJECT</th>
							<th>NAME</th>
							<th>DATE</th>
							<th>VIEW</th>
						</tr>
						<c:if test="${totalNotice>0 }">
						<c:forEach var="notice" items="${noticelist }">
							<tr>
								<td>${startNum }</td>
								<td>
									<c:if test="${notice.npublic eq '0' }">
									(비공개)
									</c:if>
									<a href="noticeInfo.do?nid=${notice.nid }&pageNum=${pageNum}">${notice.ntitle }</a></td>
								<td>운영자</td>
								<td>${notice.ndate }</td>
								<td>${notice.nhit }</td>
							</tr>
							<c:set var="startNum" value="${startNum -1 }"></c:set>
						</c:forEach>
						</c:if>
					</table>
					<div style="text-align:center">
						<c:if test="${startPage>blockSize }">
							<a href="noticeAdminPage.do?pageNum=${startPage-blockSize }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}">
							<a href="noticeAdminPage.do?pageNum=${i }">[${i }]</a>
						</c:forEach>
						<c:if test="${endPage< pageCnt}">
							<a href="noticeAdminPage.do?pageNum=${startPage+blockPage }">[다음]</a>
						</c:if>
					</div>
				</div>
				<input type="button" class="button2" value="글 작성">
			</div>
		</div>
	</div>
</body>
</html>