	$("#img__preview").on("change", function(e){ // change는 변화감지 , e는 이벤트를 전달받음
		console.log(e.target.files);
// 		if(!e.target.files[0].type.include("image")){ //include도 사용 가능
// 			alert('사진이 아닙니다.');
// 			}

// 		if(!e.target.files[0].type.contains("image")){ //contains도 사용 가능
// 			alert('사진이 아닙니다.');
// 			}
		var f = e.target.files[0];
		if(!f.type.match("image*")){ //match도 사용 가능
			$("#img__preview").val("");
			alert('이미지만 첨부할 수 있습니다.');
			
			}
		// f.size = 1024*1024*2 --> 2MB
		var reader = new FileReader();
		reader.onload = function(e){ 
			$("#img__wrap").attr("src", e.target.result); //이미지가 담김 
			// 이때 e 실행가능, 밑에 있으면 못찾을 수 있다. 위에 작성, 다운로드 완료시 콜백
				
			}
		reader.readAsDataURL(f); // 비동기적으로 실행

		
		// ${"#img_wrap"}.attr("src", e.target.result); // 만약 동기적으로 실행된다면 해당 구문실행
		 

		 

	}); // click이라는 이벤트가 발생하면, function이 실행