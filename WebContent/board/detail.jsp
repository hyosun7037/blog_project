<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl 태그 라이브러리가 충돌날 수도 있음 -->
<%@ include file="../include/nav.jsp"%>

<!-- board안에 들어가는  이름과 같아야함 -->
<div class="container">
	<a class="btn btn-dark" href="javascript:history.back();">뒤로가기 다른방식</a>
	<button class="btn btn-dark" onclick="history.back()">뒤로가기</button>
	
	
	<c:if test="${sessionScope.principal.id == dto.board.userId}">
		<!-- 내가 업데이트 페이지로 이동할 때, 기존 데이터를 가지고 이동해야함, 가기전에 model에 들렸다 와야함
		그냥 가면 데이터가 없이 이동만 하게 됨, 데이터베이스에서 select해서 들고와야 함 -> board.id 
		동기화를 시킬려면 항상 select를 시켜야함 / onclick으로 쓰는 것보다 더 편리함 -->
		<a href="/blog/board?cmd=update&id=${dto.board.id}" class="btn btn-warning">수정</a>
		
		<!-- post니까 onclick으로 처리 -->
		<button class="btn btn-danger" onclick="deleteById(${dto.board.id})">삭제</button>
	</c:if>
	
	<br />
	<br />
	<h6>
		작성자 : <i>${dto.username}</i>
	</h6>
	<br />

	<h3><b>${dto.board.title}</b></h3>

	<div class="form-group">
		<div class="container p-3 my-3 border">${dto.board.content}</div>
	</div>

</div>

<script>
	function deleteById(boardId){
		$.ajax({
			type:"POST", // 지금은 post로 통일, 원래 get, post, put, delete사용 (추후에 REST API 할 때)
			url:"/blog/board?cmd=delete&id=" +boardId,
			dataType : "text"
		}).done(function(result){
			console.log(result);
			if(result==1){
				alert("삭제 성공");
				location.href="/blog/index.jsp"
			}else{
				alert("삭제 실패");
			}
		}).fail(function(error){
			console.log(error);
			console.log(error.responseText);
			console.log(error.status);
			alert("서버 오류");
		});
		
		}
</script>

<%@ include file="../include/footer.jsp"%>
