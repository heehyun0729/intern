<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>게시판</h1>
<a href = "<c:url value='/board/write'/>">글쓰기</a>
<div>
	<table border = "1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var = "vo" items="${list }">
		<tr>
			<td>${vo.board_num }</td>
			<td><a href = "<c:url value='/board/detail?board_num=${vo.board_num }'/>">${vo.title }</a></td>
			<td>${vo.nickname }</td>
			<td>${vo.wdate }</td>
		</tr>
		</c:forEach>
	</table>
</div>