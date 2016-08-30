<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>立体按钮</title>
<style type="text/css"> 
body { 
font-family: Arial, sans-serif; 
} 
#container { 
margin: 120px auto; 
text-align: center; 
} 
.button { 
-webkit-transform: rotateX( 35deg ); 
position: relative; 
display: inline-block; 
width: 100px; 
padding: 42px 15px; 
margin: 0px 10px; 
background-color: #C91826; 
color: #fff; 
font-weight: bold; 
font-size: 25px; 
text-decoration: none; 
text-align: center; 
text-shadow: 0px -1px 0px rgba(0,0,0,0.5); 
border: 1px solid; 
border-color: #B21522; 
border-radius: 78px; 
-moz-border-radius: 78px; 
-webkit-border-radius: 78px; 
box-shadow: inset 0px -4px 5px rgba(255,255,255,0.2), 
inset 0px 1px 5px rgba(255,255,255,0.2), 
/**/ 
0px 12px 0px #231F20, 
0px 14px 0px #231F20, 
0px 16px 0px #231F20, 
/**/ 
0px 8px 5px rgba(0,0,0,0.5); 
-moz-box-shadow: inset 0px -4px 5px rgba(255,255,255,0.2), 
inset 0px 1px 5px rgba(255,255,255,0.2), 
/**/ 
0px 12px 0px #231F20, 
0px 14px 0px #231F20, 
0px 16px 0px #231F20, 
/**/ 
0px 8px 5px rgba(0,0,0,0.5); 
-webkit-box-shadow: inset 5px -4px 5px rgba(255,255,255,0.2), 
inset 5px 1px 5px rgba(255,255,255,0.2), 
/**/ 
0px 12px 0px #231F20, 
0px 14px 0px #231F20, 
0px 16px 0px #231F20; 
} 
.button:hover { 
background-color: #B21522; 
color: #e3e3e3; 
} 
.button:active { 
top: 8px; 
box-shadow: inset 0px 4px 5px rgba(255,255,255,0.4), 
inset 0px -1px 5px rgba(255,255,255,0.2), 
/**/ 
0px 8px 0px #231F20, 
/**/ 
0px 9px 5px rgba(0,0,0,0.5); 
-moz-box-shadow: inset 0px 4px 5px rgba(255,255,255,0.4), 
inset 0px -1px 5px rgba(255,255,255,0.2), 
/**/ 
0px 8px 0px #231F20, 
/**/ 
0px 9px 5px rgba(0,0,0,0.5); 
-webkit-box-shadow: inset 0px 4px 5px rgba(255,255,255,0.4), 
inset 0px -1px 5px rgba(255,255,255,0.2), 
/**/ 
0px 8px 0px #231F20, 
/**/ 
0px 9px 5px rgba(0,0,0,0.5); 
} 
</style>
</head>
<body>

<div id="container"> 
<a href="<%=path %>/classes/allyk?lx=空" class="button">预定报名收费</a> 
<a href="<%=path %>/classes/allyk?lx=预科班" class="button">第一学期收费</a> 
<a href="<%=path %>/classes/allyk?lx=第一学期" class="button">第二学期收费</a> 
<a href="<%=path %>/classes/allyk?lx=第二学期" class="button">第三学期收费</a>
<a href="<%=path %>/classes/allyk?lx=第三学期" class="button">第四学期收费</a> 
</div> 

<!-- <input style="BORDER-TOP-WIDTH: 5px; 
			  BORDER-LEFT-WIDTH: 5px; 
			  FONT-SIZE: 6px; 
			  BACKGROUND: #555; 
			  BORDER-BOTTOM-WIDTH: 5px; 
			  COLOR: #eee; 
			  BORDER-RIGHT-WIDTH: 5px;
			  padding:5px;" 
			  type="button" name="button" value="立体按钮" /> -->

</body>
</html>