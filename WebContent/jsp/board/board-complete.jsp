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
String biTitle = request.getParameter("bi_title");
String biUser = request.getParameter("bi_user");
String biContent = request.getParameter("bi_content");

Connection con = DBCon.getCon();
String sql;
sql = " insert into board_info(bi_num, bi_title, bi_user, bi_content, ni_credat, bi_cretim, bi_moddat, bi_modtim) ";
sql +=" values(seq_bi_num.nextval,?,?,?,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24miss'),to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24miss')) ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biTitle);
ps.setString(2,biUser);
ps.setString(3,biContent);


int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 게시글이 등록되었습니다.");
}else{
	out.println("게시글 등록이 실패했습니다.");
}
con.commit();
%>
<a href="/bdi-web/jsp/board/board-list.jsp"><button>게시판으로 돌아가기</button></a>
</body>
</html>