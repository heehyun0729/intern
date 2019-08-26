<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="hami-blog-details-area section-padding-80-0">
       <div class="container">
           <div class="row justify-content-center">

			<div class="hami-contact-form mb-30">
				<div class = "row d-flex justify-content-start">
					<h2 class = "mt-15" style = "padding-left: 45px;">회원목록</h2>
				</div>
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table">
						   <div class="rows header">
								<div class="cell acc">회원번호</div>
								<div class="cell acc">닉네임</div>
								<div class="cell acc">성명</div>
								<div class="cell acc">회원유형</div>
								<div class="cell acc">전화번호</div>
								<div class="cell acc">아이디</div>
								<div class="cell acc">비밀번호</div>
								<div class="cell acc">마지막 로그인</div>
							</div>
							<c:forEach var="vo" items="${list }">
								<div class="rows">
									<div class="cell acc">${vo.accnt_id }</div>
									<div class="cell acc">${vo.nickname }</div>
									<div class="cell acc">${vo.name }</div>
									<div class="cell acc">
										<c:choose>
											<c:when test="${vo.user_type == 'E' }">
												전문가
											</c:when>
											<c:when test="${vo.user_type == 'A' }">
												운영자
											</c:when>
											<c:otherwise>
												일반회원
											</c:otherwise>
										</c:choose>
									</div>
									<div class="cell acc">${vo.phone }</div>
									<div class="cell acc">${vo.id }</div>
									<div class="cell acc">${vo.s_passwd }</div>
									<div class="cell acc">${vo.last_login }</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- Pagination -->
                <nav class="hami-pagination mb-50">
                    <ul class="pagination d-flex justify-content-center">
                    	<c:if test="${pu.startPageNum > 1 }">
							 <li class="page-item"><a href = "<c:url value = '/account.hh?pageNum=${pu.startPageNum - 1 }'/>" class="page-link">&lt;</a></li>
						</c:if>
						<c:forEach var = "i" begin = "${pu.startPageNum }" end = "${pu.endPageNum }">
							<c:choose>
								<c:when test="${pu.pageNum == i }">
									 <li class="page-item"><a href = "<c:url value='/account.hh?pageNum=${i }'/>" class="page-link" style = "background-color: #6c7ae0; color: #ffffff;border-color: #6c7ae0;">${i }</a></li>
								</c:when>
								<c:otherwise>
									 <li class="page-item"><a href = "<c:url value='/account.hh?pageNum=${i }'/>" class="page-link">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pu.endPageNum < pu.totalPageCnt }">
							 <li class="page-item"><a href = "<c:url value = '/account.hh?pageNum=${pu.endPageNum + 1 }'/>" class="page-link">&gt;</a></li>
						</c:if>
                    </ul>
                </nav>
			</div>
		</div>
	</div>
</section>
			
			