<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function deleteConfirm(board_num, accnt_id) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			url: "<c:url value='/board/delete'/>",
			dateType: "json",
			data: {board_num: board_num},
			success: function(data) {
				var result = data.result;
				if(result == 'success'){
					location.href = "<c:url value='/board/list'/>";
				}else{
					location.href = "<c:url value='/error'/>";
				}
			}
		});
	}else{
		return;
	}
}
</script>
<!-- Blog Details Area Start -->
<section class="hami-blog-details-area section-padding-80-0">
    <div class="container">
    <div class = "row d-flex justify-content-end mb-50">
		<a href = "<c:url value='/board/write'/>" class = "btn hami-btn btn-3 mt-15" style = "margin-right: 45px;">글쓰기</a>
	</div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
                <div class="post-content">
                    <div class="post-meta">
                        <a href="#" class="post-date">글번호: ${vo.board_num }<span style = "color:#ccc;"> | </span>작성일: ${vo.wdate }</a>
                    </div>
                    <h2 class="post-title">${vo.title }</h2>
                    <h3 class="post-title mt-15" style = "font-size: 24px;"><i class="fa fa-user-circle-o" aria-hidden="true"></i> ${vo.nickname }</h3>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
                <div class="blog-details-text mb-50">
                <hr class = "mb-50">
                	${vo.content }
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 d-flex justify-content-between">
            	<div>
                	<a href = "<c:url value='/board/list?pageNum=${param.pageNum }'/>" class = "btn hami-btn btn-2 mt-15">목록</a>
                </div>
                <div>
				<c:if test="${sessionScope.login.accnt_id == vo.accnt_id 
							|| sessionScope.login.user_type == 'A'
							|| sessionScope.login.user_type == 'E'}">
					<a href = "<c:url value='/board/update?board_num=${vo.board_num }'/>" class = "btn hami-btn btn-3 mt-15">수정</a>
				</c:if>
				<c:if test="${sessionScope.login.accnt_id == vo.accnt_id 
							|| sessionScope.login.user_type == 'A'}">
					<a href = "javascript:deleteConfirm(${vo.board_num })" class = "btn hami-btn btn-3 mt-15" style = "margin-left: 20px;">삭제</a>
				</c:if>
				</div>
            </div>
        </div>
    </div>
</section>