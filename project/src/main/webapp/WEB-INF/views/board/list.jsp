<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-content">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<c:url value='/'/>"><i class="fa fa-home" aria-hidden="true"></i> 메인</a></li>
                            <li class="breadcrumb-item active" aria-current="page">게시판</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->
<section class="hami-blog-details-area section-padding-80-0">
       <div class="container">
           <div class="row justify-content-center">
			<div class="hami-contact-form mb-30">
				<div class = "row d-flex justify-content-between">
					<h2 class = "mt-15" style = "padding-left: 45px;">게시판</h2>
					<a href = "<c:url value='/board/write'/>" class = "btn hami-btn btn-3 mt-15" style = "margin-right: 45px;">글쓰기</a>
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
									<div class="cell list"><a href = "<c:url value='/board/detail?pageNum=${param.pageNum }&board_num=${vo.board_num }'/>">${vo.title }</a></div>
									<div class="cell list">${vo.nickname }</div>
									<div class="cell list">${vo.wdate }</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- Pagination -->
                <nav class="hami-pagination mb-50">
                    <ul class="pagination d-flex justify-content-center">
                    	<c:if test="${pu.startPageNum > 1 }">
							 <li class="page-item"><a href = "<c:url value = '/board/list?pageNum=${pu.startPageNum - 1 }'/>" class="page-link">&lt;</a></li>
						</c:if>
						<c:forEach var = "i" begin = "${pu.startPageNum }" end = "${pu.endPageNum }">
							<c:choose>
								<c:when test="${pu.pageNum == i }">
									 <li class="page-item"><a href = "<c:url value='/board/list?pageNum=${i }'/>" class="page-link">${i }</a></li>
								</c:when>
								<c:otherwise>
									 <li class="page-item"><a href = "<c:url value='/board/list?pageNum=${i }'/>" class="page-link">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pu.endPageNum < pu.totalPageCnt }">
							 <li class="page-item"><a href = "<c:url value = '/board/list?pageNum=${pu.endPageNum + 1 }'/>" class="page-link">&gt;</a></li>
						</c:if>
                    </ul>
                </nav>
			</div>
		</div>
	</div>
</section>