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
	니가 삭제할 영화번호 :
	<%=request.getParameter("mi_num")%>

	<%
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement();
		String sql;
		String str = request.getParameter("mi_num");
		sql = " delete from movie_info where mi_num = " + str;
		
		out.println(sql);
		
		int result = stmt.executeUpdate(sql);
		if(result==1){
			out.println("정상적으로 영화 정보가 삭제되었습니다.");
		}else{
			out.println("이유는 모르겠지만 잘 못 등록되었습니다.");
		}
		con.commit();
	%>
	<br>
	<a href="/bdi-web/jsp/movie/movie-list.jsp"><button>리스트로 돌아가기</button></a>
	
</body>
</html>