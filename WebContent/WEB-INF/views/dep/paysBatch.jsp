<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
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
<title>批量发放工资</title>
</head>
<body>
	<div>
		<div>
			<div style="float: left;margin-top: 20px;margin-left: 30px;"><a href="<%=path %>/pays/all" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">返回工资列表</a></div>
			<div style="float: left;"><h2 style="margin-left: 180px;">批量发放员工工资</h2></div>
			<p style="clear:both;"></p>
		</div>
		<hr/>
		<form id="addsForm" >
			<c:forEach items="${requestScope.depList }" var="depGz">
				<div style="margin-bottom:20px; padding-left: 20px; ">
					<input name="depid" value="${depGz.getId()  }" type="hidden" >
					<span style="font-size: 13px;">员工姓名：</span><input class="easyui-textbox" disabled="disabled" value="${depGz.getName() }" style="font-size:15px; width:60px;height:32px">
					<span style="margin-left:25px; font-size: 13px;">奖励金额：</span><input class="easyui-validatebox easyui-numberbox" data-options="required:true,precision:2" name="paysa" style="font-size:15px; width:100px;height:32px">
					<span style="margin-left:25px; font-size: 13px;">惩罚金额：</span><input class="easyui-validatebox easyui-numberbox" data-options="required:true,precision:2" name="paysb" style="font-size:15px; width:100px;height:32px">
				</div>
				<div style="margin-bottom:20px; padding-left: 20px; ">
					<span style="margin-left:158px; font-size: 13px;">基本工资：</span><input class="easyui-validatebox easyui-numberbox" data-options="required:true,precision:2" name="payssta" style="font-size:15px; width:100px;height:32px">
					<span style="margin-left:25px; font-size: 13px;">补贴工资：</span><input class="easyui-validatebox easyui-numberbox" data-options="required:true,precision:2" name="paysc" style="font-size:15px; width:100px;height:32px">
				</div>
				<div style="margin-bottom:20px; padding-left: 20px; ">
					<span style="margin-left:158px; font-size: 13px;">奖罚原因：</span>
					<textarea id="xgwordtext" name="payspro" style="width:300px;height:50px;"></textarea>
				</div>
				<hr/>
			</c:forEach>
			<br/>
			<div style="margin-left: 350px;" >
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="adds();" style="width:200px">确认添加</a>
			</div>
		</form>
	</div>
	<br/>
	<script type="text/javascript">
		function adds(){
			$.post('<%=path %>/pays/BatchAdd',
				$("#addsForm").serialize(),
				function(data){
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							window.location.href="<%=path %>/pays/all";
						});
					} else {
						$.messger.alert("提示", data.msg, "info");
					}
				}
			,"JSON");
		}
	</script>
</body>
</html>