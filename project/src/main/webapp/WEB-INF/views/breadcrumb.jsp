<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tilesx" uri="http://tiles.apache.org/tags-tiles-extras"%>
<tilesx:useAttribute name="current" />
<tilesx:useAttribute name="breadcrumb" />
<c:if test="${breadcrumb != 'main' }">
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-content">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<c:url value='/'/>"><i class="fa fa-home" aria-hidden="true"></i> 메인</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                            	<c:choose>
                            		<c:when test="${breadcrumb == 'board' }">
                            			게시판
                            		</c:when>
                            		<c:when test="${breadcrumb == 'error' }">
                            			오류
                            		</c:when>
                            		<c:when test="${breadcrumb == 'member' }">
                            			<c:choose>
                            				<c:when test="${current == 'account' }">
                            					회원목록
                            				</c:when>
                            				<c:when test="${current == 'join' || current == 'joinOk' || current == 'naverJoin' }">
                            					회원가입
                            				</c:when>
                            				<c:when test="${current == 'login' }">
                            					로그인
                            				</c:when>
                            			</c:choose>
                            		</c:when>
                            	</c:choose>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
</c:if>