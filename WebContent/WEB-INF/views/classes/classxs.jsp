<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.bt div{
		font-size:25px;
	}
	.textS{
		width: 500px;
		float: left;
		width: 450px;
		height: 45px;
		margin-top: 15px;
	}
	.zl{
		width: 100px;
		float: left;
	}
</style>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/mobile.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/demo.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生详情信息</title>
</head>
<body>
	<div class="easyui-navpanel">
		<div style="margin:20px 0 10px 0;"></div>
	    <div id="content" class="easyui-panel" data-options="footer:'#ft'" style="width:711px;height:600px;" 
	   	 data-options="headerCls:'bt'">
	   	 	<header>
				<div class="m-toolbar">
					<div class="m-left" style="margin-left: 60px;">
						<a href="<%=path%>/classes/query?classes.classid=${student.classes.classid}" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">返回学生列表</a>
					</div>
					<div><h2>学生详情信息</h2></div>
				</div>
			</header>
			<div style="padding:10px;margin-left: 50px;margin-top: 50px; ">
				<div class="zl"><h3>学生姓名:</h3></div><div class="textS"><s:property value="student.intenname"/></div><br/><br/>
				<div class="zl"><h3>就读学校:</h3></div><div class="textS"><s:property value="student.intensch"/></div><br/><br/>
				<div class="zl"><h3>学生性别:</h3></div><div class="textS"><s:property value="student.intensex"/></div><br/><br/>
				<div class="zl"><h3>学生爱好:</h3></div><div class="textS"><s:property value="student.intenhob"/></div><br/><br/>
				<div class="zl"><h3>出生年月:</h3></div><div class="textS"><s:property value="student.intenbir"/></div><br/><br/>
				<div class="zl"><h3>家长姓名:</h3></div><div class="textS"><s:property value="student.intenfat"/></div><br/><br/>
				<div class="zl"><h3>学生号码:</h3></div><div class="textS"><s:property value="student.intentel"/></div><br/><br/>
				<div class="zl"><h3>学生家长号码:</h3></div><div class="textS"><s:property value="student.intenfatel"/></div><br/><br/>
				<div class="zl"><h3>家庭住址:</h3></div><div class="textS"><s:property value="student.intenaddr"/></div><br/><br/>
				<div class="zl"><h3>就读疑问:</h3></div><div class="textS"><s:property value="student.intenpeo"/></div><br/><br/>
				<div class="zl"><h3>学生班级:</h3></div><div class="textS"><s:property value="student.classes.classname"/></div><br/><br/>
				<div class="zl"><h3>学生宿舍:</h3></div><div class="textS"><s:property value="student.hourse.hourname"/></div><br/><br/>
				<div class="zl"><h3>入学时间:</h3></div><div class="textS"><s:property value="student.intendate"/></div><br/><br/>
			</div>
	   	</div>
	   	<div id="ft" style="padding:5px;">
	    </div>
   	</div>
</body>
</html>