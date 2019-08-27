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
					<c:if test="${empty list }">
						<div class = "row" style = "height: 60px;padding: 20px;text-align: center;">조회된 결과가 없습니다.</div>
					</c:if>
				</div>
				<!-- Pagination -->
                <nav class="hami-pagination mb-50 d-flex justify-content-between" style = "padding: 0 30px;"">
                	<!-- Search Form -->
                	<div class="single-widget-area mb-50">
	                    <form action="<c:url value='/account.hh'/>" method="get" class="widget-form form-inline">
	                    	<select name = "field" class="form-control" style = "width: 130px;margin-right: 20px;">
	                    		<option value = "accnt_id"
	                    			<c:if test = "${param.field == 'accnt_id' }"> selected = "selected" </c:if>
	                    		>회원번호</option>
	                    		<option value = "nickname"
	                    			<c:if test = "${param.field == 'nickname' }"> selected = "selected" </c:if>
	                    		>닉네임</option>
	                    		<option value = "phone"
	                    			<c:if test = "${param.field == 'phone' }"> selected = "selected" </c:if>
	                    		>전화번호</option>
	                    		<option value = "name"
	                    			<c:if test = "${param.field == 'name' }"> selected = "selected" </c:if>
	                    		>성명</option>
	                    		<option value = "id"
	                    			<c:if test = "${param.field == 'id' }"> selected = "selected" </c:if>
	                    		>아이디</option>
	                    	</select>
	                        <input type="text" name = "keyword" placeholder="검색" value = "${param.keyword }">
	                        <button type="submit"><i class="fa fa-search"></i></button>
	                    </form>
	                </div>
					<!-- Pagination -->
                    <ul class="pagination">
                    	<c:if test="${pu.startPageNum > 1 }">
							 <li class="page-item"><a href = "<c:url value = '/account.hh?pageNum=${pu.startPageNum - 1 }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link">&lt;</a></li>
						</c:if>
						<c:forEach var = "i" begin = "${pu.startPageNum }" end = "${pu.endPageNum }">
							<c:choose>
								<c:when test="${pu.pageNum == i }">
									 <li class="page-item"><a href = "<c:url value='/account.hh?pageNum=${i }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link" style = "background-color: #6c7ae0; color: #ffffff;border-color: #6c7ae0;">${i }</a></li>
								</c:when>
								<c:otherwise>
									 <li class="page-item"><a href = "<c:url value='/account.hh?pageNum=${i }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pu.endPageNum < pu.totalPageCnt }">
							 <li class="page-item"><a href = "<c:url value = '/account.hh?pageNum=${pu.endPageNum + 1 }&field=${param.field }&keyword=${param.keyword }'/>" class="page-link">&gt;</a></li>
						</c:if>
                    </ul>
                </nav>
			</div>
		</div>
	</div>
</section>
			
			