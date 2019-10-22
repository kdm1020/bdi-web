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
String miNum= request.getParameter("mi_num");
String miName= request.getParameter("mi_name");
String miPirce= request.getParameter("mi_pirce");
String miDate= request.getParameter("mi_date");
miDate = miDate.replace("-","");
String miDesc= request.getParameter("mi_desc");
String miAge= request.getParameter("mi_age");
String miStarRate= request.getParameter("mi_star_rate");

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql;
sql = "insert into movie_info(mi_num, mi_name, mi_pirce, mi_date, mi_desc, mi_age,mi_star_rate) ";
sql += "values('"+ miNum +"',";
sql +="'"+ miName + "',";
sql +="'"+ miPirce + "',";
sql +="'"+ miDate + "',";
sql +="'"+ miDesc + "',";
sql +="'"+ miAge + "',";
sql +="'"+ miStarRate + "')";
out.println(sql);

int result = stmt.executeUpdate(sql);
if(result==1){
	out.println("정상적으로 영화 정보가 등록되었습니다.");
}else{
	out.println("이유는 모르겠지만 잘 못 등록되었습니다.");
}

con.commit();

%>

<a href="/bdi-web/jsp/movie/movie-list.jsp"><button>리스트로 돌아가기</button></a>
</body>
</html>