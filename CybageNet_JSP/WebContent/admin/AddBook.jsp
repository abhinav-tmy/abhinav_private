<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
<script src="../res/js/jquery.min.js"></script>
<script src="../res/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="../res/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../res/css/bootstrap_base.css">

</head>
<body>
	<%@include file="../header.jsp" %>
	
	<form action="#" method="post" class="form">
	<div class="col-lg-10 col-lg-offset-1">
	<div class="panel panel-default">
      <div class="panel-heading">
        <b>Add Book Form</b>
      </div>
      <div class="panel-body">
        
        <div class="form-group col-xs-6">
        	<label >Title</label>
        	<input type="text" class="form-control" placeholder="Angular JS Novice to Ninja" name="bookTitle" required="required" autofocus="autofocus"/>
    	</div>
 		<div class="form-group col-xs-6">
        	<label>Author</label>
        	<input type="text" class="form-control" placeholder="Sandeep Pandey" name="bookAuthor" required="required" autofocus="autofocus"/>
    	</div>       
		<div class="form-group col-xs-6">
        	<label>ISBN Code</label>
        	<input type="number" class="form-control" placeholder="7896541223" name="bookISBN" required="required" autofocus="autofocus"/>
    	</div>
    	<div class="form-group col-xs-6">
        	<label>Number of pages</label>
        	<input type="number" class="form-control" placeholder="305" name="bookNOP" required="required" autofocus="autofocus"/>
    	</div>	
		<div class="form-group col-xs-6">
        	<label>Publication</label>
        	<input type="text" class="form-control" placeholder="Site Point" name="bookPublication" required="required" autofocus="autofocus"/>
    	</div>
    	<div class="form-group col-xs-6">
        	<label>Genre</label>
        	<input type="text" class="form-control" placeholder="Technical" name="bookGenre" required="required" autofocus="autofocus"/>
    	</div>	
      
    	<div class="form-group">
        	<label>Description</label>
        	<textarea  class="form-control" cols="100" rows="5" placeholder="AngularJS is an open source JavaScript framework that lets you create amazing AJAX-based web apps. Generally, the complexity involved in building large-scale and complex AJAX apps is tremendous. AngularJS aims to minimize this complexity by offering a great environment for development, as well as the means to test your apps" name="bookDescription" required="required"></textarea>
    	</div>
    </div>
      <div class="panel-footer">
        <input class="btn btn-primary" type="submit" value="add book"> 
		<input class="btn btn-default" type="reset" value="clear">
      </div>
      </div>
      </div>
      </form>
	
	
	<c:if test="${param.bookTitle!=null && !param.bookTitle.isEmpty()}">
		<jsp:useBean id="bookBean" class="cyb.cybnet.dto.Book"></jsp:useBean>
		<jsp:setProperty property="*" name="bookBean"/>
	 	<jsp:useBean id="dao" class="cyb.cybnet.dao.impl.BookDAOImpl"></jsp:useBean>
		${dao.addBook(bookBean)}
		<c:set var="msg" value="Book Added Successfully!" scope="session"></c:set>
		<c:set var="msgType" value="success" scope="session"></c:set>
			
	</c:if> 
	
</body>
</html>