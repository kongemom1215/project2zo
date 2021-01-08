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
</style>
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
					<input type="button" value="● 공지 게시판" class="button" onclick="location.href='noticeAdminPage.do'" style="color:#00B9FF; font-weight:bold;" ></input><br>
					<input type="button" value="● 문의 게시판" class="button"></input><br>
					<input type="button" value="● 리뷰 게시판" class="button"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="content2">
				<div id="content3">
					<h2 style=" text-align: center;">NOTICE</h2>
					<table>
						<tr>
							<td>SUBJECT</td>
							<td colspan="3">${notice.ntitle }</td>
						</tr>
						<tr>
							<td>NAME</td>
							<td colspan="3">BYE-RUS</td>
						</tr>
						<tr>
							<td>DATE</td>
							<td>${notice.ndate }</td>
							<td>VIEW</td>
							<td>${notice.nhit }</td>
						</tr>
						<tr>
							<td colspan="4">
								${notice.ncontent }
							</td>
						</tr>
						<c:if test="${not empty notice.nfile }">
							<tr>
								<td>첨부 파일</td>
								<td><a class="download" href="${notice.nfile }" style="width:70px;" download>${notice.nfile }</a></td>
							</tr>
						</c:if>
						<c:if test="${not empty nextNotice }">
						<tr>
							<td>▲ 다음글</td>
							<td colspan="3"><a href="noticeInfo.do?nid=${nid+1 }">${nextNotice }</a>
						</tr>
					</c:if>
					<c:if test="${not empty preNotice }">
						<tr>
							<td>▼ 이전글</td>
							<td colspan="3"><a href="noticeInfo.do?nid=${nid-1 }">${preNotice }</a>
						</tr>
					</c:if>
					</table>
				</div>
				<input type="button" class="button3" style="font-size:13px" value="목록">
				<input type="button" class="button2" value="글 수정">
				<input type="button" class="button2" value="글 삭제">
 			</div>
		</div>
	</div>
</body>
</html>