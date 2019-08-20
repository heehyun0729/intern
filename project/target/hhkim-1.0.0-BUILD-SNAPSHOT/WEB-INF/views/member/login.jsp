<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>로그인</h1>
<div>
	<form method="post" action="<c:url value='/login'/>">
		<input type = "text" name = "id" placeholder="아이디"><br>
		<input type = "password" name = "pwd" placeholder="비밀번호"><br>
		<input type = "submit" value = "로그인"><br>
	</form>
</div>