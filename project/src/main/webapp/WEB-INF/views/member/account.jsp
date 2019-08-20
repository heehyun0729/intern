<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<h1>회원목록</h1>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>닉네임</th>
			<th>성명</th>
			<th>회원유형</th>
			<th>전화번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.accnt_id }</td>
				<td>${vo.nickname }</td>
				<td>${vo.name }</td>
				<td><c:choose>
						<c:when test="${vo.user_type == 'E' }">
							전문가
						</c:when>
						<c:when test="${vo.user_type == 'A' }">
							운영자
						</c:when>
						<c:otherwise>
							일반회원
						</c:otherwise>
					</c:choose></td>
				<td>${vo.phone }</td>
				<td>${vo.id }</td>
				<td>${vo.s_passwd }</td>
			</tr>
		</c:forEach>
	</table>