<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String sql = " select to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24miss') from dual";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

%>
<form method="post" action="/bdi-web/jsp/board/board-complete.jsp">
<table border="1">
<tr>
<th>제목</th>
<th><input type ="text" name="bi_title"></th>
</tr>
<tr>
<th>작성자</th>
<th><input type ="text" name="bi_user"></th>
</tr>
<tr>
<th>내용</th>
<td><textarea name="bi_content"></textarea></td>
</tr>
<tr>
<th colspan="2"><button>작성완료</button></th>
</table>

</form>
</body>
</html>