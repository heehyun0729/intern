<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setStatus(200); %>
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-content">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<c:url value='/'/>"><i class="fa fa-home" aria-hidden="true"></i> 메인</a></li>
                            <li class="breadcrumb-item active" aria-current="page">오류</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Error Content Area Start -->
<section class="hami-error-area text-center section-padding-80-0 mb-50">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <img src="<c:url value='/resources/img/bg-img/404.png'/>" alt="">
                <h2 style = "font-weight: 700;">오류 발생</h2>
                <p>에러코드: ${requestScope['javax.servlet.error.status_code']}</p>
                <a href="javascript:history.go(-1)" class="btn hami-btn mt-30" style = "margin-right: 15px;">뒤로가기</a>
                <a href="<c:url value = '/'/>" class="btn hami-btn mt-30">메인</a>
            </div>
        </div>
    </div>
</section>
<!-- Error Content Area End -->