	var isCheckedUsername = false;
		
	// juso.go.kr 라이브러리 함수 (시작) ----------------------------------------------

		function goPopup() {
			window.open("/blog/juso/jusoPopup.jsp", "pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		
		function jusoCallBack(roadFullAddr) {
			var tfAddress = document.querySelector('#address');
			tfAddress.value = roadFullAddr;
		}

		//------------------------------------------------ juso.go.kr 라이브러리 함수 (끝)
		
		
		// 중복체크 함수
		function validate(){
			if(isCheckedUsername == false){
				alert('아이디 중복체크를 해주세요');
			}// return 해도 되고, 안해도 됨
			return isCheckedUsername; // 동작 X
		}

		// 데이터베이스에 ajax 요청을 해서 중복 유저네임이 있는지 확인
		// 있으면 1을 리턴, 없으면 0을 리턴, 오류나면 -1
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
				url: `/blog/user?cmd=usernameCheck&username=${tfUsername}` //타입 생략 가능
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