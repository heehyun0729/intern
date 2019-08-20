<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>글쓰기</h1>
<form method = "post" action="<c:url value='/board/write'/>">
	<input type = "hidden" value = "${sessionScope.login.accnt_id }" 
             name = "accnt_id">
	작성자: <input type = "text" disabled="disabled" 
                     value = "${sessionScope.login.nickname }"><br>
	제목: <input type = "text" name = "title"><br>
	내용: <textarea id="content" rows="10" cols="100" 
                      name = "content"></textarea><br>
	<a href = "javascript:history.go(-1)">취소</a>
	<input type = "submit" value = "작성">
</form>