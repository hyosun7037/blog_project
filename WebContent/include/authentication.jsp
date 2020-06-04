<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 막을려면 이 파일에서 막던가, web.xml에서 막아야함 / 인증이 필요한 파일에 include 하기 -->
<c:if test="${empty sessionScope.principal}">
	<c:redirect url="/index.jsp"></c:redirect>
</c:if>