package myServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entities.User;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		UserDao udo=new UserDao();
		try {
			User u=udo.isLogSuccess(email, password);
			if(u!=null){
				HttpSession session=request.getSession();
				session.setAttribute("username", u.getUsername());
//				session.setMaxInactiveInterval(1000);
//				
//				Cookie cookie=new Cookie("sessionId",session.getId());
//				cookie.setMaxAge(1000);
//				response.addCookie(cookie);
				//session.setAttribute("username", username);
				//request.setAttribute("username",u.getUsername());
				//request.getRequestDispatcher("../cxmap.jsp").forward(request, response);
				request.getRequestDispatcher("../cxmap.jsp").forward(request, response);
			}
			else{
				//response.sendRedirect();
				request.getRequestDispatcher("../UserLogin.jsp?status=wrong").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
