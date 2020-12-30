<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="productAdd.do">
상품명 : <input type="text" name="pname" required="required"> <p>
상품종류 : <input type="text" name="ptype" required="required"> <p>
가격 : <input type="number" name="pprice" required="required"> <p>
재고 : <input type="number" name="pinventory" required="required"> <p>
옵션 : <input type="text" name="poption" required="required"> <p>
<input type="submit" value="입력">
</form>

</body>
</html>