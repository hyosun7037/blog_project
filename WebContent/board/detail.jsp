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
		<a href="/blog/board?cmd=update&id=${requestScope.dto.board.id}" class="btn btn-warning">수정</a>
		<!-- requestScope는 생략가능 -->
		
		<!-- post니까 onclick으로 처리 -->
		<button class="btn btn-danger" onclick="deleteById(${dto.board.id})">삭제</button>
	</c:if>
	
	<br />
	<br />
	<h6 class="m-2">
		작성자 : <i>${dto.username}</i> 
		조회수 : <i>${dto.board.readCount}</i>
	</h6>
	<br />

	<h3 class="m-2"><b>${dto.board.title}</b></h3>

	<div class="form-group">
		<div class="m-2">${dto.board.content}</div>
<%-- 		<div class="container p-3 my-3 border">${dto.board.content}</div> --%>
	</div>



		<!-- 댓글 박스 -->
	<div class="row bootstrap snippets">
		<div class="col-md-12">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading m-2"><b>Comment</b></div>
					<div class="panel-body">
						<textarea class="form-control" placeholder="write a comment..." rows="3"></textarea>
						<br>
						<button type="button" class="btn btn-primary pull-right">댓글쓰기</button>
						<div class="clearfix"></div>
						<hr />
						<!-- 댓글 리스트 시작-->
						<ul class="media-list">
						
							<c:forEach begin="1" end="10">
							<!-- 댓글 아이템 -->
							<li class="media">	
								<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">		
								<div class="media-body">
									<strong class="text-primary">@MartinoMont</strong>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.
									</p>
								</div>
							</li>
							</c:forEach>
						</ul>
						<!-- 댓글 리스트 끝-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 박스 끝 -->
</div>

<!-- js 파일은 따로 빼두기 -->
<script src="/blog/js/detail.js"></script>

<%@ include file="../include/footer.jsp"%>
