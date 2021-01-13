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
			location.href="reviewCMTDeletePro.do?rid=${rid}&pageNum=${pageNum}";
		}
		else{
			location.href="reviewCMTDeletePro.do?rid=${rid}&pageNum=${pageNum}";
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
					<input type="button" value="● 문의 게시판" class="button" onclick="location.href='qnaAdminPage.do'" ></input><br>
					<input type="button" value="● 리뷰 게시판" class="button" onclick="location.href='reviewAdminPage.do'" style="color:#00B9FF; font-weight:bold;"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="content2">
				<div id="content3">
					<h2 style=" text-align: center;">REVIEW</h2>
					<table>
						<tr>
							<c:if test="${review.rimg ne null }">
								<td rowspan="4">
									<img src="${review.rimg }" style="width:170px; height:170px;" onclick="window.open(this, '_blank'); return false;">
								</td>
							</c:if>
							<td>주문번호</td>
							<td><fmt:formatDate pattern="yyyyMMdd" value="${review.odate }" />
							-<fmt:formatNumber value="${review.oid }" pattern="00000"></fmt:formatNumber></td>
						</tr>
						<tr>
							<td>회원번호/이름</td>
							<td>[${review.sid }] ${review.rwriter }</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><a href="productDetail.do?pid=${review.pid }">[${review.pid }] ${review.pname }</a></td>
						</tr>
						<tr>
							<td>리뷰 게시일</td>
							<td><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${review.rdate}"/></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>제목</td>
							<td>${review.rtitle }</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${review.rcontent }</td>
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
						<c:when test="${not empty review.rcmt }">
							<tr>
								<td>
								<form action="reviewCMTEdit.do?rid=${review.rid }&pageNum=${pageNum}" method="post">
								<textarea class="cmt1" name="rcmt" style="display:none" rows="5" cols="60">${review.rcmt}</textarea>
								<div class="cmt2">${review.rcmt }</div>
								<input type="button" value="삭제" class="bt1" style="float:right;" onclick="delete_confirm()">
								<input type="button" value="수정" class="bt2" onclick="displayCMT()" style="float:right;">
								<input type="button" value="취소" class="bt4" onclick="displayCMT2()" style="float:right; display:none;">
								<input type="submit" value="수정" class="bt3" style="float:right; display:none;"></form></td>
							</tr>
							<tr>
								<td style="font-size:11px;"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${review.rcmtdate }"/></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>
								<form action="reviewCMTEdit.do?rid=${review.rid }&pageNum=${pageNum}&rctg=${rctg}" method="post">
								<textarea name="rcmt" rows="5" cols="70"></textarea><br>
								<input type="submit" value="등록"></form></td>
							</tr>
						</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${rctg eq 'wait' }">
							<input type="button" value="뒤로가기" onclick="location.href='reviewWaitPage.do?pageNum=${pageNum}'">
						</c:when>
						<c:when test="${rctg ne null}">
							<input type="button" value="뒤로가기" onclick="location.href='reviewSearch.do?pageNum=${pageNum}&pid=${pid }'">
						</c:when>
						<c:otherwise>
							<input type="button" value="뒤로가기" onclick="location.href='reviewAdminPage.do?pageNum=${pageNum}'">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>