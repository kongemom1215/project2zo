<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/qna.css"/>
<style type="text/css">
	table{
		width:600px;
		background-color: white;
		border: 1px solid black;
		border-collapse: collapse;
	}
	th, td{
		border: 1px solid black;
		padding:10px;
	}
	td:first-child{
		width:100px;
	}
	td:nth-child(2){
		width:150px;
	}
	a{
		color:black;
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
	function displayCMT(){
		$(".cmt1").css("display","");
		$(".cmt2").css("display","none");
		$(".bt1").css("display","none");
		$(".bt2").css("display","none");
		$(".bt3").css("display","");
		$(".bt4").css("display","");
	}
	function displayCMT2(){
		$(".cmt1").css("display","none");
		$(".cmt2").css("display","");
		$(".bt1").css("display","");
		$(".bt2").css("display","");
		$(".bt3").css("display","none");
		$(".bt4").css("display","none");
	}
	function delete_confirm(){
		var delete_confirm=confirm("삭제하시겠습니까?");
		
		if(delete_confirm==true){
			location.href="qnaCMTDeletePro.do?qid=${qid}&qctg=${qctg}&pageNum=${pageNum}";
		}
		else{
			location.href="qnaCMTDeletePro.do?qid=${qid}&qctg=${qctg}&pageNum=${pageNum}";
		}
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
					<table>
						<tr>
							<td>번호</td>
							<td colspan="3">${qna.qid }</td>
						</tr>
						<tr>
							<td>문의 종류</td>
							<td colspan="3">${qna.qctg }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="3">${qna.sname }</td>
						</tr>
						<tr>
						<c:if test="${qna.pid ne 0}">
							<td>상품</td>
							<td>${qna.pid }-<a href="productDetail.do?pid=${qna.pid }">${qna.pname }...</a></td>
						</c:if>
						<c:if test="${qna.odate ne null}">
							<td>주문번호</td>
							<td><fmt:formatDate pattern="yyyyMMdd" value="${qna.odate }" />-<fmt:formatNumber value="${qna.oid }" pattern="00000"></fmt:formatNumber></td>
						</c:if>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3">${qna.qcontent }</td>
						</tr>
						<tr>
							<c:if test="${not empty qna.qfile}">
								<td>첨부파일</td>
								<td colspan="3"><a class="download" href="${qna.qfile}" style="width:70px;" download>${qfile }</a></td>
							</c:if>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="3"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${qna.qdate}"/></td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td>답변란</td>
						</tr>
						<tr>
							<td>Bye-rus</td>
						</tr>
						<c:choose>
						<c:when test="${not empty qna.qcmt }">
							<tr>
								<td>
								<form action="qnaCMTEdit.do?qid=${qna.qid }&pageNum=${pageNum}&qctg=${qctg}" method="post">
								<textarea class="cmt1" name="qcmt" style="display:none" rows="5" cols="60">${qna.qcmt}</textarea>
								<div class="cmt2">${qna.qcmt }</div>
								<input type="button" value="삭제" class="bt1" style="float:right;" onclick="delete_confirm()">
								<input type="button" value="수정" class="bt2" onclick="displayCMT()" style="float:right;">
								<input type="button" value="취소" class="bt4" onclick="displayCMT2()" style="float:right; display:none;">
								<input type="submit" value="수정" class="bt3" style="float:right; display:none;"></form></td>
							</tr>
							<tr>
								<td style="font-size:11px;"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${qna.qcmtdate }"/></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>
								<form action="qnaCMTEdit.do?qid=${qna.qid }&pageNum=${pageNum}&qctg=${qctg}" method="post">
								<textarea name="qcmt" rows="5" cols="70"></textarea><br>
								<input type="submit" value="등록"></form></td>
							</tr>
						</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${qctg eq 'wait' }">
							<input type="button" value="뒤로가기" onclick="location.href='qnaWaitPage.do?pageNum=${pageNum}&qctg=${qctg }'">
						</c:when>
						<c:when test="${qctg eq '상품' || qctg eq '결제' || qctg eq '기타'}">
							<input type="button" value="뒤로가기" onclick="location.href='qnaSelectCTG.do?pageNum=${pageNum}&qctg=${qctg }'">
						</c:when>
						<c:otherwise>
							<input type="button" value="뒤로가기" onclick="location.href='qnaAdminPage.do?pageNum=${pageNum}'">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>