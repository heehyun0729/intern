<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id = "header" class="header-area">
<!-- Top Header Area Start -->
<div class="top-header-area">
    <div class="container">
        <div class="row">
			<div class="col col-9">
                <div class="top-header-content" style = "padding-top:10px;">
                    <span><b>관리자</b> admin123 | <b>전문가</b> ex123, ex234 | <b>일반회원</b> test111, test222, test234, test345 / <b>비밀번호</b> qwe123</span>
                </div>
            </div>

            <div class="col col-3 ">
                <div class="top-header-content d-flex justify-content-around">
                    <!-- Login -->
                     <c:choose>
						<c:when test="${empty sessionScope.login.id}">
							<a href="<c:url value = '/loginForm'/>"><i class="fa fa-sign-in" aria-hidden="true"></i> 로그인</a>
							<a href="<c:url value = '/join'/>"><i class="fa fa-user-plus" aria-hidden="true"></i> 회원가입</a>
						</c:when>
						<c:otherwise>
							<div><i class="fa fa-heart" aria-hidden="true"></i> ${sessionScope.login.nickname}</div>
							<a href="<c:url value = '/logout'/>"><i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</a>
						</c:otherwise>
					</c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Top Header Area End -->

<!-- Main Header Start -->
<div class="main-header-area">
    <div class="classy-nav-container breakpoint-off">
        <div class="container">
            <!-- Classy Menu -->
            <nav class="classy-navbar justify-content-between" id="hamiNav">

                <!-- Logo -->
                <h1><a class="nav-brand" href="<c:url value = '/'/>"  style = "color:white;">김희현 인턴 실습</a></h1>

                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">
                    <!-- Menu Close Button -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul id="nav">
                            <li><a href="<c:url value = '/'/>">메인</a></li>
                            <li><a href="<c:url value='/board/list'/>">게시판</a></li>
                            <li><a href="<c:url value = '/account.hh'/>">회원목록</a></li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
        </div>
    </div>
</div>
</header>