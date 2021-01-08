<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/productinsert.css?ver=10">
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

.spinner1
{
    list-style: none;
    display: inline-block;
    line-height: 0;
    vertical-align: middle;
    padding:0;
    margin:0;
}
.spinner1 input
{            
	font-size: .45em;
    border-width: .5px;
    height: 1.5em;
    width: 2em;
    padding:0;
    margin:0;
}
.spinner2
{
    list-style: none;
    display: inline-block;
    line-height: 0;
    vertical-align: middle;
    padding:0;
    margin:0;
}
.spinner2 input
{            
	font-size: .45em;
    border-width: .5px;
    height: 1.5em;
    width: 2em;
    padding:0;
    margin:0;
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
	function upNdown(spinnerId, up) {
        document.getElementById(spinnerId).value = up ? 
       	parseInt(document.getElementById(spinnerId).value) + 1 : 
       	parseInt(document.getElementById(spinnerId).value) - 1;
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
					<input type="button" value="● 상품 검색" class="button" onclick="location.href='productAdminPage.do'" ></input><br>
					<input type="button" value="● 상품 추가" class="button" style="color:#00B9FF; font-weight:bold;" onclick="location.href='productInsert.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="insert_content">
			<div id="insert_content2">
				<form action="productInsertPro.do" method="post" enctype="Multipart/form-data">
					<table>
						<tr>
							<td>상품 종류</td>
							<td><select name="ptype">
										<option value="sodok">소독</option>
										<option value="mask">마스크</option>
										<option value="alco">알코올</option>
										<option value="sejung">세정</option>
										<option value="bangdok">방독</option>
										<option value="cheon">체온</option>
										<option value="home">재택용품</option>
										<option value="etc">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>상품 이름</td>
							<td><input type="text" name="pname" required="required">
						</tr>
						<tr>
							<td>상품 가격</td>
							<td><input type="text" name="pprice" required="required">
						</tr>
						<tr>
							<td>상품재고</td>
							<td><input id="spinner1" type="text" name="pinventory" value="0" maxlength="5" size="5"/>
    							<ul class="spinner1">
     							   <li>
        						   <input type="button" value="&#9650;" onclick="upNdown('spinner1', true)" />
     							   </li>
     							   <li>
     						       <input type="button" value="&#9660;" onclick="upNdown('spinner1', false)" />
       								</li>
    							</ul> 개
    						</td>
						</tr>
						<tr>
							<td>썸네일 이미지</td>
							<td><input type="file" name="pthumbimg" required="required"></td>
						</tr>
						<tr>
							<td>상세 이미지1</td>
							<td><input type="file" name="col1" multiple="multiple" required="required"></td>
						</tr>
						<tr>
							<td>상세 이미지2</td>
							<td><input type="file" name="col2" multiple="multiple"></td>
						</tr>
						<tr>
							<td>상세 이미지3</td>
							<td><input type="file" name="col3" multiple="multiple"></td>
						</tr>
						<tr>
							<td>할인율</td>
							<td><input id="spinner2" type="text" name="pdiscount" value="0" pattern="[0-99]" maxlength="2" size="1"/>
    							<ul class="spinner2">
     							   <li>
        						   <input type="button" value="&#9650;" onclick="upNdown('spinner2', true)" />
     							   </li>
     							   <li>
     						       <input type="button" value="&#9660;" onclick="upNdown('spinner2', false)" />
       								</li>
    							</ul> %
    						</td>
						</tr>
						<tr>
							<td>공개여부</td>
							<td><input type="radio" name="ppublic" value="0" required>비공개
								<input type="radio" name="ppublic" value="1">공개
							</td>
						</tr>
						<tr>
							<td>옵션</td>
							<td><input type="text" name="poption"> 옵션은 ,로 나눠주세요</td>
						</tr>
						<tr>
							<td><input type="submit" value="등록" class="button2"></td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>