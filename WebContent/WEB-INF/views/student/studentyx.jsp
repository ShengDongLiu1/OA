<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
	<!-- 表格 -->
	<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/stu/yx-queryAllyx', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'intenid',checkbox:true,width:100">编号</th>
				<th data-options="field:'intenname',width:100">名称</th>
				<th data-options="field:'intensch',width:100">就读学校</th>
				<th data-options="field:'intensex',width:100">性别</th>
				<th data-options="field:'intenbir',width:100">出生年月</th>
				<th data-options="field:'intenmz',width:100">民族</th>
				<th data-options="field:'intenjg',width:100">籍贯</th>
				<th data-options="field:'intentel',width:100">学生号码</th>
				<th data-options="field:'intenfat',width:100">家长姓名</th>
				<th data-options="field:'intenfatel',width:100">学生家长号码</th>
				<th data-options="field:'intenaddr',width:100">家庭住址</th>
				<th data-options="field:'intenpeo',width:100">就读疑问</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="addClas();" data-options="iconCls:'icon-add'" >添加</a>
	</div>
	<script type="text/javascript">
		$(function() {
			setPagination("list");
		});
		// 显示数据
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageList:[5,10, 15,20],
				beforePageText:"第",
				afterPageText:"页    共{pages}页",
				displayMsg:"当前显示{from} - {to} 条记录    共{total}条记录",
				onBeforeRefresh:function() {
					$(this).pagination("loading");
					$(this).pagination("loaded");
				}
			});
		}
		
		function addClas() {
			var row = $("#list").datagrid("getSelected");
			if (row) {
				$.post("deleteyx",{'studentyx.intenid':row.intenid}, function(data) {
							if (data.result.result == "success") {
								$.messager.alert("提示", data.result.msg, "info",
										function() {
											$("#list").datagrid("reload");
										});
							}
						}, "JSON");
					}
			$("#list").datagrid('reload');
		}
	</script>
</body>
</html>