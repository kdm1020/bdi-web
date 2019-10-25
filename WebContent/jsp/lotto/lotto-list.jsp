<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<table border="1">
<tr>
<th>시퀀스</th>
<th>1번째 행운의 숫자</th>
<th>2번째 행운의 숫자</th>
<th>3번째 행운의 숫자</th>
<th>4번째 행운의 숫자</th>
<th>5번째 행운의 숫자</th>
<th>6번째 행운의 숫자</th>

</tr>
<%
		String sql = " select * from lotto ";
		

		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
	%>
<tr>
<td><%=rs.getString("seq") %></td>
<td><%=rs.getString("num1") %></td>
<td><%=rs.getString("num2") %></td>
<td><%=rs.getString("num3") %></td>
<td><%=rs.getString("num4") %></td>
<td><%=rs.getString("num5") %></td>
<td><%=rs.getString("num6") %></td>

</tr>
<%
		}
	%>

</table>
<a href="/bdi-web/jsp/lotto/lotto.jsp"><button>번호 생성</button></a>
	
	

</body>
</html>