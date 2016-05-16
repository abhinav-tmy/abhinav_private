<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Description</title>
<link rel='stylesheet' type='text/css' href="res/css/bootstrap.css">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<jsp:useBean id="dao" class="cyb.cybnet.dao.impl.BookDAOImpl"></jsp:useBean>
	<jsp:useBean id="myBook" class="cyb.cybnet.dto.Book"></jsp:useBean>
	<jsp:setProperty property="bookId" name="myBook" />
	<c:set var="book" value="${dao.getBook(myBook)}"></c:set>
	
	<jsp:useBean id="userDao" class="cyb.cybnet.dao.impl.UserDAOImpl"></jsp:useBean>
	<jsp:useBean id="revDao" class="cyb.cybnet.dao.impl.ReviewDAOImpl"></jsp:useBean>
	
	<div class="col-md-10 col-md-offset-1">
	
	<div class="panel panel-default">
      <div class="panel-heading">
        <b>Book Details</b>
      </div>
	<table class="table table-responsive" border='1'>
			<tr>
				<td>Title</td>
				<td>${book.bookTitle}</td>
			</tr>
			<tr>
				<td>Author</td>
				<td>${book.bookAuthor}</td>
			</tr>
			<tr>
				<td>ISBN Code</td>
				<td>${book.bookISBN}</td>
			</tr>
			<tr>
				<td>Number of pages</td>
				<td>${book.bookNOP}</td>
			</tr>
			<tr>
				<td>Publication</td>
				<td>${book.bookPublication}</td>
			</tr>
			<tr>
				<td>Description</td>
				<td>${book.bookDescription}</td>
			</tr>
			<tr>
				<td>Genre</td>
				<td>${book.bookGenre}</td>
			</tr>
		</table>
	</div>
	
	<div class="panel panel-default">
      <div class="panel-heading">
        <b>Book Reviews</b>
      </div>
	<c:set var="revList" value="${revDao.getReviewListByBook(book)}"></c:set>
	<div class="panel-body">
	
		<c:if test="${empty revList}">
			No reviews have been given for this book
		</c:if>
		<c:forEach var="rev" items="${revList}">
				<jsp:useBean id="user" class="cyb.cybnet.dto.User"></jsp:useBean>
				<jsp:setProperty property="userId" name="user" value="${rev.reviewBy}"/>				
		       
		        <div class="panel panel-default">
      				<div class="panel-heading">
        				<b>${userDao.getUserById(user).userName}</b>
      				</div>
      				<div class="panel-body">
      					${rev.reviewReview}
      				</div>
      			</div>	
		
		</c:forEach>
		</div>
	</div>
	</div>
	</div>
</body>
</html>