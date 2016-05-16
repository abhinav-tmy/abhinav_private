<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Review</title>
<link rel='stylesheet' type='text/css' href="res/css/bootstrap.css">
</head>
<body>
	<%@include file="header.jsp" %>
	
		<jsp:useBean id="bookDao" class="cyb.cybnet.dao.impl.BookDAOImpl"></jsp:useBean>
		<jsp:useBean id="book" class="cyb.cybnet.dto.Book"></jsp:useBean>
		<jsp:setProperty property="bookId" name="book"/>
		<c:set var="book" value="${bookDao.getBook(book)}"></c:set>
	
	<div class="col-md-10 col-md-offset-1">  
		<form action='AddReviewServlet' method='post'>
				<div class="panel panel-default">
      				<div class="panel-heading">
        				<b>Add Book Review</b>
      				</div>	
      			<div class="panel-body">		
					<input type='hidden' name='bk_id' value="${book.bookId}">
					<div class="form-group col-xs-6">
	        			<label >Title</label>
	        			<input type="text" disabled="disabled" class="form-control" value="${book.bookTitle}"/>
	    			</div>
					<div class="form-group col-xs-6">
	        			<label>Author</label>
	        			<input type="text" disabled="disabled" class="form-control disabled" value="${book.bookAuthor}"/>
	    			</div>
					<div class="form-group col-xs-6">
	        			<label>Publication</label>
	        			<input type="text" disabled="disabled" class="form-control disabled" value="${book.bookPublication}"/>
	    			</div>
					<div class="form-group col-xs-6">
	        			<label>Genre</label>
	        			<input type="text" disabled="disabled" class="form-control disabled" value="${book.bookGenre}"/>
	    			</div>
					<div class="form-group">
	        			<label>Review</label>
	        			<textarea cols='100' rows='10' name='review' class="form-control" required='required'></textarea>
	    			</div>
					</div>
					<div class="panel-footer">
	        			<input class="btn btn-primary" type="submit" value="add review"> 
						<input class="btn btn-default" type="reset" value="clear">
	     			 </div>
			</div>
		</form>
	</div>
</body>
</html>