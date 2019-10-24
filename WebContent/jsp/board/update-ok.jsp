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
String biNum = request.getParameter("bi_num");
String biUser = request.getParameter("bi_user");
String biTitle = request.getParameter("bi_title");
String biContent = request.getParameter("bi_content");
String sql = " update board_info ";
sql +=" set bi_title=?,";
sql +=" bi_user=?,";
sql +=" bi_content=?,";
sql +=" bi_moddat=to_char(sysdate,'yyyymmdd'),";
sql +=" bi_modtim=to_char(sysdate,'hh24miss')";
sql +=" where bi_num=? ";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,biTitle);
ps.setString(2,biUser);
ps.setString(3,biContent);
ps.setString(4,biNum);


int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 수정이 완료 되었습니다.");
	con.commit();
}else{
	out.println("수정이 정삭적으로 처리되지 않았습니다.");
}
%>
<a href="/bdi-web/jsp/board/board-list.jsp"><button>리스트로 돌아가기</button></a>

</body>
</html>