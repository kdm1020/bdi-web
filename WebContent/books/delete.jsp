<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
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
String bkNum = request.getParameter("bi_num");

Connection con = DBCon.getCon();
String sql;
sql = " delete from books_info where bi_num=? ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bkNum);



int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 게시글이 삭제되었습니다.");
}else{
	out.println("게시글 삭제를 실패했습니다.");
}
con.commit();
%>
<a href="<%=rootPath%>/books/list.jsp"><button>게시판으로 돌아가기</button></a>
</body>
</html>