<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/couponAdmin.css?ver=44"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#pushSid").hide();
		$("input[name=usertype]").change(function(){
			var radio_v=$(':radio[name="usertype"]:checked').val();
			if(radio_v=="all")
				$("#pushSid").hide();
			else if(radio_v=="part")
				$("#pushSid").show();
		});
	});
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
	<div id="adminMember" style="width:1100px;">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회" class="button" onclick="location.href='memberAdminPage.do'" ></input><br>
					<input type="button" value="● 회원 추가" class="button" onclick="location.href='memberInsert.do'"></input><br>
					<input type="button" value="● 쿠폰 등록" class="button" style="color:#00B9FF; font-weight:bold;" onclick="location.href='couponAdminPage.do'"></input>
				</form>
			</div>
		</div>
		<div id="couponContent">
			<div id="couponContent2">
				<form action="couponInsert.do" method="post" enctype="Multipart/form-data" autocomplete="off">
				<table id="coupontable">
					<tr>
						<td>회원 종류 : </td>
						<td><input type="radio" name="usertype" id="all" value="all" required><label for='all'>전체 회원</label>
							<input type="radio" name="usertype" id="part" value="part"><label for='part'>특정 회원</label></td>
					</tr>
					<tr id="pushSid">
						<td>회원 번호 : </td>
						<td><input type="text" name="sids" placeholder=",로 회원번호를 구분해주세요."></td>
					</tr>
					<tr>
						<td>쿠폰 할인율 : </td>
						<td><input type="number" name="cdiscount" min="1" max="100" maxlength="3" required="required">%</td>
					</tr>
					<tr>
						<td>날짜 : </td>
						<td><input type="text" name="cstartdate" id="cstartdate" placeholder="시작일자" required="required" size="8">
							<script>
								$(function () {
									$("#cstartdate").datepicker();
								});
								$.datepicker.setDefaults({
								    dateFormat: 'yy-mm-dd' //Input Display Format 변경
								});
							</script>
							~ <input type="text" name="cenddate" id="cenddate" placeholder="만료일자" required="required" size="8">
							<script>
								$(function () {
									$("#cenddate").datepicker();
								});
							</script>
							</td>
					</tr>
					<tr>
						<td>쿠폰 이미지 : </td>
						<td><input type="file" name="couponimg" required="required">
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;"><input type="submit" class="button2" value="쿠폰 등록"></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>