<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/YoungCSS.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/memberInsert.css?ver=2"/>
<script type="text/javascript">
	function id_contain(){
		if(document.fr.semail1.value =="" || document.fr.semail1.value.length < 0){
			alert("이메일을 먼저 입력해주세요");
			document.fr.semail1.focus();
		}
		else{
			if(document.all("semail2").readOnly==true){
				//location.href="idCheck.do?semail1=${semail1}&semail2=${semail2}";
				var url="idCheck.jsp";
				var semail=document.fr.semail1.value+"@"+document.fr.semail2.value;
				url=url+"?semail="+semail;
				window.open(url, "get", "height = 180, width = 300");
			}
			else{
				if(fr.semail2.value!=""){
					var url="idCheck.jsp";
					var semail=document.fr.semail1.value+"@"+document.fr.semail2.value;
					url=url+"?semail="+semail;
					window.open(url, "get", "height = 180, width = 300");
				}
				else{	
					alert("이메일 주소 선택해주세요");
					document.fr.semail2.focus();
				}
			}	
		}
			
	}
	function SetEmailTail(emailValue) {
		  var email = document.all("semail1")    // 사용자 입력
		  var emailTail = document.all("semail2") // Select box
		  
		  if ( emailValue == "selfInput" ) {
		   emailTail.readOnly = false;
		   emailTail.value = "";
		   emailTail.focus();
		  } 
		  else {
		   emailTail.readOnly = true;
		   emailTail.value = emailValue;
		  }
	}
	
	function chk(){
		if(document.fr.confirm.value==0){
			alert("아이디 중복 체크해주세요");
			return false;
		}
		else
			return true;
	}
</script>
</head>
<body>
	<!--로고 및 로그인 메뉴  -->
	<div class="main">
<div style="margin-top: 15px;">
<a href="main.do"><img src="./img/Logo.png"></a>

<c:choose>
<c:when test="${session_stype eq '1'}">
<a class="top_button">위시리스트</a>
<a class="top_button">장바구니</a>
<a class="top_button">주문/배송</a>
<a class="top_button">마이페이지</a>
<a href="main.do?logout=logout" class="top_button">로그아웃</a>
<a class="top_button">${session_sname } 님</a>
</c:when>
<c:when test="${session_stype eq '0'}">
<a href="main.do?logout=logout" class="top_button">로그아웃</a>
<a class="top_button">${session_sname } 님</a>
<a href="adminPage.do" class="top_button">관리페이지</a>
</c:when>
<c:otherwise>
<a class="top_button">위시리스트</a>
<a class="top_button">장바구니</a>
<a class="top_button">주문/배송</a>
<a class="top_button">마이페이지</a>
<a href="login.do" class="top_button">로그인/회원가입</a>
</c:otherwise>
</c:choose>
</div>
</div>
<hr>
	<!--관리자메뉴  -->
	<div class="main">
	<div style="height: 17.33px;">
	<div class="nav_button" style="height: 10px;"><a></a></div>
	<div class="nav_button"><a href="adminPage.do">ADMINISTRATOR SERVICE</a></div>
	<div class="nav_button" style="height: 10px;"><a></a></div>
	</div>
	</div>
	<hr>
	<div class="main" style="width: 1100px;">
		<div id="sidebar">
			<img src="./img/admin_member.JPG" id="img1">
			<h2 class="memberMenu">회원 관리</h2>
			<div class="memberMenuButton">
				<form>
					<input type="button" value="● 회원 정보 조회" class="button" onclick="location.href='memberAdminPage.do'" ></input><br>
					<input type="button" value="● 회원 추가" class="button" style="color:#00B9FF; font-weight:bold;" onclick="location.href='memberInsert.do'"></input>
				</form>
			</div>
		</div>
		<div id="content">
			<div id="insert_content">
				<div id="insert_content2">
					<form name="fr" action="memberInsertPro.do" method="post"  onsubmit="return chk()">
						<input type="hidden" id="confirm">
						<table class="insert_table" style="background-color: white;">
							<tr>
								<th colspan="2">회원 등록하기</th>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="sname" required="required"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="semail1" required="required" size=5 maxlength=20>
										@
									<input type="text" name="semail2" value="" ReadOnly="true" size=10/>
									<select name="emailCheck"
									onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="selfInput">직접입력</option>
									</select>
								</td>
								<td><input type="button" value="중복체크" onclick="id_contain()" class="button3"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="text" name="spwd" required="required"></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input type="text" name="scontact" required="required"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td> <input type="text" name="spost" required="required"></td>
								<td><input type="button" value="주소검색" class="button3"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td>--</td>
							</tr>
							<tr>
								<td>상세 주소</td>
								<td><input type="text" name="saddress" required="required"></td>
							</tr>
							<tr>
								<td>마켓팅 동의</td>
								<td>
									<input type="radio" name="sagree" value="y"><label for='y'>예</label>
									<input type="radio" name="sagree" value="n"><label for='n'>아니오</label></td>
								<td><input type="button" value="약관보기" onclick="window.open('agree.jsp', 'get', 'height = 200, width = 630')" class="button3"></td>
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