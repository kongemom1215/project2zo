<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 네이버 차트  -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="js/billboard.js"></script>
<link rel="stylesheet" href="css/billboard.css">
<!--  -->
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!--  -->
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS2.css?ver=1">
<style>
    ul,li{list-style:none;}
    .slide{height:350px;overflow:hidden;}
    .slide ul{width:calc(100% * 3);display:flex;animation:slide 12s infinite;} /* slide를 12초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 3);height:300px;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
  </style>
</head>
<body class="body">
<div style="height: 15px;">
</div>
<div class="top_div">
<input type="button" class="top_div_logo" onclick="location.href='main.do'">

<c:choose>
	<c:when test="${seesion_login_num eq '3' }">
		<input type="button" value="위시리스트" class="top_div_button"></input>
		<input type="button" value="장바구니" class="top_div_button"></input>
		<input type="button" value="주문/배송" class="top_div_button"></input>
		<input type="button" value="마이페이지" class="top_div_button"></input>
		<input type="button" value="로그아웃" class="top_div_button" onclick="location.href='logoutAction.do'"></input>
			<c:forEach var="shoppingUser"
				items="${session_shoppingUser_semail }">
			<input type="button" value="${shoppingUser.sname }" class="top"></input>
			</c:forEach>
	</c:when>
	<c:otherwise>
		<input type="button" value="관리자페이지" class="top_div_button" onclick="location.href='adminPage.do'"></input>
		<input type="button" value="위시리스트" class="top_div_button"></input>
		<input type="button" value="장바구니" class="top_div_button"></input>
		<input type="button" value="주문/배송" class="top_div_button"></input>
		<input type="button" value="마이페이지" class="top_div_button"></input>
		<input type="button" value="로그인/회원가입" class="top_div_button" onclick="location.href='loginForm.do'"></input>
	</c:otherwise>
</c:choose>

</div>
<hr class="main_hr" style="margin-bottom: 8px; margin-top: 8px;">
<div class="menu_div">
<div class="menu_div_in_div">
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="ABOUT US"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="SHOPPING" onclick="location.href='shoppingMain.do'"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="BOARD" onclick="location.href='board.do'"></div>
</div>
</div>
<hr class="main_hr" style="margin-bottom: 0px; margin-top: 8px; border-bottom: 0px;">
<div class="search_box">
<div class="search_box_in_div">
<div class="search_box_in_div_ment">
무엇을 찾으시나요? (상품코드, 상품명, 초성 등)
</div>
<div style="height: 20px;">
</div>
<div style="height: 42px;">
<form action="search.do">
<input type="button" class="search_box_in_div_text_side" disabled="disabled">
<input type="text" name="search_text" class="search_box_in_div_text_main">
<input type="submit" class="search_box_in_div_button" value="">
</form>
</div>
</div>
</div>
<hr class="main_hr" style="margin-top: 0px;">
<div class="best_ment">
Bye-rus 인기 상품
</div>
<hr class="main_hr">
<div class="main_img_div">
<div class="main_img_div_in_div">
<div class="slide">
    <ul>
     	<c:forEach var="main_img" items="${main_img }">
		<li style="text-align: center;">
		<input type="button" class="main_img" style="background: url('${main_img.pthumbimg}'); background-size: 250px;">
		${main_img.pname }
		</li>
		</c:forEach>
    </ul>
  </div>
</div>
</div>
<hr class="main_hr">
<div class="coivd_ment">
코로나 LIVE
</div>
<hr class="main_hr">
<div class="covid_div">
<div class="covid_guidance">
<table style="width: 100%" class="covid_table">
	<tr>
		<td>확진환자</td>
		<td>검사중</td>
		<td>격리해제</td>
		<td>사망자</td>
	</tr>
	<tr>
		<td><fmt:formatNumber value="${confirmed }" pattern="#,###" /></td>
		<td><fmt:formatNumber value="${check }" pattern="#,###" /></td>
		<td><fmt:formatNumber value="${clear }" pattern="#,###" /></td>
		<td><fmt:formatNumber value="${death }" pattern="#,###" /></td>
	</tr>
	<tr>
		<td>
		<c:if test="${confirmed_oneday > 0 }">
		△ <fmt:formatNumber value="${confirmed_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${confirmed_oneday == 0 }">
		- <fmt:formatNumber value="${confirmed_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${confirmed_oneday < 0 }">
		▽ <fmt:formatNumber value="${confirmed_oneday }" pattern="#,###" />
		</c:if>
		</td>
		<td>
		<c:if test="${check_oneday > 0 }">
		△ <fmt:formatNumber value="${check_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${check_oneday == 0 }">
		- <fmt:formatNumber value="${check_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${check_oneday < 0 }">
		▽ <fmt:formatNumber value="${check_oneday }" pattern="#,###" />
		</c:if>
		</td>
		<td>
		<c:if test="${clear_oneday > 0 }">
		△ <fmt:formatNumber value="${clear_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${clear_oneday == 0 }">
		- <fmt:formatNumber value="${clear_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${clear_oneday < 0 }">
		▽ <fmt:formatNumber value="${clear_oneday }" pattern="#,###" />
		</c:if>
		</td>
		<td>
		<c:if test="${death_oneday > 0 }">
		△ <fmt:formatNumber value="${death_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${death_oneday == 0 }">
		- <fmt:formatNumber value="${death_oneday }" pattern="#,###" />
		</c:if>
		<c:if test="${death_oneday < 0 }">
		▽ <fmt:formatNumber value="${death_oneday }" pattern="#,###" />
		</c:if>
		</td>
	</tr>
	<tr>
	<td colspan="4">
	<br>
	업데이트 시간<br>
	${day }
	</td>
	</tr>
</table>
</div>
<div class="covid_chart">
<div id="xAxisTickCount"></div>
<script type="text/javascript">
var chart = bb.generate({
	  data: {
	    x: "x",
	    columns: [
		["x", 	"${date_first_time_format2}", 
				"${calendar_1_7_format2}", 
				"${calendar_2_7_format2}", 
				"${calendar_3_7_format2}", 
				"${calendar_4_7_format2}", 
				"${calendar_5_7_format2}", 
				"${calendar_6_7_format2}", 
				"${now_time_format2}"], 
		["확진자", 	${confirmed_date_first_time},
					${confirmed_covid_calendar_1_7}, 
					${confirmed_covid_calendar_2_7}, 
					${confirmed_covid_calendar_3_7},
					${confirmed_covid_calendar_4_7}, 
					${confirmed_covid_calendar_5_7}, 
					${confirmed_covid_calendar_6_7},
					${confirmed}],
		["격리해제", 	${clear_date_first_time},
						${clear_covid_calendar_1_7}, 
						${clear_covid_calendar_2_7}, 
						${clear_covid_calendar_3_7}, 
						${clear_covid_calendar_4_7},
						${clear_covid_calendar_5_7}, 
						${clear_covid_calendar_6_7}, 
						${clear}],
	    ],
	    type: "spline", // for ESM specify as: line()
	  },
	  axis: {
	    x: {
	      type: "timeseries",
	      tick: {
	        count: 8,
	        format: "%Y-%m-%d"
	      }
	    }
	  },
	  bindto: "#xAxisTickCount"
	});
</script>
</div>
</div>
<div class="foot_1">
</div>
<div class="foot_2">
<div class="foot_3">
<div style="float: left;">
<input class="foot_button" type="button" value="이용약관">
<input class="foot_button" type="button" value="개인정보처리방침">
<input class="foot_button" type="button" value="입점문의">
</div>
<div style="float: right;" >
대표 : 임주혜 / 사업자등록번호 : 123-45-67899
</div>
</div>
</div>
</body>
</html>