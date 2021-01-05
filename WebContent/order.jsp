<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/cartnbuy.css?ver=1"> 
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=2">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<style type="text/css">
	

</style>
<script type="text/javascript">
function showHide1(){
    if(document.getElementById("showHide1").style.display =='none'){
        document.getElementById("showHide1").style.display ='block';
    }
    else{
        document.getElementById("showHide1").style.display ='none';
    }
}
function showHide2(){
    if(document.getElementById("showHide2").style.display =='none'){
        document.getElementById("showHide2").style.display ='block';
    }
    else{
        document.getElementById("showHide2").style.display ='none';
    }
}
function showHide3(){
    if(document.getElementById("showHide3").style.display =='none'){
        document.getElementById("showHide3").style.display ='block';
    }
    else{
        document.getElementById("showHide3").style.display ='none';
    }
}

</script>
</head>

<body>


<header>
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
<div class="main">
<div style="height: 17.33px;">
<div class="nav_button"><a href="aboutUs.do">ABOUT US</a></div>
<div class="nav_button"><a href="shoppingMain.do">SHOPPING</a></div>
<div class="nav_button"><a href="board.do?type=notice">BOARD</a></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">

</header>
<div class="main">
	<div class="aa">
		<span class="step1" style="color : #848484;"><h2>장바구니</h2></span>
		<span class="step2" ><h2>주문결제</h2></span>
		<span class="step3" style="color : #848484;"><h2>결제완료</h2></span>
	</div>
</div>	

<div class="main">
<div class="bb">
	<div>
<!--주문자정보입력       -->
	<div>
		<br>
<!-- 전체입력값 form 으로 보내기 -->
<form action="orderResult.do" method="post" >
		<br>
		<div style="font-size: 20px;margin-left: 20px; margin-bottom: 10px " >주문리스트확인</div>
		<table class="info">
		<thead>
		<tr class="cart_tr" >
			<th class="cart_td" >상품코드</th>
			<th class="cart_td">상품명</th>
			<th class="cart_td">옵션</th>
			<th class="cart_td">판매가격</th>
			<th class="cart_td">수량</th>
			<th class="cart_td">주문금액</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
				<c:when test="${list == null }">
					<tr class="cart_tr">
						<td colspan="6" style="text-align: center;"><h4>장바구니에 담기 상품이 없습니다</h4></td>
					</tr>
				</c:when>
				
			<c:otherwise>
				<c:if test=""></c:if>
				<c:forEach var="arr" items="${list }">
 				<tr value="${list}" class="cart_tr" >
					<td class="cart_td"><h4>${arr.pid}</h4></td>
					<td class="cart_td"><h4>${arr.pname}</h4></td>
					<td class="cart_td"><h4>${arr.cwoption}</h4></td>
					<td class="cart_td"><fmt:formatNumber value="${arr.pprice }"  pattern="#,###"></fmt:formatNumber></td>
					<td class="cart_td"><fmt:formatNumber value="${arr.cwqty}" pattern="#,###"></fmt:formatNumber></td>
					<td class="cart_td" ><fmt:formatNumber value="${arr.pprice*arr.cwqty}" pattern="#,###"></fmt:formatNumber></td>
					<input type="hidden" name="cwid" value="${arr.cwid }">
				</tr>
				</c:forEach>
				<tr class="info_tr">
					<td align="right" colspan="5">상품 총 금액</td>
					<td align="center"><fmt:formatNumber value="${sum}" pattern="#,###"></fmt:formatNumber>원</td>
				</tr>
				
			</c:otherwise>
		</c:choose>
		</tbody>
		</table>
		<div style="font-size: 20px;margin-left: 20px; margin-bottom: 10px " >주문자정보입력</div>
		<table class="info" >
			<tr class="info_tr" >
				<td align="center">주문고객</td><td><input class="input_info" type="text" name="buyerName" value="${user.sname }" required="required"/></td>
			</tr>
			<tr class="info_tr">
				<td rowspan="2" align="center">주소</td>
				<td><input class="input_info" type="text" name="buyerPost" value="${user.spost }" required="required" size="4"/><input type="button" name="post" value="우편주소확인" onclick=""></td>
			<tr class="info_tr">
				<td><input class="input_info" type="text" name="buyerAddress" value="${user.saddress }" required="required"/></td>
			</tr></tr>
		
			<tr class="info_tr" height="20px" >
				<td align="center">연락처</td>
				<td>
					<input type="text" name="buyerTel" value="${user.scontact }"  class="input_info" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
				
				</td>
			</tr>
			<tr class="info_tr">
				<td align="center" >이메일</td><td><input class="input_info" type="email" value="${useremail }" required="required"/></td>
			</tr>
		</table>
		<div>
<!--할인정보        -->
		<div style="font-size: 20px; margin-left: 20px; margin-bottom: 10px " >할인정보</div>
		<div>
		<table class="info">
			<tr class="info_tr">
				<td align="center">쿠폰</td>
				<td>
				<select name="select" style="width: 350px;">
					<c:if test="${cou !=null }">
						<c:forEach var="cou" items="${cu}">
							<option value="${cou.GetCid()}">${cou.getCid()}</option>	
						</c:forEach>
					</c:if>
						<c:if test="${cou == null }">
							<option value="${cou.cid}">해당하는 쿠폰이 없음</option>
						</c:if>
				</select>
				</td>
				
			</tr>
			<tr class="info_tr">
				<td>포인트</td>
				<td><input class="input_info" type="text"></td>
			</tr>
		</table>
		</div>
<!--결제내역      -->
		
		<div style="font-size: 20px; margin-left: 20px; margin-bottom: 10px " >결제금액</div>
		<div>
		<table class="info">
			<tr  class="info_tr">
				<td align="center">총상품금액</td>
				<td align="center"><fmt:formatNumber value="${sum }" pattern="#,###"></fmt:formatNumber>원</td>
				
			</tr>
			<tr  class="info_tr">
				<td align="center">배송비</td>
				<c:if test="${sum >= 30000 }">
					<td align="center">0원</td>
				</c:if>
				<c:if test="${sum < 30000 }">
					<td align="center">3,000원</td>
				</c:if>
				
			</tr>
			<tr  class="info_tr">
				<td align="center">쿠폰사용</td>
				<td align="center"><input type="text" value="0" >원</td>
			</tr>
			<tr  class="info_tr">
<!-- 쿠폰적용값 나중에 하기 -->
				<td align="center">최종결제금액</td>
				<td align="center"><fmt:formatNumber value="${sum }" pattern="#,###"></fmt:formatNumber>원</td>
			</tr>
		</table>
		</div>
<!--결제 수단            -->
		<div style="font-size: 20px; margin-left: 20px; margin-bottom: 10px " >결제수단</div>
		<div>
       		 <span><input type="button" id="cardb" class="pay_way" value="신용카드" onclick="showHide1()" ></span>
      		 <span><input type="button" id="cardb" class="pay_way" value="무통장" onclick="showHide2()" ></span>
      		 <span><input type="button" id="cardb" class="pay_way" value="핸드폰결제" onclick="showHide3()" ></span>
		</div>
		<div>
			<h4>유의사항</h4>
			<p> 신용카드 결제 시 화면 아래 '결제하기'버튼을 클릭하시면 신용카드 결제 창이 나타납니다.
			<p> 신용카드 결제 창을 통해 입력되는 고객님의 카드 정보는 128bit로 안전하게 암호화되어 전송되며,
			 승인 처리 후 카드 정보는 승인 성공 / 실패 여부에 상관없이 자동으로 폐기되므로, 안전합니다.
		</div>
		<br>
		<br>
<!--신용카드            -->
    <div id="showHide1" align="middle" style="display: none;">
		<div>
		<div  style="font-size: 20px; margin-left: 20px; margin-bottom: 10px; " >신용카드</div>
		<table class="info" name="credit_tb">
			<tr  class="info_tr">
			<td>카드사</td>
			<td>
				<select name="credit_chk" style="width: 350px;">
					<option name="credit1">국민카드</option>
					<option name="credit2">신한카드</option>
					<option name="credit3">농협카드</option>
					<option name="credit4">우리카드</option>
				</select>
			</td>
			</tr>
			<tr  class="info_tr">
				<td>카드번호</td>
				<td><input type="text" class="input_info" name="creditNum"></td>
			</tr>
			<tr  class="info_tr">
				<td>비밀번호</td>
				<td><input type="text" class="input_info" name="creditPass" ></td>
			</tr>
		</table>
		</div>
    </div>

     <div id="showHide2" align="middle" style="display: none;">
    	<div style="font-size: 20px; margin-left: 20px; margin-bottom: 10px; " >무통장입금</div>
		<div >
		<table  class="info" name="bank_tb" >
			<tr  class="info_tr">
			<td>은행</td>
			<td>
				<select name="bank" style="width: 350px;">
					<option>국민은행</option>
					<option>신한은행</option>
					<option>농협은행</option>
					<option>우리은행</option>
				</select>
			</td>
			</tr>
			<tr  class="info_tr">
				<td>계좌번호</td>
				<td><input type="text" class="input_info" name="backNum" ></td>
			</tr>
		</table>
		</div>
		</div>
    </div>

   
    </div>
		
 		</div>
 		<div>
<!--결제할래??       -->
			<span><input type="button" class="pay" id="cancel" value="이전페이지" onclick="location.href='cart.do'" ></span>
			<span><input type="submit" class="pay" id="pay" value="결제하기" ></span>
		
		</div>


</form>

<br>
</div>
</div>

</body>
</html>