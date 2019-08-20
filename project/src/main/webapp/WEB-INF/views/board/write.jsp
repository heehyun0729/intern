<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>글쓰기</h1>
<form method = "post" id = "writeForm" action="<c:url value='/board/write'/>">
	<input type = "hidden" value = "${sessionScope.login.accnt_id }" name = "accnt_id">
	작성자: ${sessionScope.login.nickname }<br>
	제목: <input type = "text" name = "title" id = "title"><br>
	<textarea name="content" id="ir1" rows="10" cols="100"></textarea><br>
	<a href = "javascript:history.go(-1)">취소</a>
	<input type = "button" id = "writeBtn" value = "작성">
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