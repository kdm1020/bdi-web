<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<form>
		<select name="search">
			<option value="1">책제목</option>
			<option value="2">책종류</option>
		</select> <input type="text" name="searchStr">
		<button>검색</button>
	</form>
	<table border="1">
		<tr>
			<th>순서</th>
			<th>이미지</th>
			<th>제목</th>
			<th>종류</th>
			<th>별점</th>
			<th>출시일</th>
			<th>책소개</th>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			String search = request.getParameter("search");
			String searchStr = request.getParameter("searchStr");
			String sql = " select bi.bi_num, bi.bi_image, bi.BI_TITLE, bi.bi_star, bi.BI_CREDAT, bi.BI_DESC, (select bt.bt_name from books_type bt where bt.bt_num=bi.BI_TYPE) bi_type from books_info bi ";

			if (search != null) {
				if ("1".equals(search)) {
					sql += "where bi_title like ? ";
				} else if ("2".equals(search)) {
					sql += "where bi_type like ? ";
				} 
			}
			sql += " order by bi_num desc ";

			Connection con = DBCon.getCon();
			PreparedStatement ps = con.prepareStatement(sql);
			
			if (search != null) {
				if ("1".equals(search) || "2".equals(search)) {
					ps.setString(1, "%" + searchStr + "%");
				} 
			}
			
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next()) {
				final String bkNum = rs.getString("bi_num");
				i++;
		%>
		<tr>
			<td><%=rs.getString("bi_num")%></td>
			<td><img src="<%=rootPath + rs.getString("bi_image")%>" width="300" height="180"></td>
			<td><%=rs.getString("bi_title")%></td>
			<td><%=rs.getString("bi_type")%></td>
			<td><%=rs.getString("bi_star")%></td>
			<td><%=rs.getString("bi_credat")%></td>
			<td><%=rs.getString("bi_desc")%></td>
			<td><a href="/bdi/books/update.jsp?bi_num=<%=bkNum%>"><button
						type="button">수정</button></a></td>
			<td><a href="/bdi/books/delete.jsp?bi_num=<%=bkNum%>"><button
						type="button">삭제</button></a></td>
		</tr>

		<%
			}
		%>

	</table>
	<a href="<%=rootPath%>/books/insert.jsp"><button>추가</button></a>
</body>
</html>