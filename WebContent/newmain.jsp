<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 네이버 차트  -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="js/billboard.js"></script>
<link rel="stylesheet" href="css/billboard.css">
<!--  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS2.css?ver=1">
</head>
<body class="body">
<div class="top_div">
<input type="button" class="top_div_logo" >
<input type="button" value="위시리스트" class="top_div_button"></input>
<input type="button" value="장바구니" class="top_div_button"></input>
<input type="button" value="주문/배송" class="top_div_button"></input>
<input type="button" value="마이페이지" class="top_div_button"></input>
<input type="button" value="로그아웃" class="top_div_button"></input>
</div>
<div>
<hr>
</div>
<div class="menu_div">
<div class="menu_div_in_div">
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="ABOUT US"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="SHOPPING"></div>
<div class="menu_div_in_div_in_div"><input type="button" class="menu_div_in_div_button" value="BOARD"></div>
</div>
</div>
<hr style="margin-bottom: 0px; border-bottom: 0px;">
<div class="search_box">
<div class="search_box_in_div">
<div class="search_box_in_div_ment">
무엇을 찾으시나요? (상품코드, 상품명, 초성 등)
</div>
<div style="height: 20px;">
</div>
<div style="height: 42px;">
<input type="button" class="search_box_in_div_text_side" disabled="disabled">
<input type="text" class="search_box_in_div_text_main">
<input type="button" class="search_box_in_div_button">
</div>
</div>
</div>
<hr style="margin-top: 0px;">
<div class="best_ment">
Bye-rus 인기 상품
</div>
<hr class="hr1">
<div class="main_img_div">
<div class="main_img_div_in_div">
<input type="button" class="main_img">
<input type="button" class="main_img">
<input type="button" style="margin-right: 0px;" class="main_img">
</div>
</div>
<hr class="hr1">
<div class="coivd_ment">
코로나 LIVE
</div>
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
<hr>
</body>
</html>