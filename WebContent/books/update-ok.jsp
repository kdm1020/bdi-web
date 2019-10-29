<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/first.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String bkNum = request.getParameter("bk_num");
		String bkTitle = request.getParameter("bk_title");
		String bkType = request.getParameter("bk_type");
		String bkCredat = request.getParameter("bk_credat");
		String bkStar = request.getParameter("bk_star");
		String bkDesc = request.getParameter("bk_desc");
		String sql = " update books_info ";
		sql += " set bi_title=?,";
		sql += " bi_type=?,";	
		sql += " bi_star=?,";
		sql += " bi_credat=?,";
		sql += " bi_desc=?";
		sql += " where bi_num=? ";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bkTitle);
		ps.setString(2, bkType);
		ps.setString(3, bkStar);
		ps.setString(4, bkCredat);
		ps.setString(5, bkDesc);
		ps.setString(6, bkNum);

		int result = ps.executeUpdate();
		if (result == 1) {
			out.println("수정 완료");
			con.commit();
		} else {
			out.println(sql);
			out.println("수정 실패");
		}
	%>
	<a href="<%=rootPath%>/books/list.jsp"><button>리스트로 돌아가기</button></a>

</body>
</html>