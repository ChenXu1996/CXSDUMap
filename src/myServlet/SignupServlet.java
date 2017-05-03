package myServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

import entities.User;

public class SignupServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SignupServlet() {
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
		
		String s1=request.getParameter("username");
		String s2=request.getParameter("password");
		String s3=request.getParameter("email");
		User user=new User();
		user.setUsername(s1);
		user.setPassword(s2);
		user.setEmail(s3);
		user.setId(this.generateId());
		user.setLogin(false);
		
		UserDao udo=new UserDao();
		try {
			if(udo.isSignUpSuccess(user)){
				HttpSession session=request.getSession();
				session.setAttribute("username", user.getUsername());
				request.getRequestDispatcher("../cxmap.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("../SignIn.jsp?status=wrong").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String generateId(){
		SimpleDateFormat df=new SimpleDateFormat("MMddHHmmss");
		String s=df.format(new Date());
		return s;
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
