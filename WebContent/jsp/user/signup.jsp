<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/bdi-web/jsp/user/signup_ok.jsp">
		<table border="1">
			<tr>
				<th>아 이 디</th>
				<td><input type="text" name="ui_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="ui_pwd"></td>
			</tr>
			<tr>
				<th>이 름</th>
				<td><input type="text" name="ui_name"></td>
			</tr>
			<tr>
				<th>나 이</th>
				<td><input type="number" name="ui_age"></td>
			</tr>
			<tr>
				<th>하고싶은말</th>
				<td><textarea name="ui_etc"></textarea></td>
			</tr>
			<tr>
				<th>hobby</th>
				<td>
				<input type="checkbox" name="hobby" value="study">공부
				<input type="checkbox" name="hobby" value="game">게임 
				<input type="checkbox" name="hobby" value="movie">영화 
				<input type="checkbox" name="hobby" value="music">음악 
				<input type="checkbox" name="hobby" value="trip">여행
				</td>
			</tr>
			<tr>
				<th colspan="2"><button>가입하기</button></th>
			</tr>
		</table>

	</form>

</body>
</html>