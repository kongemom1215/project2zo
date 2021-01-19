<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/notice.css?ver=1"/>
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
	#select{
		text-align: center;
	}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function displayCTG(){
		$(".ctg").css("display","");
	}
	function selectCTG(){
		var qctg=document.getElementById("qctg").value;
		if(document.getElementById("qctg").value!="none")
			location.href="qnaSelectCTG.do?qctg="+qctg;
	}
</script>
</head>
<body>
	<!--로고 및 로그인 메뉴  -->
	<div style="width: 900px; margin-left: 350px; position: relative;">
		<img src="img/Logo.png"> <input type="button" value="로그아웃"
			class="top"
			style="float: right; background-color: white; border: 0px;"></input>
		<input type="button" value="관리자페이지" class="top"
			style="float: right; background-color: white; border: 0px;"
			onclick="location.href='adminPage.do'"></input>
	</div>
	<hr>
	<!--관리자메뉴  -->
	<div
		style="width: 900px; height: 10px; display: table-cell; vertical-align: middle; position: relative;">
		<div style="width: 900px; margin-left: 350px;">
			<div id="admin" style="position: relative; float: left;">
				<input type="button"
					style="width: 300px; background-color: white; border: 0px;"
					value="ADMINISTRATOR SERVICE"
					onclick="location.href='adminPage.do'">
			</div>
		</div>
	</div>
	<hr>
	<div id="adminBoard" style="width:1100px;">
		<div id="sidebar">
			<img src="./img/admin_board.JPG" id="img1">
			<h2 class="boardMenu">게시판 관리</h2>
			<div class="boardMenuButton">
				<form>
					<input type="button" value="● 공지 게시판" class="button" onclick="location.href='noticeAdminPage.do'"></input><br>
					<input type="button" value="● 문의 게시판" class="button" onclick="location.href='qnaAdminPage.do'" style="color:#00B9FF; font-weight:bold;"></input><br>
					<input type="button" value="● 리뷰 게시판" class="button" onclick="location.href='reviewAdminPage.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="content2">
				<div id="content3">
					<h2 style=" text-align: center;">Q&A</h2>
					<table id="select">
						<tr>
							<td><input type="button" value="전체 문의 보기" onclick="location.href='qnaAdminPage.do'"></td>
							<td><input type="button" value="미답변 문의 보기" onclick="location.href='qnaWaitPage.do'"></td>
							<td><input type="button" value="카테고리별로 보기" onclick="displayCTG()"></td>
						</tr>
						<tr class="ctg" style="display:none">
							<td colspan="3">
								<select name="qctg" id="qctg" onchange="selectCTG()">
									<option value="none">=선택=</option>
									<option value="상품">상품</option>
									<option value="결제">결제</option>
									<option value="기타">기타</option>
								</select>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<th>NO</th>
							<th>SUBJECT</th>
							<th>NAME</th>
							<th>DATE</th>
						</tr>
						<c:forEach var="wait" items="${waitlist }">
							<tr>
								<td>${wait.qid }</td>
								<td><c:if test="${not empty wait.qcmt }">
								[답변완료]
								</c:if>
								<a href="qnaInfo.do?qid=${wait.qid }&pageNum=${pageNum}&qctg=wait">문의 드립니다</a></td>
								<td>${wait.sname }</td>
								<td>${wait.qdate }</td>
							</tr>
						</c:forEach>
					</table>
					<div style="text-align:center">
						<c:if test="${startPage>blockSize }">
							<a href="qnaWaitPage.do?pageNum=${startPage-blockSize }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}">
							<a href="qnaWaitPage.do?pageNum=${i }">[${i }]</a>
						</c:forEach>
						<c:if test="${endPage< pageCnt}">
							<a href="qnaWaitPage.do?pageNum=${startPage+blockPage }">[다음]</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>