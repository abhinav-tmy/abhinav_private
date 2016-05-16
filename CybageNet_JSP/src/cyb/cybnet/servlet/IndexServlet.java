package cyb.cybnet.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cyb.cybnet.dto.User;
import cyb.cybnet.listeners.MySessionListener;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		User user = (User)request.getSession().getAttribute("user");
		pw.write("<!DOCTYPE html>"+
"<html>"+
"<head>"+
"<meta charset='ISO-8859-1'>"+
"<title>Cybage Net</title>"+
"<link rel='stylesheet' type='text/css' href='res/css/base.css'>"+
"</head>"+
"<body>"+
	"<div class='topright'>");
		
		if(user.getUserRole().equals("admin")){
			pw.write("<a class='top-option' href='admin/AddBook.html' >Add new book</a>");
			pw.write("<a class='top-option left' href='log.txt' >Show Logs</a>");
		}
pw.write(
	"<span class='top-option-disabled'>Hello, "+user.getUserName()+"</span>"+
		"<a class='top-option' href='LogoutServlet' >Logout</a>"+
	"</div>");

if(user.getUserRole().equals("admin")){
	pw.write("<div class='notif'>Currently Logged in : "+MySessionListener.getSessionCount()+" users</div>");
}
if(request.getCookies()!=null && request.getCookies().length>1 ){
	pw.write("<div class='notif'>This is your : "+request.getCookies()[1].getValue()+" visit</div>");
}
pw.write(
		
"<br>"+
"<br>"+
"<br>"+
"<br>"+
"<br>"+
"<br>"+
"<br>"+
"<br>"+
"<br>"+
	"<div class='center'>"+
		"<span class='logo' >Cybage Net</span>"+
		"<br>"+
		"<span class='sublogo' >books . reviews . fun</span>"+
		"<br>"+
		"<form method='get' action='SearchBookServlet'>"+
			"<br>"+
			"<input class='base-size search' type='text' placeholder='type name here ...' name='title'><br>"+
			"<br>"+
			"<input class='base-size' type='submit' value='search'>"+
		"</form>"+
	"</div>"+
"</body>"+
"</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
