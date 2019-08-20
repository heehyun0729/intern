<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function deleteConfirm(board_num, accnt_id) {
	if(accnt_id == '' || accnt_id == null){
		location.href = "<c:url value='/login'/>";
	}else{
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
}
</script>

<h1>상세보기</h1>
<div>
	<table border = "1">
		<tr>
			<th>글번호</th>
			<td>${vo.board_num }</td>
			<th>작성일</th>
			<td>${vo.wdate }</td>
		</tr>
		<tr>
			<th colspan="2">작성자</th>
			<td colspan="2">${vo.nickname }</td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="2">${vo.title }</td>
		</tr>
		<tr>
			<td colspan="4">
				<div>
					${vo.content }
				</div>
			</td>
		</tr>
	</table>
</div>
<div>
	<a href = "<c:url value='/board/list'/>">목록</a>
	<a href = "<c:url value='/board/update?board_num=${vo.board_num }'/>">수정</a>
	<a href = "javascript:deleteConfirm(${vo.board_num }, ${sessionScope.accnt_id })">삭제</a>
</div>