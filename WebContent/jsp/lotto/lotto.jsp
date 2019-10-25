<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
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
Random r = new Random();
List<Integer> nums = new ArrayList<Integer>();
for(int i=0;i<6;i++){
	int rNum = r.nextInt(45)+1;
	if(nums.indexOf(rNum)==-1){
		nums.add(rNum);
	}else{
		i--;
	}
}
for (int i = 0; i < nums.size(); i++) {
	for (int j = i + 1; j < nums.size(); j++) {
		if (nums.get(i) > nums.get(j)) {
			int tmpInt = nums.get(i);
			nums.set(i, nums.get(j));
			nums.set(j, tmpInt);
		}
	}
}
Connection con = DBCon.getCon();
String sql;
sql = " insert into lotto(seq, num1, num2, num3, num4, num5, num6) ";
sql += " values(seq_seq.nextval,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,nums.get(0)+"");
ps.setString(2,nums.get(1)+"");
ps.setString(3,nums.get(2)+"");
ps.setString(4,nums.get(3)+"");
ps.setString(5,nums.get(4)+"");
ps.setString(6,nums.get(5)+"");


int result = ps.executeUpdate();
if(result==1){
	out.println("완료.");
}else{
	out.println("에러.");
}
con.commit();

%>

<form method="post">
<button>번호 생성</button>
</form>
<a href="/bdi-web/jsp/lotto/lotto-list.jsp"><button>로또 리스트</button></a>
</body>
</html>