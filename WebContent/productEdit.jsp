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
<div class="main">
	<div id="adminProduct">
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
					<div id="search_table" style="margin-left:40px;">
						<form action="productEditPro.do?pid=${pid }&pageNum=${pageNum}" method="post">
						<table>
							<tr>
								<td rowspan="3" colspan="2"><img src="${product.pthumbimg }" id="img2"></td>
								<td>상품번호</td>
								<td>${product.pid }</td>
							</tr>
							<tr>
								<td>상품 이름</td>
								<td><input type="text" name="pname" value="${product.pname }" required="required"></td>
							</tr>
							<tr>
								<td>상품종류</td>
								<td><select name="ptype">
										<option value="sodok" <c:if test="${product.ptype eq 'sodok'}">selected="selected"</c:if>>소독</option>
										<option value="mask" <c:if test="${product.ptype eq 'mask'}">selected="selected"</c:if>>마스크</option>
										<option value="alco" <c:if test="${product.ptype eq 'alco'}">selected="selected"</c:if>>알코올</option>
										<option value="sejung" <c:if test="${product.ptype eq 'sejung'}">selected="selected"</c:if>>세정</option>
										<option value="bangdok" <c:if test="${product.ptype eq 'bangdok'}">selected="selected"</c:if>>방독</option>
										<option value="cheon" <c:if test="${product.ptype eq 'cheon'}">selected="selected"</c:if>>체온</option>
										<option value="home" <c:if test="${product.ptype eq 'home'}">selected="selected"</c:if>>재택용품</option>
										<option value="etc" <c:if test="${product.ptype eq 'etc'}">selected="selected"</c:if>>기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="text" name="pprice" value="${product.pprice }" required="required" size="10">원</td>
								<td>상품 조회수</td>
								<td>${product.phit }</td>
							</tr>
							<tr>
								<td>재고</td>
								<td><input type="text" name="pinventory" value="${product.pinventory }" required="required" size="10">개</td>
								<td>판매량</td>
								<td>${product.psell }개</td>
							</tr>
							<tr>
								<td>할인율</td>
								<td><input type="text" name="pdiscount" value="${product.pdiscount }" required="required"size="5">%</td>
								<td>공개여부</td>
								<td>
									<c:if test="${product.ppublic eq 0 }">
										<input type="radio" name="ppublic" value="1"> 공개
										<input type="radio" name="ppublic" value="0" checked="checked"> 비공개
									</c:if>
								<c:if test="${product.ppublic eq 1 }">
									<input type="radio" name="ppublic" value="1" checked="checked"> 공개
									<input type="radio" name="ppublic" value="0"> 비공개</c:if>
								</td>
							</tr>
							<tr>
								<td>썸네일</td>
								<td><input type="file" name="pthumbimg" required="required"></td>
							</tr>
							<tr>
								<td>상품등록일</td>
								<td>${product.pregdate }</td>
							</tr>
						</table>
						<br>
							<input type="submit" class="button2" value="수정">
							<input type="button" value="뒤로가기" class="button2" onclick="location.href='productInfo.do?pid=${pid}&pageNum=${pageNum }'">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>