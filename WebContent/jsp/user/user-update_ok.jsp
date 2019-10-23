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
String uiNum = request.getParameter("ui_num");
String uiId = request.getParameter("ui_id");
String uiPwd = request.getParameter("ui_pwd");
String uiName = request.getParameter("ui_name");
String uiAge = request.getParameter("ui_age");
String uiEtc = request.getParameter("ui_etc");
String[] hobbies = request.getParameterValues("hobby");
String hobby = "";
for(int i=0;i<hobbies.length;i++){
	hobby += hobbies[i]+",";
}
hobby=hobby.substring(0,hobby.length()-1);

String sql =" update bdi.user_info ";
sql +=" set ui_id=?,";
sql +=" ui_pwd=?,";
sql +=" ui_name=?,";
sql +=" ui_age=?,";
sql +=" ui_etc=?";
sql +=" hobby=?";
sql +=" where ui_num=? ";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,uiId);
ps.setString(2,uiPwd);
ps.setString(3,uiName);
ps.setString(4,uiAge);
ps.setString(5,uiEtc);
ps.setString(6,hobby);
ps.setString(7,uiNum);

int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 수정이 완료 되었습니다.");
	con.commit();
}else{
	out.println("회원수정이 정삭적으로 처리되지 않았습니다.");
}
%>
<a href="/bdi-web/jsp/user/user_list.jsp"><button>회원리스트로 돌아가기</button></a>


</form>
</body>
</html>