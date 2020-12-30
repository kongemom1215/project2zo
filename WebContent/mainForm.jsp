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

<input type="button" value="메인으로" onclick="location.href='mainForm.do'"> <p>

<c:forEach var="shoppingUser" items="${session_shoppingUser_semail }">
${shoppingUser.sname } 님 <p> 
</c:forEach>

<c:choose>
<c:when test="${seesion_login_num eq '3' }">
<input type="button" value="로그아웃" onclick="location.href='logoutAction.do'"> <p>
<input type="button" value="마이페이지" onclick="location.href=''"> <p>
<input type="button" value="주문/배송"> <p>
<input type="button" value="장바구니"> <p>
<input type="button" value="주문/배송"> <p>
</c:when>
<c:otherwise>
<input type="button" value="로그인" onclick="location.href='loginForm.do'">
<input type="button" value="회원가입" onclick="location.href='joinForm.do'">
</c:otherwise>
</c:choose>

</body>
</html>