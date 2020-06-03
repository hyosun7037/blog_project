<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- actio : 폼을 전송할 서버 쪽 스크립트 파일 지정 즉 목적지, 
	POST방식은 내부적으로 보이지 X(보안에 좋음) -->
	<form action="elTest4.jsp" method="post">
		<input type="email" name="email" value="ssar@nate.com"/>
		<button>전송</button>
	</form>
</body>
</html>