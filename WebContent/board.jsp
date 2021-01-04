<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 네이버 차트  -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="js/billboard.js"></script>
<link rel="stylesheet" href="css/billboard.css">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!-- CSS 파일 -->
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<!--  -->
<meta charset="UTF-8">
<!--  -->
<title>Insert title here</title>
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

<div class="main" style="margin-top: 20px; text-align: center;">

	<c:choose>
		<c:when test="${not empty ntitle}">
			<table class="board_table1">
				<tr>
					<td style="width: 70px;">번호</td>
					<td style="width: 600px; text-align: left;">제목</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;">조회수</td>
				</tr>
				<tr>
					<td style="width: 70px;">${nid }</td>
					<td style="width: 600px; text-align: left;">${ntitle }</td>
					<td style="width: 70px;">관리자</td>
					<td style="width: 90px;">${ndate }</td>
					<td style="width: 70px;">${nhit }</td>
				</tr>
			</table>
			<table class="board_table1" style="border-top: 0px;">
				<tr>
					<td style="width: 70px;"></td>
					<td style="width: 760px; text-align: left;">${ncontent }</td>
					<td style="width: 70px;"></td>
				</tr>
			</table>
			<div style="height: 100px;"></div>
		</c:when>
	</c:choose>

	<table>
		<tr>
			<td class="board_button"><a href="board.do?type=notice">공지</a></td>
			<td class="board_button"><a href="board.do?type=review">리뷰</a></td>
			<td class="board_button"><a href="board.do?type=qna">문의</a></td>
		</tr>
	</table>
	<table class="board_table1">
		<tr>
			<td style="width: 70px;">번호</td>
			<td style="width: 600px; text-align: left;">제목</td>
			<td style="width: 70px;">작성자</td>
			<td style="width: 90px;">작성일</td>
			<td style="width: 70px;">조회수</td>
		</tr>
	</table>
	<table class="board_table2">
		<tr>
			<td style="width: 900px;"> </td>
		</tr>
	</table>
	
		<c:choose>
			<c:when test="${type eq 'notice'}">
				<table class="board_table1" style="margin-bottom: 5px;">
					<c:forEach var="list" items="${list }" begin="${(20*select_page) }" end="${20 + (20*select_page) }">
						<tr>
							<td style="width: 70px;">${list.nid }</td>
							<td style="width: 600px; text-align: left;"><a href="board.do?
							type=notice&
							nid=${list.nid }&
							ntitle=${list.ntitle }&
							ncontent=${list.ncontent }&
							npublic=${list.npublic }&
							ndate=${list.ndate }&
							nfile=${list.nfile }&
							nhit=${list.nhit }&
							page=${page }
							">${list.ntitle }</a></td>
							<td style="width: 70px;">관리자</td>
							<td style="width: 90px;">${list.ndate }</td>
							<td style="width: 70px;">${list.nhit }</td>
						</tr>
					</c:forEach>
				</table>
					<c:forEach var="page" begin="1" end="${page_num }">
						<a href="board.do?page=${page}&type=notice">${page }</a>
					</c:forEach>
				</c:when>
			<c:when test="${type eq 'review'}">
				<table class="board_table1">
					<c:forEach var="list" items="${list }">
						<tr>
							<td style="width: 70px;">${list.nid }</td>
							<td style="width: 600px; text-align: left;"><a>${list.ntitle }</a></td>
							<td style="width: 70px;">작성자</td>
							<td style="width: 90px;">작성일</td>
							<td style="width: 70px;">조회수</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:when test="${type eq 'qna'}">
				<table class="board_table1">
					<c:forEach var="list" items="${list }">
						<tr>
							<td style="width: 70px;">${list.qid }</td>
							<td style="width: 600px; text-align: left;"><a>${list.qtitle }</a></td>
							<td style="width: 70px;">${list.sname }</td>
							<td style="width: 90px;">${odate }</td>
							<td style="width: 70px;">조회수</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
		</c:choose>
</div>

</body>
</html>