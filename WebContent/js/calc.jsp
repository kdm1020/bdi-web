<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
숫자1 : <input type="number"id=num1>
+
숫자2 : <input type="number"id=num2>
<button onclick="calc();">계산하기</button>

<script>
	function calc(){
		var n1= document.getElementById("num1");
		var n2= document.getElementById("num2");
		alert(parseInt(n1.value)+parseInt(n2.value));
		
	}
	
	
</script>

</body>
</html>