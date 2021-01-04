<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1{font-weight: 900;}
#find{text-align: center; width: 300px; overflow: hidden; position: absolute; right: 50%; top: 30%;}

 	.find{background-color: #00EBFF; display: inline-block; outline: none; cursor: pointer; text-align: center;
	text-decoration: none; padding: .5em 2em .55em; text-shadow: 0 1px 1px rgba(0,0,0,.3); color:white; width:295px;
	border-radius: .5em; box-shadow: 0 1px 2px rgba(0,0,0,.2); border: 0;}
	.find:hover{background-color: #3CCEFF}
	

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
	<h1>아이디 찾기</h1>
	<form action="findEmailPro.do">
		<table>
			<tr><td><input type="text" name="sname" required="required" placeholder="이름" class="sname"></td></tr>
			<tr><td><input type="submit" value="아이디찾기" class="find" ></td></tr>
		</table>
	</form>
</div>
</body>
</html>