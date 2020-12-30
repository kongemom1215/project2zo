<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type="button" value="메인으로" onclick="location.href='main.do'"> <p>

<form action="loginAction.do" method="post">
아이디　 <input type="email" name="semail"> <br>
비밀번호 <input type="password" name="spwd"> <br>
<input type="submit" value="로그인"> <p>

<input type="button" value="회원가입" onclick="location.href='joinForm.do'">
</form>

</body>
</html>