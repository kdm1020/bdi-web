<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!
 public String checkStr(String str, String targetStr){
	 String[] strs = str.split(",");
	 for(String s:strs){
		 if(s.equals(targetStr)){
			 return "checked";
		 }
	 }
	 return "";
 }
 %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uiNum = request.getParameter("ui_num");
String sql = "select * from bdi.user_info where ui_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uiNum);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
	out.println(uiNum + "에 해당하는 게시물은 존재 하지 않습니다.");
}
else{
%>
<form method="post" action="/bdi-web/jsp/user/user-update_ok.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td ><%=uiNum%></td>				
			</tr>
			<tr>
				<th>아 이 디</th>
				<td><input type="text"name="ui_id" value=<%=rs.getString("ui_id")%>></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password"name="ui_pwd" value=<%=rs.getString("ui_pwd") %>></td>
			</tr>
			<tr>
				<th>이    름</th>
				<td><input type="text"name="ui_name" value=<%=rs.getString("ui_name") %>></td>
			</tr>
			<tr>
				<th>나    이</th>
				<td><input type="number"name="ui_age" value=<%=rs.getString("ui_age") %>></td>
			</tr>
			<tr>
				<th>하고싶은말</th>
				<td><textarea name="ui_etc"><%=rs.getString("ui_etc") %></textarea></td>				
			</tr>
			<tr>
				<th>취미</th>
				<td>
				<input type="checkbox" name="hobby" value="study" <%=checkStr(rs.getString("hobby"),"study") %>>공부
				<input type="checkbox" name="hobby" value="game" <%=checkStr(rs.getString("hobby"),"game") %>>게임 
				<input type="checkbox" name="hobby" value="movie" <%=checkStr(rs.getString("hobby"),"movie") %>>영화 
				<input type="checkbox" name="hobby" value="music" <%=checkStr(rs.getString("hobby"),"music") %>>음악 
				<input type="checkbox" name="hobby" value="trip" <%=checkStr(rs.getString("hobby"),"trip") %>>여행
				</td>				
			</tr>
			<tr>
			<th colspan="2"><button>수정</button></th>
			</tr>
		</table>
		<input type="hidden"name="ui_num"value="<%=uiNum%>">
		
</form>
<%
}
%>
</body>
</html>