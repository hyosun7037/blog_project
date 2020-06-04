<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl 태그 라이브러리가 충돌날 수도 있음 -->
<%@ include file="../include/nav.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<%@ include file="../include/authentication.jsp"%>

<!-- board안에 들어가는  이름과 같아야함 -->
<div class="container">
   <form action="/blog/board?cmd=writeProc" method="POST">
   
      <div class="form-group">
         <label for="title">Title:</label> <input type="text" class="form-control" placeholder="title" id="title" name="title">
      </div>
      
      <div class="form-group">
         <label for="content">Content:</label>
         <textarea id="summernote" class="form-control" rows="5" id="content" name="content"></textarea>
      </div>
      
      <button type="submit" class="btn btn-primary">글쓰기</button>
   </form>
</div>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			tabsize : 2,
			height : 300
		});
	});
</script>

<%@ include file="../include/footer.jsp"%>