<%@page import="java.io.PrintWriter"%>
<%@page import="com.cos.blog.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/nav.jsp"%>

<div class="container"> 

	<div class="col-md-12 m-2">
		<form class="form-inline justify-content-start" action="/blog/board?cmd=search"  method="get">
	    	<input class="form-control mr-sm-2" type="hidden" name="cmd" value="search">
	    	<input class="form-control mr-sm-2" type="hidden" name="page" value="0">
	    	<input class="form-control mr-sm-2 input-lg" type="text" name="keyword" placeholder="Search">
	    	<button class="btn btn-primary" type="submit">검색</button>
	  </form>
	</div>
	<c:forEach var="board" items="${boards}"> <!-- 객체가 들어있는 리스트를  출력하는 방법-->
		<!-- 부트스트랩의 규칙 : 본문은 container에 담기 -->
		<div class="card m-2" style="width: 100%">
			<div class="card-body">

				<h4 class="card-title">${board.title}</h4>
				<p class="card-text">${board.content}</p>

				<a href="/blog/board?cmd=detail&id=${board.id}" class="btn btn-primary">상세보기</a>
			</div>
		</div>
	</c:forEach>



<!-- 붙여넣기  -->
		<c:choose> 
			<c:when test = "${empty param.keyword}">
				<c:set var = "pagePrev" value = "/blog/board?cmd=home&page=${param.page-1}" />
				<c:set var = "pageNext" value = "/blog/board?cmd=home&page=${param.page+1}" />
			</c:when>
			
			<c:otherwise>
				<c:set var = "pagePrev" value = "/blog/board?cmd=search&page=${param.page-1}&keyword=${param.keyword}" />
				<c:set var = "pageNext" value = "/blog/board?cmd=search&page=${param.page+1}&keyword=${param.keyword}" />
			</c:otherwise>
		</c:choose>
		



	<ul class="pagination justify-content-center"> <!-- 가운데 정렬 -->
		<c:choose>
			<c:when test = "${param.page == 0}">
				<li class="page-item disabled"><a class="page-link" href="${pageScope.pagePrev}">Previous</a></li>
			</c:when>
			
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="${pageScope.pagePrev}">Previous</a></li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${lastPage==param.page}">
				<li class="page-item disabled"><a class="page-link" href="${pageScope.pageNext}">Next</a></li>
			</c:when>
			
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="${pageScope.pageNext}">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>



<%@include file="include/footer.jsp"%>



