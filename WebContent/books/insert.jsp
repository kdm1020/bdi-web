<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection con = DBCon.getCon();
		String sql = " select * from books_type order by bt_num";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	%>
	<form method="post" action="<%=rootPath%>/books/insert-ok.jsp">
		<table border="1">
			<tr>
				<th>제목</th>
				<th><input type="text" name="bk_title"></th>
			</tr>
			<tr>
				<th>종류</th>
				<td><select name="bk_type">
						<%
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("bt_num")%>"><%=rs.getString("bt_name")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th>별점</th>
				<th><input type="number" name="bk_star"></th>
			</tr>
			<tr>
				<th>출시일</th>
				<th><input type="number" name="bk_credat"></th>
			</tr>
			<tr>
				<th>책소개</th>
				<th><textarea name="bk_desc"></textarea></th>
			</tr>
			<tr>
				<th colspan="2"><button>작성완료</button>
			</tr>


		</table>


	</form>
</body>
</html>