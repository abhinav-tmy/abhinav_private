package cyb.cybnet.filters;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyb.cybnet.dao.UserDAO;
import cyb.cybnet.dao.impl.UserDAOImpl;
import cyb.cybnet.dto.User;
import cyb.cybnet.exception.UserDAOException;
import cyb.cybnet.util.DBUtility;

/**
 * Servlet Filter implementation class ValidationFilter
 */
@WebFilter(urlPatterns="/LoginServlet")
public class LoggingFilter implements Filter {
	PrintWriter logWriter;


	public void destroy() {
		System.out.println("closing logger");
		logWriter.close();
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			chain.doFilter(request, response);	
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpSession session = httpRequest.getSession(false);
			
			if(session!=null && session.getAttribute("user")!=null && (boolean)session.getAttribute("newSession")==true){
				session.setAttribute("newSession", false);
				User user = (User) httpRequest.getSession().getAttribute("user");
				logWriter.print(user.getUserName() + " logged in at " + new Date().toLocaleString() + "\n");
				logWriter.flush();
				
			}
			

	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("initializing logger");
		try {
			ServletContext context = fConfig.getServletContext();
			System.out.println(context.getRealPath(""));
			logWriter = new PrintWriter(new FileOutputStream(context.getRealPath("")+File.separator+"log.txt", true));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
