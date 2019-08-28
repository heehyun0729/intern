<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="hami-blog-details-area pt-50">
       <div class="container">
           <div class="row justify-content-center">

			<div class="hami-contact-form mb-30">
				<h2>로그인</h2>
			    <!-- Form -->
			    <form method="post" action="<c:url value='/login'/>">
			        <div class="row text-center">
			            <div class="col-12 col-lg-12">
			                <input type = "text"  class="form-control mb-30" name = "id" placeholder="아이디">
			            </div>
			            <div class="col-12 col-lg-12">
			                <input type = "password" class="form-control mb-30" name = "pwd" placeholder="비밀번호">
			            </div>
			        </div>
		            <div class="col-12 col-lg-12">
		       		 	<div class="joinChk text-center">${msg } </div>
		            </div>
			        <!-- 버튼 -->
		            <div class = "d-flex justify-content-center">
			            <div class="col-12 col-lg-6 mb-30">
			            	<input type = "submit" class="btn hami-btn btn-3 mt-15 w-100" value = "로그인">
			            </div>
		            </div>
		            <div class = "d-flex justify-content-center">
			            <div class="col-12 col-sm-6">
			            	<a href="${apiURL }"><img style = "height: 50px;" src="<c:url value='/resources/img/naverLogin.png'/>"/></a>
			            </div>
		            </div>
			    </form>
			</div>
		</div>
	</div>
</section>