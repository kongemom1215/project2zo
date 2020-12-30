<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
function chk() {
	var p1 = document.getElementById("p1");
	p1.innerHTML="대박 ~ <b>왜불러</b> 배불러";
}
</script>
<body>

이메일 : <input type="email" name="semail" required="required"> <p>
이름 : <input type="text" name="sname" required="required"> <p>
비밀번호 : <input type="password" name="pswd" required="required"> <p>
비밀번호 확인 : <input type="password" name="pswd" required="required"> <p>
연락처 : <input type="number" name="contact1"> - <input type="number" name="contact2"> - <input type="number" name="contact3"> <p>
생년월일 : <input type="number">
</body>
</html>