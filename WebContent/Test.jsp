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
		url:'<%=path %>/test/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:100">编号</th>
				<th data-options="field:'name',width:100">名称</th>
				<th data-options="field:'nickname',width:100">昵称</th>
				<th data-options="field:'gender',width:100">性别</th>
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
			  	<table cellpadding="5">
			  		<tr>
			  			<td>Name:</td>
			  			<td><input class="easyui-textbox" id="name" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>NickName:</td>
			  			<td><input class="easyui-textbox" id="nickname" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>Gender:</td>
			  			<td><input class="easyui-textbox" id="gender" data-options="required:true" /></input></td>
			  		</tr>
				</table>
				<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();" style="width:80px">添加</a>
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="" style="width:80px">取消</a>
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
					<td>编号</td>
					<td>
						<input class="textbox" name="id" id="editId" readonly />
					</td>
				</tr>
				<tr>
					<td>姓名</td>
					<td>
						<input class="easyui-validatebox textbox" name="name" id="editName" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>昵称</td>
					<td>
						<input class="easyui-validatebox textbox" name="nickname" id="editNickname" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<input class="easyui-validatebox textbox" name="gender" id="editGender" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="" style="width:80px">取消</a>
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
				var name = $("#name").val();
				var nickname = $("#nickname").val();
				var gender = $("#gender").val();
				$.get('test/add',{'test.name':name,'test.nickname':nickname,'test.gender':gender},"JSON");
				$("#ff").form("clear");
				$("#addWindow").window("close");
				$('#list').datagrid("reload");
				$.messager.show({
					title:'提示消息',
					msg:'添加产品成功',
					showType:'show'
				});
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
				var id = $("#editId").val();
				var name = $("#editName").val();
				var nickname = $("#editNickname").val();
				var gender = $("#editGender").val();
				$.get('test/update',{'test.id':id,'test.name':name,'test.nickname':nickname,'test.gender':gender},"JSON");
				$("#editForm").form("clear");
				$("#editWindow").window("close");
				$('#list').datagrid("reload");
				$.messager.show({
					title:'提示消息',
					msg:'添加产品成功',
					showType:'show'
				});
			}
			$("#list").datagrid('reload');
		}
		//删除
		function expurgate() {
			var row = $("#list").datagrid("getSelected");
			if (row) {
				$("#editForm").form("load", row);
				$.post('test/delete',{'test.id':row.id},"JSON");
				$("#list").datagrid('reload');
				$.messager.show({
					title:'提示消息',
					msg:'删除产品成功',
					showType:'show'
				});
				$("#list").datagrid('reload');
			} else {
				$.messager.alert('提示', '请选中需要删除的产品', 'info');
			}
			$("#list").datagrid('reload');
		}
	</script>
</body>
</html>