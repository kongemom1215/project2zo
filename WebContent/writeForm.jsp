<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content{text-align: center;}
table{width: 35%;
		  height: 150px;
		  margin: auto;
		  font-weight: bolder;
		  }
.id{background-color: #EAEAEA;}
td{padding: 15px;}
.submit:hover{text-decoration: underline;}
</style>

</head>
<body>
<div style="width: 900px; margin-left: 350px; position: relative;">
<img src="img/Logo.png">
<input type="button" value="위시리스트" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="장바구니" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="주문/배송" class="top" style="float: right; background-color: white; border: 0px;"></input>
<input type="button" value="마이페이지" class="top" style="float: right; background-color: white; border: 0px;"></input>
<c:if test="${stype ==2}">
<input type="button" value="로그인/회원가입" class="top" style="float: right; background-color: white; border: 0px;" onclick="location.href='login.do?stype=${stype}'"></input>
<form>
</c:if>
<c:if test="${stype ==1}">
<input type="button" value="로그아웃" class="top" style="float: right; background-color: white; border: 0px;" onclick="location.href='main.do?stype=${stype}'"></input>
</c:if>
</form>

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
</body>
</html>



<div id="content">
<form action="writePro.do?session_sid=${session_sid}&session_stype=${session_stype}&session_sname=${session_sname}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${qna.sid }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table>
		<caption><h2>게시판 글쓰기</h2></caption>
		<tr><td>제목</td><td class="id">문의드립니다~★</td></tr>
		<tr><td>내용</td><td  class="id"><textarea rows="10" cols="30" name="qcontent"
			required="required"></textarea></td></tr>
			
			<tr><td>파일</td><td><input type="file" name="qfile"></td></tr>
			
			
			<tr><td>카테고리</td><td class="id"><select name="qctg" style="width: 120px; text-align-last:center;">
				<option>상품</option>
				<option>결제</option>
				<option>기타</option>
			</select></td></tr>
		<tr><td colspan="2"><input type="submit" value="글쓰기" style="height:30px; width:100px; cursor: pointer; background-color : white;"
	class="submit">
		</td></tr>
	</table>
</form>
</div>
</body>
</html>