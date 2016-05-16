package cyb.cybnet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cyb.cybnet.dao.BookDAO;
import cyb.cybnet.dao.impl.BookDAOImpl;
import cyb.cybnet.dto.Book;
import cyb.cybnet.exception.BookDAOException;
import cyb.cybnet.util.DBUtility;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/admin/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book b = new Book();
		
		b.setBookTitle(request.getParameter("title"));
		b.setBookAuthor(request.getParameter("author"));
		b.setBookDescription(request.getParameter("desc"));
		b.setBookGenre(request.getParameter("genre"));
		b.setBookISBN(Integer.parseInt(request.getParameter("isbn")));
		b.setBookNOP(Integer.parseInt(request.getParameter("nop")));
		b.setBookPublication(request.getParameter("pub"));
		
		byte[] bytes = new byte[1];
		b.setBookCover(bytes);
		
		BookDAO bookDAO = new BookDAOImpl(DBUtility.getConnection());
		RequestDispatcher rd = request.getRequestDispatcher("AddBook.html");
		PrintWriter pw = response.getWriter();
		rd.include(request, response);
		
		try {
			bookDAO.addBook(b);
			pw.write("<center><span style='color:green'>Book Added Sucessfully</span><center>");
			
		}
		catch(BookDAOException ex){
			pw.write("<center><span style='color:red'>"+ex.getMessage()+"</span><center>");
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			pw.write("<center><span style='color:red'>Some internal error occured</span><center>");
		}
	}

}
