<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SDU MAP</title>

        <!-- CSS -->
       
         <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->

  </head>
  <%
  String s="请输入邮箱和密码";
  if(request.getParameter("status")!=null){
  System.out.println("cao");
  s="<font color='red'>密码错误，请重新输入</font>";
  }
  else{
   System.out.println("shit");
   //s="<font color='red'>密码错误，请重新输入</font>";
  }
   %>

  <body>
  <!-- 
   <form action="servlet/LoginServlet" method="post">
   邮箱<input type="text" name="email"><br>
   密码<input type="password" name="password"><br>
   <input type="submit" value="确认">
   <input type="reset" value="取消">
   </form>
    -->

 <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>山大</strong> 地图</h1>
                            <h2>SDU MAP</h2>
                            <div class="description">
                            	<p>
	                            	<strong>涵盖山东大学济南市六大校区、青岛校区、威海校区的地图</strong>
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登录</h3>
                            		<p><%=s %></p>
                        		</div>
                        		<div class="form-top-right">
                        			<img src="assets/ico/sdu2.jpg" />
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="servlet/LoginServlet" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">邮箱</label>
			                        	<input type="text" name="email" placeholder="邮箱..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="password">password</label>
			                        	<input type="password" name="password" placeholder="密码..." class="form-password form-control" id="form-password">
			                        </div>
			                        
			                        <button type="submit" class="btn btn-primary btn-lg btn-block">登&nbsp&nbsp&nbsp&nbsp录</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3 ><strong><a href="SignIn.jsp">我看你骨骼惊奇，注册一个账号吧>></a></strong></h3>
                        	<h3 ><strong><a href="cxmapTemp.jsp">放过我吧，我就逛逛>></a></strong></h3>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
   
  </body>
</html>
