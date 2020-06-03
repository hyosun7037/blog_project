<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// page -> request -> session -> application
	//(String name, Object value) - 이름이 name인 속성의 값을 value로 지정
	request.setAttribute("username", "ssar"); // 요청에 의한 값
	session.setAttribute("username", "1234"); // Session에 의해 유지할 값
	
	// 위의 값을 가지고 elTest2.jsp로 이동
	RequestDispatcher dis = request.getRequestDispatcher("elTest2.jsp");
	dis.forward(request, response);
%>