<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<link rel='stylesheet' type='text/css' href="res/css/bootstrap.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<jsp:useBean id="dao" class="cyb.cybnet.dao.impl.BookDAOImpl"></jsp:useBean>
	<c:set var="list" value="${dao.getBookListByName(param.title)}"></c:set>
	<div class="col-md-10 col-md-offset-1">
	<div class="panel panel-default">
      <div class="panel-heading">
        <b>Books Found</b>
      </div>
	<table class="table table-hover">
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>Publication</th>
				<th>Genre</th>
				<th>Options</th>
			</tr>
			<c:if test="${empty list}">
			<tr>
					<td colspan="5">Sorry, no such book found!</td>
			</tr>
			</c:if>
			<c:forEach var="book" items="${list}">
				
				<tr>
					<td>${book.bookTitle}</td>
					<td>${book.bookAuthor}</td>
					<td>${book.bookPublication}</td>
					<td>${book.bookGenre}</td>
					<td>
					<a class="btn btn-primary btn-sm" href='ShowDescription.jsp?bookId=${book.bookId}'>description</a>
					<a class="btn btn-warning btn-sm" href='AddReview.jsp?bookId=${book.bookId}'>write review</a>
					<c:if test="${sessionScope.user.userRole.equals('admin')}">
						<a class="btn btn-danger btn-sm" href='admin/DeleteBook.jsp?bookId=${book.bookId}' >Delete</a>
					</c:if>	
				</td>
				</tr>
				
			</c:forEach>
			</table>
	</div>
	
</div>
</body>
</html>