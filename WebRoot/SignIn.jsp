<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>SDU MAP Sign Up</title>
    
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
  </head>
  <%
  String s="请输入邮箱，昵称和密码";
  if(request.getParameter("status")!=null){
  System.out.println("cao");
  s="<font color='red'>该邮箱已被注册，请重新注册！</font>";
  }
  else{
   System.out.println("shit");
   //s="<font color='red'>密码错误，请重新输入</font>";
  }
   %>
  
  <body>
  <!--  
    <form action="servlet/SignupServlet" method="post">
   用户名<input type="text" name="username"><br>
   邮箱<input type="text" name="email"><br>
   密码<input type="password" name="password"><br>
   
   <input type="submit" value="注册">
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
                        			<h3>注册</h3>
                            		<p>请输入邮箱，昵称和密码</p>
                        		</div>
                        		<div class="form-top-right">
                        			<img src="assets/ico/sdu2.jpg" />
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="servlet/SignupServlet" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="email">username</label>
			                        	<input type="text" name="email" placeholder="邮箱..." class="form-username form-control" id="form-username" required />
			                        </div>
			                         	<div class="form-group">
			                    		<label class="sr-only" for="username">realname</label>
			                        	<input type="text" name="username" placeholder="昵称..." class="form-username form-control" id="form-username" required />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="password">password</label>
			                        	<input type="password" name="password" placeholder="密码..." class="form-password form-control" id="password" required />
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Repassword</label>
			                        	<input type="password" name="form-password" placeholder="确认密码..." class="form-password form-control" id="password2" onkeyup="isPwdRight()" />
                                                                <span id="warn"></span>
			                        </div>
			                        <button type="submit" class="btn btn-primary btn-lg btn-block" id="submit" onclick="isEmailOk()">注&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp册</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script type="text/javascript">
            function isPwdRight(){
                var v1=document.getElementById("password").value;
                var v2=document.getElementById("password2").value;
                if(v1 != v2){
                    document.getElementById("warn").innerHTML="<font color='red'>两次密码不一致！</font>"
                    document.getElementById("submit").disabled=true;
                }
                else{
                    document.getElementById("warn").innerHTML="";
                    document.getElementById("submit").disabled=false;
                }
            }
            function isEmailOk(){
            	var v1=document.getElementById("email").value;
            	if(v1==null)
            	document.getElementById("warn").innerHTML="测试email通过";
            }
        </script>

        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
  </body>
</html>
