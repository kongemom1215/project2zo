<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reviewUpdatePro.do" method="post">
	<input type="hidden" name="sid" value="${review.sid }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table>
		<caption><h2>게시판 수정</h2></caption>
		<tr><td>유저번호</td><td>${review.sid }</td></tr>
		<tr><td>제목</td><td><input type="text" name="rtitle" required="required" placeholder="제목을 입력해주세요."></td></tr>
		<tr><td>내용</td><td><pre><textarea rows="10" cols="40" name="rcontent"
		required="required">${review.rcontent }</textarea></pre></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정완료">
	</table>
</form>
</body>
</html>