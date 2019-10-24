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
<%
String biNum = request.getParameter("bi_num");
String sql = " select * from board_info where bi_num= ? ";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,biNum);


ResultSet rs = ps.executeQuery();
if(!rs.next()){
	out.println(biNum + "에 해당하는 게시물은 존재 하지 않습니다.");
}
else{
%>
	<form method="post" action="/bdi-web/jsp/board/update-ok.jsp">
		<table border="1">
			<tr>
				<th>제목</th>
				<th><input type="text" name="bi_title"
					value=<%=rs.getString("bi_title")%>></th>
			</tr>
			<tr>
				<th>작성자</th>
				<th><input type="text" name="bi_user"
					value=<%=rs.getString("bi_user")%>></th>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="bi_content"><%=rs.getString("bi_content")%></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><button>수정</button></th>
		</table>
		작성일<input type="number" name="bi_credat" value="000000"> 작성시간<input
			type="number" name="bi_cretim" value="000000"> 수정일<input
			type="number" name="bi_moddat" value="000000"> 수정시간<input
			type="number" name="bi_modtim" value="000000">
			<input type="hidden"name="bi_num"value="<%=biNum%>">
			
	</form>
	<%
	} 
	%>
</body>
</html>