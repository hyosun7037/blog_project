<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String email = request.getParameter("email");

	/*
	HTTPRequest 중 body로 넘어온 parameter를 확인하기 위해서는
	getInputStream()이나 getReader()를 사용
	getParameter는 네가지 다 받을 수 있음
	버퍼는 get 빼고
	*/
	BufferedReader br = request.getReader();

	String input = null;
	
	/*
	StringBuilder를 사용하면 new연산자는 한번만 실행
	내부적으로 char[]를 사용하고, 변경가능
	싱글스레드에서만 사용가능 (동기화 지원 X)
	만약 멀티스레드상황이라면 StringBuffered 사용
	*/
	StringBuilder sb = new StringBuilder();
	while((input=br.readLine())!= null){ // return 값은 String, 한줄씩 읽음
		sb.append(input); // + 로 문자열 처리했을 때 보다 메모리 낭비가 덜함
		System.out.println(input);
	}
	String email = sb.toString(); // 문자열을 String을으로 변환
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>elTest4.jsp</h1>
	<hr />
	이메일 : <%=email %>
</body>
</html>