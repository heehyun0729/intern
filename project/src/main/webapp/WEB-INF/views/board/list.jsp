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
			<td><a href = "<c:url value='/board/detail?pageNum=${param.pageNum }&board_num=${vo.board_num }'/>">${vo.title }</a></td>
			<td>${vo.nickname }</td>
			<td>${vo.wdate }</td>
		</tr>
		</c:forEach>
	</table>
</div>
<div>
	<c:if test="${pu.startPageNum > 1 }">
		<a href = "<c:url value = '/board/list?pageNum=${pu.startPageNum - 1 }'/>">[이전]</a>
	</c:if>
	<c:forEach var = "i" begin = "${pu.startPageNum }" end = "${pu.endPageNum }">
		<c:choose>
			<c:when test="${pu.pageNum == i }">
				<a href = "<c:url value='/board/list?pageNum=${i }'/>"><span style = "color:pink;">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "<c:url value='/board/list?pageNum=${i }'/>"><span>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.endPageNum < pu.totalPageCnt }">
		<a href = "<c:url value = '/board/list?pageNum=${pu.endPageNum + 1 }'/>">[다음]</a>
	</c:if>
</div>