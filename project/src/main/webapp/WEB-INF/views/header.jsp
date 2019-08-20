<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
	<li><a href="<c:url value = '/'/>">메인</a></li>
	<li><a href="<c:url value='/board/list'/>">게시판</a></li>
</ul>
<ul>
	<li><a href="<c:url value = '/account.hh'/>">회원목록</a></li>
	<c:choose>
		<c:when test="${empty sessionScope.login.id}">
			<li><a href="<c:url value = '/joinForm'/>">회원가입</a></li>
			<li><a href="<c:url value = '/login'/>">로그인</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="<c:url value = '/logout'/>">로그아웃</a></li>
		</c:otherwise>
	</c:choose>

</ul>