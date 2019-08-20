<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>수정</h1>
<form method = "post" action="<c:url value='/board/update'/>">
	<input type = "hidden" value = "${vo.board_num }" name = "board_num">
	작성자: <input type = "text" disabled="disabled" value = "${vo.nickname }"><br>
	제목: <input type = "text" name = "title" value = "${vo.title }"><br>
	내용: <textarea id="content" rows="10" cols="100" name = "content">${vo.content }</textarea><br>
	<a href = "javascript:history.go(-1)">취소</a>
	<input type = "submit" value = "수정">
</form>