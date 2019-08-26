<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="hami-blog-details-area section-padding-80-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
            	<div class="hami-contact-form mb-30">
                    <!-- Form -->
                    <form method = "post" id = "writeForm" action="<c:url value='/board/write'/>">
                    	<input type = "hidden" value = "${sessionScope.login.accnt_id }" name = "accnt_id">
                        <div class="row">
                            <div class="col-12 col-lg-1 mb-30">
                                <label class="bold mt-15">작성자</label>
                            </div>
                            <div class="col-12 col-lg-11 mt-15">
                                ${sessionScope.login.nickname }
                            </div>
                            <div class="col-12 col-lg-1">
                                 <label class="bold mt-15">제목</label>
                            </div>
                            <div class="col-12 col-lg-11">
                                <input type="text" name="title" id = "title" class="form-control mb-30">
                            </div>
                            <div class="col-12">
                            	<textarea name="content" id="ir1" style = "width:100%;height: 400px;" class="form-control mb-30"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 d-flex justify-content-between">
            	<div>
                	<a href = "javascript:history.go(-1)" class = "btn hami-btn btn-2 mt-15">취소</a>
                </div>
                <div>
                	<input type = "button" id = "writeBtn" value = "작성" class = "btn hami-btn btn-3 mt-15">
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
	$(function() {
		$("#writeBtn").click(function() {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
				if ($("#title").val() == ''){
					alert("제목을 입력해주세요.");
					return;
				}else{
					$("#writeForm").submit();
				}
		});
	});
</script>