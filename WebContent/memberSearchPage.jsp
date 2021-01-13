<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberadmin.css?ver=1">
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
	<div id="adminMember">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회" class="button" style="color:#00B9FF; font-weight:bold;" onclick="location.href='memberAdminPage.do'" ></input><br>
					<input type="button" value="● 회원 추가" class="button" onclick="location.href='memberInsert.do'"></input><br>
					<input type="button" value="● 쿠폰 등록" class="button" onclick="location.href='couponAdminPage.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="search">
				<div id="select">
					<form name="frm" action="memberSearch.do" onsubmit="return chk()">
						<select name="option" class="option">
							<option value="none">==선택==</option>
							<option value="sid"<c:if test="${option eq 'sid'}">selected="selected"</c:if>>회원번호</option>
							<option value="sname"<c:if test="${option eq 'sname'}">selected="selected"</c:if>>회원이름</option>
							<option value="semail"<c:if test="${option eq 'semail'}">selected="selected"</c:if>>이메일</option>
						</select>
						<input type="text" name="search_value" size="50px" placeholder="검색어를 입력해주세요." <c:if test="${!empty search_value }">value="${search_value }"</c:if>>
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
								<td><a href="memberInfo.do?sid=${user.sid }&pageNum=${pageNum}&option=${option}&search_value=${search_value}">${user.sname }</a></td>
								<td>${user.semail }</td>
								<td>${user.scontact }</td>
								<td>${user.sregdate }</td>
							</tr>
						</c:forEach>	
					</table>
					<div style="text-align : center">
						<c:if test="${startPage>blockSize }">
							<a href="memberSearch.do?pageNum=${startPage-blockSize }&option=${option}&search_value=${search_value}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}">
							<a href="memberSearch.do?pageNum=${i }&option=${option}&search_value=${search_value}">[${i }]</a>
						</c:forEach>
						<c:if test="${endPage< pageCnt}">
							<a href="memberSearch.do?pageNum=${startPage+blockPage }&option=${option}&search_value=${search_value}">[다음]</a>
						</c:if>
					</div>
					<div>
						총 회원수 : ${totalUser }
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>