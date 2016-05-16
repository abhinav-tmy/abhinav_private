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
import cyb.cybnet.dao.ReviewDAO;
import cyb.cybnet.dao.impl.BookDAOImpl;
import cyb.cybnet.dao.impl.ReviewDAOImpl;
import cyb.cybnet.dto.Book;
import cyb.cybnet.dto.Review;
import cyb.cybnet.dto.User;
import cyb.cybnet.exception.BookDAOException;
import cyb.cybnet.exception.ReviewDAOException;
import cyb.cybnet.util.DBUtility;

/**
 * Servlet implementation class ShowDescription
 */
@WebServlet("/AddReviewServlet")
public class AddReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User)request.getSession().getAttribute("user");
		int bkId = Integer.parseInt(request.getParameter("bk_id"));
		
		ReviewDAO reviewDao = new ReviewDAOImpl(DBUtility.getConnection());
		
		RequestDispatcher rd = request.getRequestDispatcher("/CybageNet_JSP/AddReviewServlet?id="+bkId);
		PrintWriter pw = response.getWriter();
		
		try {
			reviewDao.addReview(new Review(user.getUserId(), request.getParameter("review"), bkId));
			response.sendRedirect("/CybageNet_JSP/ShowDescription.jsp?bookId="+bkId);
		} catch (SQLException e) {
			rd.include(request,response);
			pw.write("<center><span style='color:red'>Some internal error has occured</span><center>");
			e.printStackTrace();
		} catch (ReviewDAOException ex) {
			rd.include(request,response);
			pw.write("<center><span style='color:red'>"+ex.getMessage()+"</span><center>");
			ex.printStackTrace();
		}
	}

}
