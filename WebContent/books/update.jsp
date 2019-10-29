<%@page import="java.sql.ResultSet"%>
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
		String bkNum = request.getParameter("bi_num");
		String sql = " select * from books_info where bi_num= ? ";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bkNum);
		String sql1 = " select * from books_type order by bt_num";
		PreparedStatement ps1 = con.prepareStatement(sql1);
		ResultSet rs = ps.executeQuery();
		ResultSet rs1 = ps1.executeQuery();
		if (!rs.next()) {
			out.println(bkNum + "에 해당하는 게시물은 존재 하지 않습니다.");
		} else {
	%>
	<form method="post" action="<%=rootPath%>/books/update-ok.jsp">
		<table border="1">
			<tr>
				<th>제목</th>
				<th><input type="text" name="bk_title"
					value=<%=rs.getString("bi_title")%>></th>
			</tr>
			<tr>
				<th>종류</th>
				<td><select name="bk_type">
						<%
							while (rs1.next()) {
						%>
						<option value="<%=rs1.getString("bt_num")%>">
							<%=rs1.getString("bt_name")%>
						</option>
						<%
							}
						%>
				</select></td>
			</tr>

			<tr>
				<th>별점</th>
				<th><input type="number" name="bk_star"
					value=<%=rs.getString("bi_star")%>></th>
			</tr>
			<tr>
				<th>출시일</th>
				<th><input type="number" name="bk_credat"
					value=<%=rs.getString("bi_credat")%>></th>
			</tr>
			<tr>
				<th>책소개</th>
				<th><textarea name="bk_desc"><%=rs.getString("bi_desc")%></textarea></th>
			</tr>
			<tr>
				<th colspan="2"><button>수정완료</button>
			</tr>
		</table>
		<input type="hidden" name="bk_num" value="<%=bkNum%>">
	</form>

	<%
		}
	%>
</body>
</html>