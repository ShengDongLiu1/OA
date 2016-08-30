<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>谈心记录</title>
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
		url:'<%=path %>/says/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'sayid',checkbox:true,width:100">谈心编号</th>
				<th data-options="field:'sayface',width:100">谈心对象</th>
				<th data-options="field:'sayempid',width:100">策划人</th>
				<th data-options="field:'sayscon',width:100">谈心内容</th>
				<th data-options="field:'sayspro',width:100">谈心问题</th>
				<th data-options="field:'sysback',width:100">学生反馈</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'" >添加</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'" >编辑</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'" >删除</a>
	</div>
	<!-- 添加窗口 -->
	<div style="margin:20px 0;"></div>
	<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'" style="padding:10px;">
		<div style="padding:10px 60px 20px 60px">
			<form id="ff" method="post">
			  	<table>
					<tr>
			  			<td>谈心对象:</td>
			  			<td><input class="easyui-textbox" name="says.sayface" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>策划人:</td>
			  			<td><input class="easyui-textbox" name="says.sayempid" data-options="required:false" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>谈心内容:</td>
			  			<td><input class="easyui-textbox" name="says.sayscon" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>谈心问题:</td>
			  			<td><input class="easyui-textbox" name="says.sayspro" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生反馈:</td>
			  			<td><input class="easyui-textbox" name="says.sysback" data-options="required:true" /></input></td>
			  		</tr>
				</table>
				<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();" style="width:80px">添加</a>
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="close('addWindow')" style="width:80px">取消</a>
				</div>
			</form>
		</div>
	</div>
	<!-- 编辑窗口 -->
	<div style="margin:20px 0;"></div>
	<div id="editWindow" class="easyui-window" title="编辑" data-options="closed:true,iconCls:'icon-edit'" style="padding:10px;">
		<div style="padding:10px 60px 20px 60px">
			<form id="editForm">
			<table>
				<tr>
					<td>谈心编号</td>
						<td>
							<input class="textbox" name="sayid" id="ssayid" readonly />
						</td>
					</tr>
				<tr>
					<td>谈心对象</td>
					<td>
						<input class="textbox" name="sayface" id="ssayface" readonly />
					</td>
				</tr>
				<tr>
					<td>策划人</td>
					<td>
						<input class="easyui-validatebox textbox" name="sayempid" id="ssayempid" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>谈心内容</td>
					<td>
						<input class="easyui-validatebox textbox" name="sayscon" id="ssayscon" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>谈心问题</td>
					<td>
						<input class="easyui-validatebox textbox" name="sayspro" id="ssayspro" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>学生反馈</td>
					<td>
						<input class="easyui-validatebox textbox" name="sysback" id="ssysback" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="close('editWindow')" style="width:80px">取消</a>
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
		// 打开添加窗口
		function addOpen() {
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		function add(){
			if($("#ff").form("validate")){
				$.get('says/add',$("#ff").serialize(),
					function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#addWindow").window("close");
							$("#list").datagrid("reload");
							$("#ff").form("clear");
						});
					} else {
						$.messger.alert("提示", data.msg, "info");
					}
				},"JSON");
			}
			$("#list").datagrid('reload');
		} 

		// 打开编辑窗口
		function editOpen() {
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
			if (row) {
				$("#editForm").form("load", row);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			if($("#editForm").form("validate")){
				var sayid = $("#ssayid").val();
				var sayface = $("#ssayface").val();
				var sayempid = $("#ssayempid").val();
				var sayscon = $("#ssayscon").val(); 
				var sayspro = $("#ssayspro").val();
				var sysback = $("#ssysback").val();
				//alert(did+"  "+eid +" "+ddatetime+" "+drange+" "+ddesc);
				$.get('says/update',{'says.sayid':sayid,'says.sayface':sayface,'says.sayempid':sayempid,'says.sayscon':sayscon,'says.sayspro':sayspro,'says.sysback':sysback},
					function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#editWindow").window("close");
							$("#list").datagrid("reload");
						});
					} else {
						$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
					}
				},"JSON");
			}
			$("#list").datagrid('reload');
		}
		//删除
		function expurgate() {
			var row = $("#list").datagrid("getSelected");
			if (row) {
				$.messager.confirm("提示", "确认要删除这个产品吗？", function(r) {
					if (r) {
						$.post("says/delete",{'says.sayface':row.sayface}, function(data) {
							if (data.result.result == "success") {
								$.messager.alert("提示", data.result.msg, "info",
										function() {
											$("#list").datagrid("reload");
										});
							}
						},"JSON");
					}
				});
			
			} else {
				$.messager.alert('提示', '请选中需要删除的产品', 'info');
			}
		}
		// 关闭窗口
		function close(c) {
			alert("da");
			$("#"+c).window("close");
		}
	</script>
</body>
</html>