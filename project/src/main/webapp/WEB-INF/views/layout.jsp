<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>인턴 실습 과제 (김희현)</title>

<script type="text/javascript" src = "/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel = "stylesheet" type = "text/css" href = "/resources/css/bootstrap.min.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/css/animate.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/css/default-assets/classy-nav.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/css/magnific-popup.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/css/font-awesome.min.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/css/style.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/css/common.css">
<link rel = "stylesheet" type = "text/css" href = "/resources/style.css">
</head>
<body>

	<tiles:insertAttribute name = "header"/>

	<tiles:insertAttribute name = "content"/>

	<tiles:insertAttribute name = "footer"/>

<script type="text/javascript" src = "/resources/js/popper.min.js"></script>
<script type="text/javascript" src = "/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "/resources/js/hami.bundle.js"></script>
<script type="text/javascript" src = "/resources/js/default-assets/active.js"></script>
</body>
</html>