<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberinfo.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=2">
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
<hr>
	<!--관리자메뉴  -->
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button" style="width: 300psx; height: 10px;"></div>
<div class="nav_button"><a href="adminPage.do">ADMINISTRATOR SERVICE</a></div>
<div class="nav_button" style="width: 300psx; height: 10px;"></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">

	<div id="main" style="width:1000px;">
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