<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>考勤表</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="/Automation/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/workcheck/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:20,
		fit:true">
    <thead>
    <tr>
        <th data-options="field:'wid',width:100" align="center">编号</th>
        <th data-options="field:'dep',width:100" formatter="forDepName" align="center">员工</th>
        <th data-options="field:'wdate',width:100" align="center">时间</th>
        <th data-options="field:'status',width:100" align="center">签到</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<script>
    function forDepName(value) {
        return value.ename;
    }
</script>
</body>
</html>