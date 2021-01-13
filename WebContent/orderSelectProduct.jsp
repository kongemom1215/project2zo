<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/order2.css?ver=20">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	function chk(){
		if(!frm.pid.value){
			alert("검색어를 입력해주세요.");
			return false;
		}
		if(isNaN(frm.pid.value)){
			alert("숫자만 입력해주세요");
			return false;
		}
	}
	function display1(){
		$(".1").css("display","");
		$(".2").css("display","none");
		$(".3").css("display","none");
	}
	function display2(){
		$(".1").css("display","none");
		$(".2").css("display","");
		$(".3").css("display","none");
	}
	function display3(){
		$(".1").css("display","none");
		$(".2").css("display","none");
		$(".3").css("display","");
	}
	function selectOstate(obj){
		var ostate=$(obj).val();
		if(ostate!="none")
			location.href="orderSelectOstate.do?ostate="+ostate;
		if(ostate=="none")
			location.href="orderAllPage.do";
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
					<input type="button" value="● 회원/주문번호 검색" class="button" onclick="location.href='orderAdminPage.jsp'" ></input><br>
					<input type="button" value="● 결제 내역 전체 조회" class="button"  style="color:#00B9FF; font-weight:bold;" onclick="location.href='orderAllPage.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
				<div id="content2">
					<table id="select">
						<tr>
							<td style="width:200px;"><input type="button" value="진행상태별" onclick="display1()"></td>
							<td style="width:200px;"><input type="button" value="날짜별" onclick="display2()"></td>
							<td style="width:200px;"><input type="button" value="상품별" onclick="display3()"></td>
						</tr>
						<tr>
							<td class="1" style="text-align=center; display:none;" colspan="3">
								<select name="ostate" id="ostate" onchange="selectOstate(this)">
									<option value="none">==전체==</option>
									<option value="0"<c:if test="${ostate eq '0' }">selected="seleted"</c:if>>구매 취소</option>
									<option value="1"<c:if test="${ostate eq '1' }">selected="seleted"</c:if>>입금 대기중</option>
									<option value="2"<c:if test="${ostate eq '2' }">selected="seleted"</c:if>>입금 완료</option>
									<option value="3"<c:if test="${ostate eq '3' }">selected="seleted"</c:if>>배송중</option>
									<option value="4"<c:if test="${ostate eq '4' }">selected="seleted"</c:if>>배송 완료</option>
									<option value="5"<c:if test="${ostate eq '5' }">selected="seleted"</c:if>>구매 확정</option>
									<option value="5"<c:if test="${ostate eq '6' }">selected="seleted"</c:if>>리뷰 완료</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="2" style="text-align=center; display:none" colspan="3">
							<form action="orderSelectOdate.do" autocomplete="off">
							<input type="text" name="datepicker" id="datepicker" value="${datepicker }" placeholder="시작날짜" required="required">
							<script>
								$(function () {
									$("#datepicker").datepicker();
								});
								$.datepicker.setDefaults({
								    dateFormat: 'yy-mm-dd' //Input Display Format 변경
								});
							</script>
							~ <input type="text" name="datepicker2" id="datepicker2" value="${datepicker2 }"placeholder="끝날짜" required="required">
							<script>
								$(function () {
									$("#datepicker2").datepicker();
								});
							</script>
							<input type="submit" value="검색">
							</form>
							</td>
						</tr>
						<tr>
							<td class="3" style="text-align=center;" colspan="3">
								<form action="orderSelectProduct.do" name="frm" onsubmit="return chk()">
								<input type="text" name="pid" value="${pid }" placeholder="상품번호로 검색" required="required">
								<input type="submit" value="검색">
								</form>
							</td>
						</tr>
					</table>
					<table id="search_table">
						<tr>
							<th>주문일</th>
							<th>주문번호</th>
							<th>주문자명</th>
							<th>주문금액</th>
							<th>주문상태</th>
						</tr>
						<c:forEach var="order" items="${orderlist }">
							<tr>
								<td><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${order.odate }" /></td>
								<td><a href="orderSelectInfo.do?oid=${order.oid }&pid=${pid}"> <fmt:formatDate pattern="yyyyMMdd" value="${order.odate }"/>
										-<fmt:formatNumber value="${order.oid }" pattern="00000"/></a></td>
								<td>${order.sname }</td>
								<td><fmt:formatNumber value="${order.oamount }" pattern="#,###"/></td>
								<td><c:choose>
									<c:when test="${order.ostate eq '0' }">구매 취소 </c:when>
										<c:when test="${order.ostate eq '1' }">입금 대기중 </c:when>
										<c:when test="${order.ostate eq '2' }">입금 완료 </c:when>
										<c:when test="${order.ostate eq '3' }">배송중 </c:when>
										<c:when test="${order.ostate eq '4' }">배송 완료</c:when>
										<c:when test="${order.ostate eq '5' }">구매확정</c:when>
										<c:when test="${order.ostate eq '6' }">리뷰 완료</c:when>
								</c:choose></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
</body>
</html>