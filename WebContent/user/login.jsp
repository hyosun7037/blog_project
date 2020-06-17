<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<%
// 	String remember = (String) request.getAttribute("remember");
// 	if(remember == null){
// 		remember=""; //초기화 remember를 무조건 output 시키기 위해서
// 	}
%>

<div class="container">

	<form action="/blog/user?cmd=loginProc" method="post"
		class="was-validated">
		<div class="form-group">
			<label for="username">Username:</label> <input type="text"
				value="${cookie.remember.value}" class="form-control" id="username"
				placeholder="Enter username" name="username" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="pwd">Password:</label> <input type="password"
				class="form-control" id="password" placeholder="Enter password"
				name="password" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group form-check">
			<label class="form-check-label"> 
				<c:choose>
					<c:when test = "${empty cookie.remember}">
						<input class="form-check-input" type="checkbox" name="remember"> 아이디 저장
					</c:when>
					
					<c:otherwise>
						<input class="form-check-input" type="checkbox" name="remember" checked> 아이디 저장
					</c:otherwise>
				</c:choose>
			</label>
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=6cb7c34a28f19e8dca67a8ef16144546&redirect_uri=http://localhost:8000/blog/oauth/kakao?cmd=callback&response_type=code"><img height="38px" alt="카카오로그인" src="/blog/image/kakao_login_button.png"></a>
	</form>
</div>



<%@include file="../include/footer.jsp"%>