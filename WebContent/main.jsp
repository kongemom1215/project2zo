<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YCSS.css?ver=1">
</head>
<body class="body">

<div style="height: 100px;">
<input type="button" class="main_logo" onclick="location.href='main.do'">
<c:choose>
<c:when test="${seesion_login_num eq '3' }">
<input type="button" value="위시리스트" class="top"></input>
<input type="button" value="장바구니" class="top"></input>
<input type="button" value="주문/배송" class="top"></input>
<input type="button" value="마이페이지" class="top"></input>
<input type="button" value="로그아웃" class="top"></input>
<c:forEach var="shoppingUser" items="${session_shoppingUser_semail }">
<input type="button" value="${shoppingUser.sname }" class="top"></input>
</c:forEach>
</c:when>
<c:otherwise>
<input type="button" value="위시리스트" class="top"></input>
<input type="button" value="장바구니" class="top"></input>
<input type="button" value="주문/배송" class="top"></input>
<input type="button" value="마이페이지" class="top"></input>
<input type="button" value="로그인/회원가입" class="top" onclick="location.href='loginForm.do?'"></input>
</c:otherwise>
</c:choose>
<hr class="top_hr">
</div>
<div style="height: 25px;">
<input type="submit" class="menu" value="ABOUT US">
<input type="button" class="menu" value="SHOPPING">
<input type="submit" class="menu" value="BOARD">
</div>
<div>
<div class="search_box1" style="height: 50px;" >
무엇을 찾으시나요? (상품코드, 상품명, 초성 등)
</div>
</div>
<div style="height: 130px;">
<div class="search_box2" style="height: 100px;">
</div>
<div class="search_main">
</div>
<input type="submit" class="search" value="">
<input type="text" class="search">
</div>
<div style="height: 50px;">
Bye-rus 인기 상품
<hr>


</div>

<div style="height: 265px;">
<c:forEach var="main_img" items="${main_img }">
<div class="main_item">
${main_img.pname }
</div>
</c:forEach>
</div>

<div style="height: 40px; margin-top: 20px">
코로나 LIVE
<hr>
</div>



<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="js/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="css/billboard.css">

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

<div id="splineChart"></div>

</body>
</html>