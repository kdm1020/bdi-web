<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post"id="loginForm"action="/bdi/jsp/user/login-ok.jsp">
		아 이 디 : <input type="text" name="id" id="id"><br> 비밀번호 :
		<input type="password" name="pwd" id="pwd"><br>
		<button type="button" onclick="login()">로그인</button>
	</form>
	<script>
		function login() {
			var idObj = document.getElementById("id");
			var pwdObj = document.getElementById("pwd");
			var id = idObj.value;
			var pwd = pwdObj.value;

			if (id.length < 5) {
				alert('id는 5글자 이상 입력해야합니다.')
				idObj.value = '';
				idObj.focus();
				return;
			}
			if (pwd.length < 5) {
				alert('비밀번호는 5글자 이상입력해야 합니다.')
				pwdObj.value = '';
				pwdObj.focus();
				return;
			}
			var loginForm = document.getElementById("loginForm");
			loginForm.submit();

		}
	</script>
</body>
</html>