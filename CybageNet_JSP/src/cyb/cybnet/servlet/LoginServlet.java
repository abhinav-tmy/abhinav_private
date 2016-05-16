package cyb.cybnet.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyb.cybnet.dao.UserDAO;
import cyb.cybnet.dao.impl.UserDAOImpl;
import cyb.cybnet.dto.User;
import cyb.cybnet.exception.UserDAOException;
import cyb.cybnet.util.DBUtility;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDao;

	@Override
	public void init() throws ServletException {
		userDao = new UserDAOImpl(DBUtility.getConnection());
	}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		try {
			// if login request
			User user = userDao.getUser(new User(request.getParameter("user")));
		
			// check password
			if (user.getUserPass().equals(request.getParameter("pass"))) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setAttribute("newLogin", true);
				response.sendRedirect("index.jsp");
			} else {
				request.setAttribute("msg", "Invalid username or password"); 
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		}
		// if user not found in the data base
		catch (UserDAOException ex) {
			request.setAttribute("msg", "Invalid username or password");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			
		}
		// for any other exception
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
