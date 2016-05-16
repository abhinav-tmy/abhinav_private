<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cybage Net</title>
	<script src="res/js/jquery.min.js"></script>
	<script src="res/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="res/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="res/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="res/css/bootstrap_base.css">

</head>
<body>
<c:set var="user" value="${sessionScope.user}"></c:set>
	<div class="navbar navbar-default">
		<c:if test="${!empty requestScope.msg}">
			<c:if test="${empty requestScome.msgType}">
				<c:set var="msgType" value="danger" scope="request"></c:set>
			</c:if>
			<div id="alert" class="alert alert-danger alert-dismissable">
    			<button type="button" class="close" data-dismiss="alert">&times;</button>
    			${requestScope.msg}
			</div>
		</c:if>
		
		<c:if test="${!empty sessionScope.msg}">
			<c:if test="${empty sessionScome.msgType}">
				<c:set var="msgType" value="danger" scope="request"></c:set>
			</c:if>
			<div id="alert" class="alert alert-${sessionScope.msgType} alert-dismissable">
    			<button type="button" class="close" data-dismiss="alert">&times;</button>
    			${sessionScope.msg}
			</div>
			<c:remove var="msg" scope="session"/>
		</c:if>
		
		<div class="container-fluid">
			
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#mynavbar-content">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand headlogo" href="/CybageNet_JSP/">Cybage Net</a>
			</div>
			<div class="collapse navbar-collapse" id="mynavbar-content">
					<!-- <form class="navbar-form navbar-left" >	
						<div class="form-group">
							<div class="input-group">
	                    		<input class="form-control" type="text" placeholder="type name here ..." name="title" autofocus="autofocus" autocomplete="on">
	  							<div class="input-group-btn">
	  								<button type="submit" class=""><span class="glyphicon glyphicon-search"></span></button>
	               				</div>
	               			</div>
               			</div>
					</form> -->
					
					<form class="navbar-left navbar-form navbar-text" role="search" action="Search.jsp" >
						<div class="input-group">
							<input class="form-control" type="text" placeholder="book name" name="title" autofocus="autofocus" autocomplete="on">
							<div class="input-group-btn"><button class="btn btn-primary" type="submit" ><span class="glyphicon glyphicon-search"></span></button></div>  
						</div>
					</form>
					
					<c:if test="${user.userRole.equals('admin')}">
						<ul class="nav navbar-nav">
						<li class="navbar-btn"><a href='/CybageNet_JSP/admin/AddBook.jsp'>Add new book</a></li>
						<li class="navbar-btn"><a href='/CybageNet_JSP/log.txt'>Show Logs</a></li>
						</ul>
					</c:if>
					
					<c:if test="${empty user}">
						
						<form class="navbar-form navbar-right" role="login" method="post" action="LoginServlet">
							<div class="form-group">
								<input class="form-control" type="text" name="user" placeholder="username" required="required">
								<input class="form-control" type="password" name="pass" placeholder="password" required="required">
								<button class="btn navbar-btn btn-primary btn-sm" type="submit" ><span class="glyphicon glyphicon-log-in"></span> Login</button>  
							</div>
						</form>
					</c:if>
					<c:if test="${!empty user}">
						<ul class="nav navbar-nav navbar-right">
						<li class="navbar-btn"><a href="#"><b>Hello, ${user.userName}</b></a></li>
						<li class="navbar-btn"><a href='/CybageNet_JSP/LogoutServlet'>Logout</a></li>
						</ul>
					</c:if>				
			</div>
		</div>
	</div>
</body>
</html>
