<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberinfo.css?ver=1">
<script type="text/javascript">
	function delete_confirm(){
		var delete_confirm=confirm("삭제하시겠습니까?");
		
		if(delete_confirm==true){
			location.href="memberDeletePro.do?sid=${sid}";
		}
		else{
			location.href="memberInfo.do?sid=${sid}";
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
	<div id="adminMember" style="width:1000px;">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회"  onclick="location.href='memberAdminPage.do'" class="button" style="color: #00B9FF; font-weight: bold;"></input><br> 
					<input type="button" value="● 회원 추가" class="button" onclick="location.href='memberInsert.do'"></input>
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
						<table>
							<tr>
								<td>회원 고유 번호</td>
								<td>${sid }</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${shoppinguser.getSname() }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${shoppinguser.getSemail() }</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>${shoppinguser.getScontact() }</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>${shoppinguser.getSpost() }</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${shoppinguser.getSaddress() }</td>
							</tr>
							<tr>
								<td>마켓팅 동의 여부</td>
								<td>
									<c:if test="${shoppinguser.getSagree() eq 'y' }">예</c:if>
									<c:if test="${shoppinguser.getSagree() eq 'n' }">아니오</c:if>
								</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td>${shoppinguser.getSregdate() }</td>
							</tr>
						</table>
						<br>
						<form>
							<input type="button" value="수정" class="button2" onclick="location.href='memberEdit.do?sid=${sid}&pageNum=${pageNum}'"> 
							<input type="button" class="button2" value="삭제" onclick="delete_confirm()"> 
							<input type="button" class="button2" value="뒤로가기" onclick="location.href='memberAdminPage.do?pageNum=${pageNum}'">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>