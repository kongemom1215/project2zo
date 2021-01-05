<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1{font-weight: 900;}
	#find{text-align: center; width: 300px; overflow: hidden; position: absolute; right: 50%; top: 30%;}
</style>
</head>
<body>
<div style="width: 900px; margin-left: 350px; position: relative;">
<img src="img/Logo.png">
<input type="button" value="위시리스트" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="장바구니" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="주문/배송" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="마이페이지" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="로그아웃" class="top" style="float: right; background-color: white; border: 0px;"></input>
</div>
<hr>
<div style="width: 900px; height: 10px; display: table-cell;  vertical-align: middle; position: relative;">
<div style="width: 900px; margin-left: 350px;">
<div style="position:relative; float: left;"><input type="button" style="width: 300px; background-color: white; border: 0px;" value="ABOUT US"></div>
<div style="position:relative; float: left;"><input type="button" style="width: 300px; background-color: white; border: 0px;" value="SHOPPING"></div>
<div style="position:relative; float: left;"><input type="button" style="width: 300px; background-color: white; border: 0px;" value="BOARD"></div>
</div>
</div>
<hr>

<div id="find">
<h1>계정찾기</h1>
	찾으시는 계정은 ${result }입니다.
	<a href="login.do">로그인하러가기<p></a>
</div>
<div style="height: 340px;">
</div>
<div class="main" style="height: 50px; background-color: #767171; display: table;">
<div style="width: 10px;">
</div>
<div style="display: table-cell; vertical-align: middle; margin-left: 5px;">
대표 : 임주혜 / 사업자등록번호 : 123-45-67899
</div>
<div style="display: table-cell; vertical-align: middle; text-align: right;">
<a>이용약관</a> /
<a>개인정보처리방침</a> /
<a>입점문의</a>
</div>
<div style="width: 10px;">
</div>
</div>
</body>
</html>