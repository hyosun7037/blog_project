<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>elTest6.jsp</H1>
<%
	//10000
	String money = request.getParameter("money"); 
	//get, post 다 parameter로 받을 수 있고, 다만 get만 버퍼로 받지 X
%>	
<script>
	var num = 100;
	var m - '${param.money}';
	console.log(m);

	var sum - num + '${param.money}';
	console.log(sum);
</script>
</body>
</html>