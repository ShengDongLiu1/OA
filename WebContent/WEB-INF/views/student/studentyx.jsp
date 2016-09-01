<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>意向学生管理</title>
	<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
	<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
	<!-- 表格 -->
	<table id="list" class="easyui-datagrid" toolbar="#tb"
		data-options="
		url:'<%=path%>/stu/yx-queryAllyx', 
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
				<th data-options="field:'intensex',width:50">性别</th>
				<th data-options="field:'intenbir',width:100">出生年月</th>
				<th data-options="field:'intenmz',width:50">民族</th>
				<th data-options="field:'intenjg',width:100">籍贯</th>
				<th data-options="field:'intentel',width:100">学生号码</th>
				<th data-options="field:'intenfat',width:100">家长姓名</th>
				<th data-options="field:'intenfatel',width:100">学生家长号码</th>
				<th data-options="field:'intenaddr',width:100">家庭住址</th>
				<th data-options="field:'intenpeo',width:140">就读疑问</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton"
			onclick="addClas();" data-options="iconCls:'icon-add'">添加到预定学生</a>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addOpen();">添加意向学生</a>
	</div>

	<div id="addWindow" class="easyui-window" title="添加"
		data-options="closed:true,iconCls:'icon-add'" style="padding: 10px;">
		<div style="padding: 10px 60px 20px 60px">
			<form id="ff" method="post">
				<table>
					<tr>
						<td>学生名称:</td>
						<td><input class="easyui-textbox" name="studentyx.intenname"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>就读学校:</td>
						<td><input class="easyui-textbox" name="studentyx.intensch"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>学生性别:</td>
						<td><label>男</label>
								<input type="radio" id="intensex" name="studentyx.intensex" value="男" checked="checked" />
							<label>女</label>
								<input type="radio" id="intensex" name="studentyx.intensex" value="女" />
						</td>
					</tr>
					<tr>
						<td>学生年龄:</td>
						<td><input class="easyui-textbox" name="studentyx.intenage"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>民族：</td>
						<td><input class="easyui-textbox" name="studentyx.intenmz"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>籍贯:</td>
						<td><input class="easyui-textbox" name="studentyx.intenjg"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>出生年月:</td>
						<td><input class="easyui-datebox" value="1/1/1990"
							id="intenbir" name="studentyx.intenbir"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>家长姓名:</td>
						<td><input class="easyui-textbox" name="studentyx.intenfat"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>学生号码:</td>
						<td><input class="easyui-textbox" name="studentyx.intentel"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>学生家长号码:</td>
						<td><input class="easyui-textbox" name="studentyx.intenfatel"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>家庭住址:</td>
						<td><input class="easyui-textbox" name="studentyx.intenaddr"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>就读疑问:</td>
						<td><input class="easyui-textbox" name="studentyx.intenpeo"
							data-options="required:true" /></td>
					</tr>
				</table>
				<div data-options="region:'south',border:false"
					style="text-align: right; padding: 5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'" onclick="add();"
						style="width: 80px">添加</a> <a href="javascript:(0);"
						class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="Winclose('addWindow')" style="width: 80px">取消</a>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			setPagination("list");
		});
		// 显示数据
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageList : [ 5, 10, 15, 20 ],
				beforePageText : "第",
				afterPageText : "页    共{pages}页",
				displayMsg : "当前显示{from} - {to} 条记录    共{total}条记录",
				onBeforeRefresh : function() {
					$(this).pagination("loading");
					$(this).pagination("loaded");
				}
			});
		}
		// 打开添加窗口
		function addOpen() {
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		function add() {
			if ($("#ff").form("validate")) {
				$.get('stu/yx-add', $("#ff").serialize(), function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info",
								function() {
									$("#addWindow").window("close");
									$("#list").datagrid("reload");
									$("#ff").form("clear");
								});
					} else {
						$.messger.alert("提示", data.msg, "info");
					}
				}, "JSON");
			}
			$("#list").datagrid('reload');
		}
	</script>
</body>
</html>