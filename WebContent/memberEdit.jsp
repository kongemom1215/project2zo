<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberinfo.css?ver=3">
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
	<div id="adminMember" style="width:1000px;">
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