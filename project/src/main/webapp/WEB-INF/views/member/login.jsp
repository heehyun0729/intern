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
                            <li class="breadcrumb-item active" aria-current="page">로그인</li>
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
			            <div class="col-12 col-lg-6">
			            	<input type = "submit" class="btn hami-btn btn-3 mt-15 w-100" value = "로그인">
			            </div>
		            </div>
			    </form>
			</div>
		</div>
	</div>
</section>