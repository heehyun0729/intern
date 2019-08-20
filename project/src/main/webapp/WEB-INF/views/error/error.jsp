<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setStatus(200); %>
<h1>오류 발생</h1>
<p>에러코드: ${requestScope['javax.servlet.error.status_code']}</p>
<a href = "javascript:history.go(-1)">뒤로가기</a>
<a href="<c:url value = '/'/>">메인</a>