<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">
	<form action="/blog/user?cmd=joinProc" method="post"
		class="was-validated">
		<div class="form-group">
			<label for="username">Username:</label> <input type="text"
				class="form-control" id="username" placeholder="Enter username"
				name="username" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="password">Password:</label> <input type="password"
				class="form-control" id="password" placeholder="Enter password"
				name="password" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="email">Email:</label> <input type="email"
				class="form-control" id="email" placeholder="Enter email"
				name="email" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="address">Address:</label> <input type="text"
				class="form-control" id="address" placeholder="Enter address"
				name="roadFullAddr" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
			<button type="button" class="btn btn-info" onClick="goPopup();">검색</button>
		</div>
		<button type="submit" class="btn btn-primary">회원가입 완료</button>
	</form>
	<script>
		function goPopup() {
			var pop = window.open("/blog/juso/jusoPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}
		function jusoCallBack(roadFullAddr) {
			var tfAddress = document.querySelector('#address');
			tfAddress.value = roadFullAddr;
		}
	</script>
</div>



<%@include file="../include/footer.jsp"%>