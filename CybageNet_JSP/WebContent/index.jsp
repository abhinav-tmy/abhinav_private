<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cyb.cybnet.listeners.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cybage Net</title>
	<link rel="stylesheet" type="text/css" href="res/css/base.css">
	<script src="res/js/jquery.min.js"></script>
	<script src="res/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="res/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="res/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="res/css/bootstrap_base.css">

</head>
<body>
	<%@include file="header.jsp" %>	
	
	<div class="col-lg-offset-11">
		<c:if test="${!empty cookie.visits.value}">
			<div class="btn btn-primary gap-above disabled">
				<span class="badge">${cookie.visits.value}</span> visits
			</div>
		</c:if>
		<c:if test="${user.userRole.equals('admin')}">
			<div class="btn btn-warning gap-above disabled">
				<span class="badge"><%=MySessionListener.getSessionCount()%></span> users
			</div>
		</c:if>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="center">
		<span class="logo">Cybage Net</span> <br> 
		<span class="sublogo">books . reviews . fun</span> <br>

	</div>
</body>
</html>