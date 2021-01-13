<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>삭제하려면 암호를 입력하세요</h2>
<form action="reviewDeletePro.do">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="sid" value="${sid }">
	암호 : <input type="text" name="aszfd"><p>
	<input type="submit" value="확인">
</form>
</body>
</html>