<%@page import="com.cos.blog.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>blog</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/blog/css/styles.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 여기다가 붙여주기 , 그러면 모든 페이지에서 summernote 사용 가능!-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="index.jsp">Sunny Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="justify-content-between collapse navbar-collapse " id="collapsibleNavbar">
		
			<ul class="navbar-nav " >
			<!-- else가 필요하면 c:choose문법을 사용 -->
			<c:choose>
				<c:when test="${empty sessionScope.principal}">
					<li class="nav-item"><a class="nav-link" href="/blog/user?cmd=login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="/blog/user?cmd=join">회원가입</a></li>
				</c:when>
					
				<c:otherwise>
				<li class="nav-item"><a class="nav-link" href="/blog/board?cmd=write">글쓰기</a></li>
					<li class="nav-item"><a class="nav-link" href="/blog/user?cmd=update">회원정보</a></li>
					<li class="nav-item"><a class="nav-link" href="/blog/user?cmd=logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
			
			<ul class="navbar-nav"> <!-- 로그인시 나오도록 -->
				<c:if test="${not empty sessionScope.principal}">
				<li class="nav-item">
					<a href="/blog/user?cmd=profileUpload">
					<img style = "border-radius:50%;" onerror="this.src ='/blog/image/userProfile.png'" 
					src="${sessionScope.principal.userProfile}"  width="40px" height="40px" />
					</a>
				</li>
				</c:if>
			</ul>
			
		</div>
	</nav>
	<br>