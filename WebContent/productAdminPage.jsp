<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/productadmin.css?">
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
					<form name="frm" action="productSearch.do" onsubmit="return chk()">
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
				<div id="search_table">
					<table>
						<c:forEach var="product" items="${productlist }">
							<tr>
								<td rowspan="2">${product.pid}</td>
								<td rowspan="2"><a href="productInfo.do?pid=${product.pid }&pageNum=${pageNum}"><img src="${product.pthumbimg }" id="img2"></a></td>
								<td colspan="3">상품명 : ${product.pname }</td>
								
							</tr>
							<tr>
								<td>상품 가격 : <fmt:formatNumber value="${product.pprice }" pattern="#,###"/>원</td>
								<td>판매량 : <fmt:formatNumber value="${product.psell }" pattern="#,###"/>개</td>
								<td>재고 : <fmt:formatNumber value="${product.pinventory }" pattern="#,###"/>개</td>
							</tr>
						</c:forEach>	
					</table>
					<br><br>
					<div style="text-align : center">
						<c:if test="${startPage>blockSize }">
							<a href="productAdminPage.do?pageNum=${startPage-blockSize }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage}">
							<c:choose>
								<c:when test="${i eq pageNum }">
									<a href="productAdminPage.do?pageNum=${i }" style="font-weight:bold;">${i }</a>
								</c:when>
								<c:otherwise>
								<a href="productAdminPage.do?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>	
						</c:forEach>
						<c:if test="${endPage< pageCnt}">
							<a href="productAdminPage.do?pageNum=${startPage+blockSize }">[다음]</a>
						</c:if>
					</div>
					<br>
					<div>
						총 상품수 : ${totalProduct }개
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>