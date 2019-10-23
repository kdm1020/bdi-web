<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
request.setCharacterEncoding("UTF-8");
String[] hobbies = request.getParameterValues("hobby");
String hobby = "";
for(int i=0;i<hobbies.length;i++){
	hobby += hobbies[i]+",";
}
hobby=hobby.substring(0,hobby.length()-1);


String uiId = request.getParameter("ui_id");
String uiPwd = request.getParameter("ui_pwd");
String uiName = request.getParameter("ui_name");
String uiAge = request.getParameter("ui_age");
String uiEtc = request.getParameter("ui_etc");

Connection con = DBCon.getCon();
String sql;
sql = " insert into bdi.user_info(ui_num, ui_id, ui_pwd, ui_name, ui_age, ui_etc, hobby) ";
sql += " values(seq_ui_num.nextval,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiPwd);
ps.setString(3,uiName);
ps.setString(4,uiAge);
ps.setString(5,uiEtc);
ps.setString(6,hobby);

int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 회원 가입이 완료 되었습니다.");
}else{
	out.println("회원가입이 정삭적으로 처리되지 않았습니다.");
}
con.commit();
%>
<a href="/bdi-web/jsp/user/login.jsp"><button>로그인 화면으로 돌아가기</button></a>
</body>
</html>