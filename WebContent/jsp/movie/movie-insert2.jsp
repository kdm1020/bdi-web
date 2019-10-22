<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/bdi-web/jsp/movie/movie-insert-ok.jsp">
		<table border="1">
			<tr>
				<th>영화 번호</th>
				<td><input type="number" name="mi_num"></td>
			</tr>
			<tr>
				<th>영화 제목</th>
				<td><input type="text" name="mi_name"></td>
			</tr>
			<tr>
				<th>예매 가격</th>
				<td><input type="number" name="mi_pirce"></td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td><input type="number" name="mi_date"></td>
			</tr>
			<tr>
				<th>영화설명</th>
				<td><textarea name="mi_desc"></textarea></td>
			</tr>
			<tr>
				<th>영화등급</th>
				<td><input type="number" name="mi_age"></td>
			</tr>
			<tr>
				<th>별점</th>
				<td><input type="number" name="mi_star_rate"></td>
			</tr>
		</table>
		<button>저장</button>
	</form>
</body>
</html>