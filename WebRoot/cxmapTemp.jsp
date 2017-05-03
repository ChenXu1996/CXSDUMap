<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>SDU MAP</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- bootstrap start -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入 Bootstrap -->
	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
	<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
      <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
         <![endif]-->

        <style type="text/css">
      #container2{
        width: 100%;
        height: 680px;
        margin: 0px;
      }
      </style>
      <!-- bootstrap end -->
  </head>
  <%
  double longg=117.1385;;
  double la=36.666921;
  	if(request.getParameter("longg")!=null && request.getParameter("la")!=null)
  	{
  	longg=Double.valueOf(request.getParameter("longg"));
  	la=Double.valueOf(request.getParameter("la"));
  	}
  	System.out.println(longg);
   %>
  <body>
  <!-- 嵌入代码-->
     	<!-- start -->
     <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" 
					 data-target="#bs-example-navbar-collapse-1"> 
					 <span class="sr-only">Toggle navigation</span>
					 <span class="icon-bar"></span>
					 <span class="icon-bar"></span>
					 <span class="icon-bar"></span>
					 </button>
					  <a class="navbar-brand" href="#">SDU MAP</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">济南校区<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
								<li>
									 <a href="cxmapTemp.jsp?longg=117.060044&la=36.675719">中心校区</a>
								</li>
								<li>
									 <a href="cxmapTemp.jsp?longg=117.028475&la=36.651062">千佛山校区</a>
								</li>
								<li>
									 <a href="cxmapTemp.jsp?longg=117.017355&la=36.651738">趵突泉校区</a>
								</li>
								<li>
									<a href="cxmapTemp.jsp?longg=117.1385&la=36.666921">软件园校区</a>
								</li>
								<li>
									 <a href="cxmapTemp.jsp?longg=117.068241&la=36.687361">洪家楼校区</a>
								</li>
								<li>
									 <a href="cxmapTemp.jsp?longg=117.051132&la=36.601073">兴隆山校区</a>
									 
								</li>
								
							</ul>
						</li>
						<li>
							 <a href="cxmapTemp.jsp?longg=120.688263&la=36.361416">青岛校区</a>
						</li>
						<li>
							 <a href="cxmapTemp.jsp?longg=122.058248&la=37.532283">威海分校</a>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search" method="post" action="servlet/LoginServlet">
						<div class="form-group">
							<input type="text" class="form-control" name="email" placeholder="邮箱..."/>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password" placeholder="密码..."/>
						</div>
						 <button type="submit" class="btn btn-default">快速登录</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">你好啊，陌生人</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">戳我试试<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="UserLogin.jsp">我要登录</a>
								</li>
								<li>
									 <a href="SignIn.jsp">我要注册</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="http://weibo.com/u/3192841534">我要反馈</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
</div> 
 <div id="container2"></div>
			    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=d386849877713dc9ce4ef90b7b755c72"></script>
			    <script type="text/javascript">

					 
			        var v1=<%=longg %>;
			    	var v2=<%=la %>;
			    		
			        var map = new AMap.Map('container2',{
			            resizeEnable: true,
			            zoom: 18,
			            center: [v1,v2]
			        });
		map.plugin([ "AMap.ToolBar", 'AMap.Scale', 'AMap.OverView', 'AMap.MapType' ], function() {
							map.addControl(new AMap.ToolBar()); //左上角工具条
							map.addControl(new AMap.Scale()); //显示比例尺
							map.addControl(new AMap.OverView({
								isOpen : true
							})); //显示缩略图
							//map.addControl(new AMap.MapType()); //多种地图类型切换
						});
			       
    </script>
     	<!-- end -->
     	<script src="assets/js/jquery-1.11.1.min.js"></script>
     	<!-- 包括所有已编译的插件 -->
     	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
