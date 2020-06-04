<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl 태그 라이브러리가 충돌날 수도 있음 -->
<%@ include file="../include/nav.jsp"%>
<%@ include file="../include/authentication.jsp"%>

<!-- board안에 들어가는  이름과 같아야함 -->
<div class="container">
	<form action="/blog/board?cmd=writeProc" method="post" onSubmit ="return validate()">
		<div class="form-group">
			<label for="comment">Title:</label> <input type="text" class="form-control" placeholder="title" id="title" name="title">
		</div>

		<div class="form-group" >
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="content" name="content"></textarea>
		</div>

		<button type="submit" class="btn btn-primary">글쓰기 등록</button>
	</form>
</div>

<script>
	function validate(){
		var check = $("#title").val();
		if(check == null || check.length == 0){
			alert("제목을 입력해주세요");
			return false;
		}
		return true;
	}
</script>

<%@ include file="../include/footer.jsp"%>