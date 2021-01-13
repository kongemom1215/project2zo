<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberadmin.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=2">
<style type="text/css">
a{
	color:black;
}

a:visited {
	color:black;
}

a:link{
	color:black;
}
</style>
<script type="text/javascript">
	function chk(){
		if(frm.option.value=="none" || frm.option.value==""){
			alert("검색 옵션을 선택해 주십시오");
			return false;
		}
		if(!frm.search_value.value){
			alert("검색어를 입력해주세요.");
			return false;
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
	<!--관리자메뉴  -->
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button" style="width: 300psx; height: 10px;"></div>
<div class="nav_button"><a href="adminPage.do">ADMINISTRATOR SERVICE</a></div>
<div class="nav_button" style="width: 300psx; height: 10px;"></div>
</div>
</div>
<hr style="width: 900px; margin-bottom: 0px; border-bottom: 0px;">

	<div class="main" style="width: 1000px;">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회" class="button" style="color:#00B9FF; font-weight:bold;" onclick="location.href='memberAdminPage.do'" ></input><br>
					<input type="button" value="● 회원 추가" class="button" onclick="location.href='memberInsert.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="search">
				<div id="select">
					<form name="frm" action="memberSearch.do" onsubmit="return chk()">
						<select name="option" class="option">
							<option value="none">==선택==</option>
							<option value="sid">회원번호</option>
							<option value="sname">회원이름</option>
							<option value="semail">이메일</option>
						</select>
						<input type="text" name="search_value" size="50px" placeholder="검색어를 입력해주세요.">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
			<br>
			<div id="search_content">
				<div id="search_table">
					<table>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>가입일</th>
						</tr>
						<c:forEach var="user" items="${userlist }">
							<tr>
								<td>${user.sid }</td>
								<td><a href="memberInfo.do?sid=${user.sid }&pageNum=${pageNum}">${user.sname }</a></td>
								<td>${user.semail }</td>
								<td>${user.scontact }</td>
								<td>${user.sregdate }</td>
							</tr>
						</c:forEach>	
					</table>
					<div style="text-align : center">
						<c:if test="${startPage>blockSize }">
							<a href="memberAdminPage.do?pageNum=${startPage-blockSize }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}">
							<a href="memberAdminPage.do?pageNum=${i }">[${i }]</a>
						</c:forEach>
						<c:if test="${endPage< pageCnt}">
							<a href="memberAdminPage.do?pageNum=${startPage+blockPage }">[다음]</a>
						</c:if>
					</div>
					<div>
						총 회원수 : ${totalUser }
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 50px;">
</div>
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
</body>
</html>