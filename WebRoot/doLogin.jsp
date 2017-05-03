<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); 

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	%>
<jsp:useBean id="loginUser" class="entities.User" scope="page" />
<jsp:useBean id="userDao" class="dao.UserDao" scope="page" />
<jsp:setProperty property="*" name="loginUser"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login success!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    
    <% 
    String s=request.getParameter("email");
    if(s==null)
    s=""; 
    session.setAttribute("email", s);
    %> 
    welcome<%=s %>
    <br>
    <a href="login_success.jsp">here!!</a>
  </body>
</html>
<%
	/*
	if(userDao.isLogSuccess(username,password)){
		session.setAttribute("username", username);
		request.getRequestDispatcher("login_success.jsp").forward(request, response);
	}
	else{
		response.sendRedirect("UserLogin.jsp");
	}
	*/
%>
