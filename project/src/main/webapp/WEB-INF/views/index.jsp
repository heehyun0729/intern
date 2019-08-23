<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Welcome Area Start -->
    <section class="welcome-area">

        <!-- Welcome Pattern -->
        <div class="welcome-pattern">
            <img src="<c:url value = '/resources/img/core-img/welcome-pattern.png'/>" alt="">
        </div>

        <!-- Welcome Slide -->
        <div class="welcome-slides owl-carousel">

            <!-- Single Welcome Slide -->
            <div class="single-welcome-slide">
                <!-- Welcome Content -->
                <div class="welcome-content h-100">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <!-- Welcome Text -->
                            <div class="col-12 col-md-9 col-lg-7">
                                <div class="welcome-text mb-50">
                                    <h3 data-animation="fadeInLeftBig" data-delay="200ms" data-duration="1s">이름: 김희현</h3>
                                    <h3 data-animation="fadeInLeftBig" data-delay="400ms" data-duration="1s">영문 이름: HEEHYUN KIM</h3>
                                    <h3 data-animation="fadeInLeftBig" data-delay="600ms" data-duration="1s">생일: 1994년 7월 29일</h3>
                                    <h3 data-animation="fadeInLeftBig" data-delay="800ms" data-duration="1s">현재 시각: ${time }</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Welcome Thumbnail -->
                <div class="welcome-thumbnail">
                    <img src="<c:url value = '/resources/img/bg-img/1.png'/>" alt="">
                </div>
            </div>

            <!-- Single Welcome Slide -->
            <div class="single-welcome-slide">
                <!-- Welcome Content -->
                <div class="welcome-content h-100">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <!-- Welcome Text -->
                            <div class="col-12 col-md-9 col-lg-7">
                                <div class="welcome-text mb-50">
                                    <h3 data-animation="fadeInLeftBig" data-delay="200ms" data-duration="1s">이름: 김희현</h3>
                                    <h3 data-animation="fadeInLeftBig" data-delay="400ms" data-duration="1s">영문 이름: HEEHYUN KIM</h3>
                                    <h3 data-animation="fadeInLeftBig" data-delay="600ms" data-duration="1s">생일: 1994년 7월 29일</h3>
                                    <h3 data-animation="fadeInLeftBig" data-delay="800ms" data-duration="1s">현재 시각: ${time }</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Welcome Thumbnail -->
                <div class="welcome-thumbnail">
                    <img src="<c:url value = '/resources/img/bg-img/2.png'/>" alt="">
                </div>
            </div>

        </div>
    </section>
    <!-- Welcome Area End -->
