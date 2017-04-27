<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="loginUser" class="entities.User" scope="page" />
<jsp:useBean id="userDao" class="dao.UserDao" scope="page" />
<jsp:setProperty property="*" name="loginUser"/>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String username=request.getParameter("username").toString();
	String password=request.getParameter("password").toString();
	
	if(userDao.isLogSuccess(username,password)){
		session.setAttribute("username", username);
		request.getRequestDispatcher("login_success.jsp").forward(request, response);
	}
	else{
		response.sendRedirect("UserLogin.jsp");
	}
%>
