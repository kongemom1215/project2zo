<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/productinfo.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=2">
<style type="text/css">
a{
	color:black;
	text-decoration:none;
}

a:visited {
	color:black;
}

a:link{
	color:black;
}
.download{
	display:inline-block;
    width:50px;
    line-height:30px;
    text-align:center;
    background-color:white;
    border: 1px solid black;
    color:#fff;
    font-size: 12px;
    margin-left:10px;
}
.download:hover{
	cursor: pointer;
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
	function delete_confirm(){
		var delete_confirm=confirm("삭제하시겠습니까?");
		
		if(delete_confirm==true){
			location.href="productDeletePro.do?pid=${pid}";
		}
		else{
			location.href="productInfo.do?pid=${pid}";
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
	<div class="main" style="width: 1100px;">
		<div id="sidebar">
			<img src="./img/admin_product.JPG" id="img1">
			<h2 class="productMenu">상품 관리</h2>
			<div class="productMenuButton">
				<form>
					<input type="button" value="● 상품 검색" class="button" style="color:#00B9FF; font-weight:bold;" onclick="location.href='productAdminPage.do'" ></input><br>
					<input type="button" value="● 상품 추가" class="button" onclick="location.href='productInsert.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="search">
				<div id="select">
					<form name="frm" action="memberSearch.do" onsubmit="return chk()">
						<select name="option" class="option">
							<option value="none">==선택==</option>
							<option value="pid">상품번호</option>
							<option value="pname">상품이름</option>
						</select>
						<input type="text" name="search_value" size="50px" placeholder="검색어를 입력해주세요.">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
			<br>
			<div id="search_content">
				<div id="search_content2">
					<div id="search_table">
						<table style="width:600px;">
							<tr>
								<td colspan="2" rowspan="3"><img src="${product.pthumbimg }" id="img2"></td>
								<td>상품번호</td>
								<td>${product.pid }</td>
							</tr>
							<tr>
								<td>상품 이름</td>
								<td>${product.pname }</td>
							</tr>
							<tr>
								<td>상품종류</td>
								<td>${product.ptype }</td>
							</tr>
							<tr>
								<td>가격</td>
								<td>${product.pprice }원</td>
								<td>상품 조회수</td>
								<td>${product.phit }</td>
							</tr>
							<tr>
								<td>재고</td>
								<td>${product.pinventory }개</td>
								<td>판매량</td>
								<td>${product.psell }개</td>
							</tr>
							<tr>
								<td>할인율</td>
								<td>${product.pdiscount }%</td>
								<td>공개여부</td>
								<td><c:if test="${product.ppublic eq 0 }">비공개</c:if>
								<c:if test="${product.ppublic eq 1 }">공개</c:if></td>
							</tr>
							<tr>
								<td>썸네일</td>
								<td><a href="${product.pthumbimg }" class="download" onclick="window.open(this.href, '_blank'); return false;">조회</a><a class="download" href="${product.pthumbimg }" style="width:70px;" download>다운로드</a></td>
								<td>상세이미지</td>
								<td><input type="button" value="페이지로확인" onclick="location.href=productDetail.do?pid=${product.pid}" class="download" style="width:90px; color:black;"></td>
							</tr>
							<tr>
								<td>옵션</td>
								<td>${product.poption}</td>
								<td>상품등록일</td>
								<td>${product.pregdate }</td>
								
							</tr>
						</table>
						<br>
						<form>
							<input type="button" value="수정" class="button2" onclick="location.href='productEdit.do?pid=${pid}&pageNum=${pageNum}'"> 
							<input type="button" class="button2" value="삭제" onclick="delete_confirm()"> 
							<input type="button" class="button2" value="뒤로가기" onclick="location.href='productAdminPage.do?pageNum=${pageNum}'">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>