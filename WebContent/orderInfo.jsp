<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--
회원번호 검색
1. 회원이 존재하는지
2. 존재하면 주문내역 조회 
   회원이 존재하지 않으면 result = -1;
3. 주문내역이 없으면 result=0;
   주문내역이 있으면 result=1;

주문번호 검색
1. 해당 주문번호가 있는지
2. 있으면 result=1;
없으면 result=-1;  
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/order.css?ver=21">
<script type="text/javascript">
	function chk() {
		if (frm.option.value == "none" || frm.option.value == "") {
			alert("검색 옵션을 선택해 주십시오");
			return false;
		}
		if (!frm.search_value.value) {
			alert("검색어를 입력해주세요.");
			return false;
		}
		if (isNaN(frm.search_value.value)) {
			alert("숫자만 입력해주세요");
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
			<img src="./img/admin_order.JPG" id="img1">
			<h2 class="memberMenu">결제&배송 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원/주문번호 검색" class="button"
						style="color: #00B9FF; font-weight: bold;"
						onclick="location.href='orderAdminPage.jsp'"></input><br> <input
						type="button" value="● 결제 내역 전체 조회" class="button" onclick="location.href='orderAllPage.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="search">
				<div id="select">
					<form name="frm" action="orderMemberSearch.do"
						onsubmit="return chk()">
						<select name="option" class="option">
							<option value="none">==선택==</option>
							<option value="sid"
								<c:if test="${option eq 'sid' }">selected="selected"</c:if>>회원번호</option>
							<option value="orderCode"
								<c:if test="${option eq 'orderCode' }">selected="selected"</c:if>>주문번호</option>
						</select> <input type="text" name="search_value" size="50px"
							placeholder="검색어를 입력해주세요." value="${search_value }"> <input
							type="submit" value="검색">
					</form>
				</div>
			</div>
			<br>
			<div id="search_content">
				<div id="search_table">
					<table>
						<tr>
							<th colspan="2">주문 정보</th>
						</tr>
						<tr>
							<td>주문번호</td>
							<td><fmt:formatDate pattern="yyyyMMdd"
									value="${order.odate }" /> - <fmt:formatNumber
									value="${order.oid }" pattern="00000" /></td>
						</tr>
						<tr>
							<td>진행상태</td>
							<td><c:choose>
									<c:when test="${order.ostate eq '0' }">구매 취소</c:when>
									<c:when test="${order.ostate eq '1' }">
											입금 대기중 <input type="button" value="입금완료" onclick="location.href='orderChangeOstate.do?oid=${order.oid}'">
										</c:when>
										<c:when test="${order.ostate eq '2' }">
											입금 완료 <input type="button" value="배송출발"  onclick="location.href='orderChangeOstate.do?oid=${order.oid}'">
										</c:when>
										<c:when test="${order.ostate eq '3' }">
											배송중 <input type="button" value="배송완료"  onclick="location.href='orderChangeOstate.do?oid=${order.oid}'">
										</c:when>
									<c:when test="${order.ostate eq '4' }">배송 완료</c:when>
									<c:when test="${order.ostate eq '5' }">구매확정</c:when>
									<c:when test="${order.ostate eq '6' }">리뷰 완료</c:when>
								</c:choose></td>
						</tr>
						<tr>
							<td>주문일</td>
							<td><fmt:formatDate pattern="yyyy.MM.dd HH:mm"
									value="${order.odate }" /></td>
						</tr>
						<tr>
							<td>주문고객번호</td>
							<td>${order.sid }</td>
						</tr>
						<tr>
							<td>총 구매액</td>
							<td><fmt:formatNumber
									value="${order.oamount}" pattern="#,###" />원
								(배송비 : <fmt:formatNumber value="${order.odelivery }"
									pattern="#,###" /> 원)</td>
						</tr>
					</table>
					<table>
						<tr>
							<th colspan="2">수령자 정보</th>
						</tr>
						<tr>
							<td>이름</td>
							<td>${order.oname }</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>${order.ocontact }</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>${order.opost }</td>
						</tr>
						<tr>
							<td>수령자 주소</td>
							<td>${order.oaddress }</td>
						</tr>
					</table>
					<table>
						<tr>
							<th colspan="2">주문내역</th>
						</tr>
						<c:forEach var="detail" items="${orderdetaillist }">
							<tr>
								<td rowspan="3"><img src="${detail.pthumbimg }"
									style="width: 100px; height: 100px; vertical-align: center;"></td>
								<td>상품명 : ${detail.pname }</td>
							</tr>
							<tr>
								<td>상품 가격 : <fmt:formatNumber value="${detail.pprice }"
										pattern="#,###" />원
								</td>
							</tr>
							<tr>
								<td>수량 : ${detail.dqty } 개 <c:if test="${detail.poption ne null }">
										| 옵션 : [${detail.poption }]</c:if></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<input type="button" value="뒤로가기" style="float:right;" onclick="location.href='orderMemberSearch.do?option=${option}&search_value=${search_value }'">
			</div>
		</div>
	</div>
</body>
</html>