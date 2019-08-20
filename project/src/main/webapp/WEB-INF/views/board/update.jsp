<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>수정</h1>
<form method = "post" id = "writeForm" action="<c:url value='/board/update'/>">
	<input type = "hidden" value = "${vo.board_num }" name = "board_num">
	작성자: <input type = "text" disabled="disabled" value = "${vo.nickname }"><br>
	제목: <input type = "text" name = "title" id = "title" value = "${vo.title }"><br>
	<textarea id="ir1" rows="10" cols="100" name = "content">${vo.content }</textarea><br>
	<a href = "javascript:history.go(-1)">취소</a>
	<input type = "button" id = "writeBtn" value = "수정">
</form>

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