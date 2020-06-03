<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">
	<!-- submit을 하면 true가 리턴되면 제출하고, false가 리턴되면 변화X -->
	<form action="/blog/user?cmd=joinProc" method="post" class="was-validated" onSubmit ="return validate()">
		<div class="form-group">
			<label for="username">Username:</label> 
			<button type="button" class="btn btn-warning float-right" onClick="usernameCheck()">중복확인</button>
			<input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="password">Password:</label> 
			<input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="email">Email:</label> 
			<input type="email" class="form-control" id="email" placeholder="Enter email"
				name="email" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="address">Address:</label> 
			<button type="button" class="btn btn-info" onClick="goPopup();">검색</button>
			<input type="text"
				class="form-control" id="address" placeholder="Enter address"
				name="roadFullAddr" required readonly>
				
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
			
		</div>
		<button type="submit" class="btn btn-primary">회원가입 완료</button>
	</form>
	<script>
		function goPopup() {
			var pop = window.open("/blog/juso/jusoPopup.jsp", "pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		
		function jusoCallBack(roadFullAddr) {
			var tfAddress = document.querySelector('#address');
			tfAddress.value = roadFullAddr;
		}
	</script>
	
	
	<script>
		var isCheckedUsername = false;
		
		function validate(){
			if(isCheckedUsername == false){
				alert('아이디 중복체크를 해주세요');
			}// return 해도 되고, 안해도 됨
			return isCheckedUsername; // 동작 X
		}

		function usernameCheck(){
			//성공
			var tfUsername = $('#username').val(); // #username 선택해서 변수에 담기
			// 형태를 전체적으로 확인하려면 console / 또는 alert사용가능 / 
			// 	alert(tfUsername);
			console.log(tfUsername);

			
			// 	$.ajax(오브젝트).done(함수).fail(함수);
			/*
			Ajax에는 콜백함수가 3가지 존재 done(), fail(), always()
			data를 json형태로 바꾸고 싶다면 1.data:JSON.stringify({'key':value}),
			2. header:{'Content-Type':'aplication or session or reqeuest/json'}
			*/
			$.ajax({

			/* 자바스크립트는 모든것이 객체, this가 function이 될 수도 있고, 변수가 될 수도 있음
			헤깔리니까 this를 전역으로 꺼내놓으면 윈도우꺼, 화살표 함수를 쓰면, 그 안에서만 작동하도록 되있음 */

				type:'get',
				url: '/blog/user?cmd=usernameCheck&username='+ tfUsername //타입 생략 가능
			}).done(function(result){ // 해당 값이 result자리에 들어감
				console.log(result);
				if(result == 1){ // == 값만 비교, === 타입까지 비교
					alert('아이디가 중복되었습니다.');
					
				}else if(result == 0 ){
					alert('사용하실 수 있는 아이디입니다.');
 					isCheckedUsername = true; // 이 값이 나와야 넘어갈 수 있음
 					
				}else if(result == 2){
					alert('아이디를 입력해주세요.');
					
				}else{
					console.log('develop : 서버오류'); // 개발 끝나면 다 지우기
				}
				
			}).fail(function(error){
				console.log(error);
			});
			
		}
	</script>
</div>



<%@include file="../include/footer.jsp"%>