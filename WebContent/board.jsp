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

<div class="main" style="margin-top: 20px; text-align: center;">
																							
	<c:choose>
	<c:when test="${type eq 'notice' && not empty ncontent}">
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
					<td style="width: 90px;">${ndat }</td>
					<td style="width: 70px;">${nhit }</td>
				</tr>
				<tr>
					<td style="width: 70px;"></td>
					<td style="width: 750px; text-align: left;">${ncontent }</td>
					<td style="width: 70px;"></td>
				</tr>
				<tr>
					<td style="width: 70px;"></td>
					<td style="width: 750px; text-align: left;"><a href="${nfile }" download>${nfile }</a></td>
					<td style="width: 70px;"></td>
				</tr>
			</table> 
			<div style="height: 100px;"></div>
		</c:when>
	<c:when test="${type eq 'review' && not empty rcontent}">
			<table class="board_table1">
				<tr>
					<td style="width: 70px;">번호</td>
					<td style="width: 600px; text-align: left;">내용</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;">조회수</td>
				</tr>
				<tr>
					<td style="width: 70px;">${rid }</td>
					<td style="width: 600px; text-align: left;">${rcontent }</td>
					<td style="width: 70px;">${sname }</td>
					<td style="width: 90px;">${rdate }</td>
					<td style="width: 70px;">${rhit }</td>
				</tr>
			</table> 
			<p>
			<c:if test="${not empty rcmtdate}">
			<table class="board_table1">
			<tr>
					<td style="width: 70px;"></td>
					<td style="width: 600px; text-align: left;">답변 내용</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;"></td>
				</tr>
			<tr>
					<td style="width: 70px;"></td>
					<td style="width: 600px; text-align: left;">${rcmt }</td>
					<td style="width: 70px;">관리자</td>
					<td style="width: 90px;">${rcmtdate }</td>
					<td style="width: 70px;"></td>
				</tr>
			</table>
			</c:if>
			<div style="height: 100px;"></div>
		</c:when>
		<c:when test="${type eq 'qna' && not empty qcontent && session_sid == sid}">
			<table class="board_table1">
				<tr>
					<td style="width: 70px;">번호</td>
					<td style="width: 600px; text-align: left;">내용</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;">카테고리</td>
				</tr>
				<tr>
					<td style="width: 70px;">${qid }</td>
					<td style="width: 600px; text-align: left;">${qcontent }</td>
					<td style="width: 70px;">${sname }</td>
					<td style="width: 90px;">${qdate }</td>
					<td style="width: 70px;">${qctg }</td>
				</tr>
			</table> 
			<p>
			<table class="board_table1">
			<tr>
					<td style="width: 70px;"></td>
					<td style="width: 600px; text-align: left;">답변 내용</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;"></td>
				</tr>
			<tr>
					<td style="width: 70px;"></td>
					<td style="width: 600px; text-align: left;">${qcmt }</td>
					<td style="width: 70px;">관리자</td>
					<td style="width: 90px;">${qcmtdate }</td>
					<td style="width: 70px;"></td>
				</tr>
			</table>
			<div style="height: 100px;"></div>
		</c:when>
		<c:when test="${type eq 'qna' && not empty qcontent && session_sid == 1}">
		<table class="board_table1">
				<tr>
					<td style="width: 70px;">번호</td>
					<td style="width: 600px; text-align: left;">내용</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;">카테고리</td>
				</tr>
				<tr>
					<td style="width: 70px;">${qid }</td>
					<td style="width: 600px; text-align: left;">${qcontent }</td>
					<td style="width: 70px;">${sname }</td>
					<td style="width: 90px;">${qdate }</td>
					<td style="width: 70px;">${qctg }</td>
				</tr>
			</table> 
			<p>
			<table class="board_table1">
			<tr>
					<td style="width: 70px;"></td>
					<td style="width: 600px; text-align: left;">답변 내용</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;"></td>
				</tr>
			<tr>
					<td style="width: 70px;"></td>
					<td style="width: 600px; text-align: left;">${qcmt }</td>
					<td style="width: 70px;">관리자</td>
					<td style="width: 90px;">${qcmtdate }</td>
					<td style="width: 70px;"></td>
				</tr>
			</table>
			<div style="height: 100px;"></div>
		</c:when>
	</c:choose>

	<div>
	<table style="float: left;">
		<tr>
			<td class="board_button"><a href="board.do?type=notice">공지</a></td>
			<td class="board_button"><a href="board.do?type=review">리뷰</a></td>
			<td class="board_button"><a href="board.do?type=qna">문의</a></td>
		</tr>
	</table>
	<c:if test="${not empty session_sname}">
	<table style="float: right;">
	<c:if test="${type eq 'review'}">
	<tr>
		<td class="board_button"><a href="mypageYetReview.do">리뷰 작성</a></td>
	</tr>
	</c:if>
	<c:if test="${type eq 'qna'}">
	<tr>
		<td class="board_button"><a href="writeForm.do?pageNum=${pageNum }&type=qna">글쓰기</a></td>
	</tr>
	</c:if>
	</table>
	</c:if>
	</div>
	<div style="width: 10px; height: 31px;">
	</div>
		<c:choose>
			<c:when test="${type eq 'notice'}">
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
			<c:forEach var="review" items="${list }">
			</c:forEach>
			<table class="board_table1">
					<c:forEach var="review" items="${list }">
					<tr>
							<td style="width: 70px;">${review.rid }</td>
							<td style="width: 600px; text-align: left;"><a href='board.do?sid=${review.sid }&
																							pageNum=${pageNum}&
																							type=review&
																							rid=${review.rid }&
																							sid=${review.sid }&
																							oid=${review.oid }&
																							rwriter=${review.rwriter }&
																							rtitle=${review.rtitle }&
																							rcontent=${review.rcontent }&
																							rimg=${review.rimg }&
																							rdate=${review.rdate }&
																							rhit=${review.rhit }&
																							rcmt=${review.rcmt }&
																							rcmtdate=${review.rcmtdate }&
																							odate=${review.odate }&
																							pid=${review.pid }
																							'>
                   ${review.rtitle }</a></td>
							<td style="width: 70px;">${review.sname }</td>
							<td style="width: 90px;">${review.rdate}</td>
							<td style="width: 70px;">${review.rhit}</td>
					</tr>
				    <c:set var="startNum" value="${startNum - 1 }" />
				    </c:forEach>
			</table>
			<p>
			<c:if test="${startPage > blockSize }">
			<a href='board.do?pageNum=${startPage-blockSize}&type=qna'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='board.do?pageNum=${i}&type=qna'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='board.do?pageNum=${startPage+blockSize}&type=qna'>[다음]</a>
		</c:if>
			</c:when>
			
			<c:when test="${type eq 'qna'}">
			<table class="board_table1">
				<tr>
					<td style="width: 70px;">번호</td>
					<td style="width: 600px; text-align: left;">제목</td>
					<td style="width: 70px;">작성자</td>
					<td style="width: 90px;">작성일</td>
					<td style="width: 70px;">카테고리</td>
				</tr>
			</table>
			<table class="board_table2">
				<tr>
					<td style="width: 900px;"> </td>
				</tr>
			</table>
			<table class="board_table1">
					<c:forEach var="qna" items="${list }">
					<tr>
							<td style="width: 70px;">${qna.qid }</td>
							<td style="width: 600px; text-align: left;"><a href='board.do?sid=${qna.sid }&
																							pageNum=${pageNum}&
																							type=qna&
																							qid=${qna.qid }&
																							sname=${qna.sname }&
																							qdate=${qna.qdate}&
																							qctg=${qna.qctg }&
																							qcontent=${qna.qcontent }&
																							qcmt=${qna.qcmt }&
																							qcmtdate=${qna.qcmtdate }
																							'>
                   문의 드립니다 <c:if test="${not empty qna.qcmt}">[답변완료]</c:if></a></td>
							<td style="width: 70px;">${qna.sname }</td>
							<td style="width: 90px;">${qna.qdate}</td>
							<td style="width: 70px;">${qna.qctg }</td>
					</tr>
				    <c:set var="startNum" value="${startNum - 1 }" />
				    </c:forEach>
			</table>
			<p>
			<c:if test="${startPage > blockSize }">
			<a href='board.do?pageNum=${startPage-blockSize}&type=qna'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='board.do?pageNum=${i}&type=qna'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='board.do?pageNum=${startPage+blockSize}&type=qna'>[다음]</a>
		</c:if>
			</c:when>
			
		</c:choose>
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