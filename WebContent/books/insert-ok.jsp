<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/common/first.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); 

String bkTitle = request.getParameter("bk_title");
String bkType = request.getParameter("bk_type");
String bkStar = request.getParameter("bk_star");
String bkCredat = request.getParameter("bk_credat");
String bkDesc = request.getParameter("bk_desc");
Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql;
sql =" insert into books_info(bi_num, bi_image, bi_title, bi_type, bi_star, bi_credat, bi_desc) ";
sql +=" values(seq_books_bi_num.nextval,'/imgs/img.jpg',?,?,?,?,?) ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,bkTitle);
ps.setString(2,bkType);
ps.setString(3,bkStar);
ps.setString(4,bkCredat);
ps.setString(5,bkDesc);
int result = ps.executeUpdate();
if(result==1){
	out.println("정상적으로 등록되었습니다.");
}else{
	out.println("등록에 실패했습니다.");
}

con.commit();
%>
<a href ="<%=rootPath%>/books/list.jsp"><button>리스트로 돌아가기</button></a>
</body>
</html>