<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Delete Book</title>
		<link rel='stylesheet' type='text/css' href="../res/css/bootstrap.css">
	</head>
	<body>
			<c:if test="${!empty param.btn}">
				<c:if test="${param.btn.equals('yes')}">
					<jsp:useBean id="bookDao" class="cyb.cybnet.dao.impl.BookDAOImpl"></jsp:useBean>
					<jsp:useBean id="book" class="cyb.cybnet.dto.Book"></jsp:useBean>
					<jsp:setProperty property="bookId" name="book"/>
					${bookDao.deleteBook(book)}
				</c:if>
				<c:set var="msg" value="Book Deleted Successfully!" scope="session"></c:set>
				<c:set var="msgType" value="success" scope="session"></c:set>
				<c:redirect url="../index.jsp"></c:redirect>
			</c:if>
			<br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="col-md-10 col-md-offset-1">
			<form method='post' action='#'>
				<div class="panel panel-default">
      				<div class="panel-heading">
        				<b>Confirmation</b>
      				</div>	
      			<div class="panel-body">	
      			<h3>Are you sure you want to delete this book and all its reviews?</h3>	
				</div>
					<div class="panel-footer">
	        		<input type='hidden' value='request.getParameter(id)'>
					<input class="btn btn-danger" type='submit' name='btn' value='yes'>
					&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type='submit' name='btn' value='no'>
				 </div>
				</div>	
			</form>
			</div>
				
	</body>
</html>