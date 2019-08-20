<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setStatus(200); %>
<h1>오류 발생</h1>
<h2>요청한 페이지를 찾을 수 없습니다.</h2>
<a href = "javascript:history.go(-1)">뒤로가기</a>
<a href="<c:url value = '/'/>">메인</a>