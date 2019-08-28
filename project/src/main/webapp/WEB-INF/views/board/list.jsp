<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="hami-blog-details-area pt-50">
       <div class="container">
           <div class="row justify-content-center">
			<div class="hami-contact-form mb-30">
				<div class = "row d-flex justify-content-between">
					<h2 class = "mt-15" style = "padding-left: 45px;">게시판</h2>
					<div>
						<a href = "<c:url value='/board/list'/>" class = "btn hami-btn btn-2 mt-15" style = "margin-right: 20px;">전체 목록</a>
						<a href = "<c:url value='/board/write'/>" class = "btn hami-btn btn-3 mt-15" style = "margin-right: 45px;">글쓰기</a>
					</div>
				</div>
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table">
						   <div class="rows header">
								<div class="cell list">글번호</div>
								<div class="cell list">제목</div>
								<div class="cell list">작성자</div>
								<div class="cell list">작성일</div>
							</div>
							<c:forEach var="vo" items="${list }">
								<div class="rows">
									<div class="cell list">${vo.board_num }</div>
									<div class="cell list"><a href = "<c:url value='/board/detail?pageNum=${param.pageNum }&field=${param.field }&keyword=${param.keyword }&board_num=${vo.board_num }'/>">${vo.title }</a></div>
									<div class="cell list">${vo.nickname }</div>
									<div class="cell list">${vo.wdate }</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<c:if test="${empty list }">
						<div class = "row" style = "height: 60px;padding: 20px;text-align: center;">조회된 결과 없습니다.</div>
					</c:if>
				</div>
                <nav class="hami-pagination mb-50 d-flex justify-content-between" style = "padding: 0 30px;">
                	<!-- Search Form -->
                	<div class="single-widget-area mb-50">
	                    <form action="<c:url value='/board/list'/>" method="get" class="widget-form form-inline">
	                    	<select name = "field" class="form-control" style = "width: 130px;margin-right: 20px;">
	                    		<option value = "all"
	                    			<c:if test = "${param.field == 'all' }"> selected = "selected" </c:if>
	                    		>제목+내용</option>
	                    		<option value = "title"
	                    			<c:if test = "${param.field == 'title' }"> selected = "selected" </c:if>
	                    		>제목</option>
	                    		<option value = "content"
	                    			<c:if test = "${param.field == 'content' }"> selected = "selected" </c:if>
	                    		>내용</option>
	                    		<option value = "nickname"
	                    			<c:if test = "${param.field == 'nickname' }"> selected = "selected" </c:if>
	                    		>작성자</option>
	                    	</select>
	                        <input type="text" name = "keyword" placeholder="검색" value = "${param.keyword }">
	                        <button type="submit"><i class="fa fa-search"></i></button>
	                    </form>
	                </div>
					<!-- Pagination -->
                    <ul class="pagination ">
                    	<c:if test="${pu.startPageNum > 1 }">
							 <li class="page-item"><a href = "<c:url value = '/board/list?pageNum=${pu.startPageNum - 1 }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link">&lt;</a></li>
						</c:if>
						<c:forEach var = "i" begin = "${pu.startPageNum }" end = "${pu.endPageNum }">
							<c:choose>
								<c:when test="${pu.pageNum == i }">
									 <li class="page-item"><a href = "<c:url value='/board/list?pageNum=${i }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link" style = "background-color: #6c7ae0; color: #ffffff;border-color: #6c7ae0;">${i }</a></li>
								</c:when>
								<c:otherwise>
									 <li class="page-item"><a href = "<c:url value='/board/list?pageNum=${i }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pu.endPageNum < pu.totalPageCnt }">
							 <li class="page-item"><a href = "<c:url value = '/board/list?pageNum=${pu.endPageNum + 1 }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link">&gt;</a></li>
						</c:if>
                    </ul>
                </nav>
			</div>
		</div>
	</div>
</section>