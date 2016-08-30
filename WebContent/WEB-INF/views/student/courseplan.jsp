<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>课程进度管理</title>
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
	<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/courseplan/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'kid',checkbox:true,width:100">编号</th>
				<th data-options="field:'dep',width:100" formatter="formatterDepName">教师</th>
				<th data-options="field:'course',width:100" formatter="formatterCoureseName">课程</th>
				<th data-options="field:'content',width:100">讲课内容</th>
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
			  			<td>课程:</td>
			  			<td><input class="easyui-combobox" id="objectid" name="cplan.course.objectid" data-options="required:true" ></input></td>
			  		</tr>
			  		
			  		<tr>
			  			<td>讲课内容:</td>
			  			<td><input class="easyui-textbox" id="content" name="cplan.content" data-options="required:true" ></input></td>
			  		</tr>
				</table>
				<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();" style="width:80px">添加</a>
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeAdd();" style="width:80px">取消</a>
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
					<td>编号:</td>
					<td>
						<input class="easyui-textbox" id="ki" name="cplan.kid" data-options="required:true" readonly ></input>
					</td>
				</tr>
		  		<tr>
		  			<td>课程:</td>
		  			<td><input class="easyui-combobox" id="ob" name="cplan.course.objectid" data-options="required:true" ></input></td>
		  		</tr>
		  		
		  		<tr>
		  			<td>讲课内容:</td>
		  			<td><input class="easyui-textbox" id="co" name="cplan.content" data-options="required:true" ></input></td>
		  		</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeEdit();" style="width:80px">取消</a>
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
			$("#objectid").combobox({
				url:"<%=path%>/courseplan/object",
				method:'get',
			    valueField:'id',
			    textField:'name',
			    panelHeight:'auto',
			    onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#objectid').combobox('getData');
	                if (data.length > 0) {
	                    $("#objectid").combobox('select', data[0].id);
	                }
	            }
			});
			
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		 function add(){
			if($("#ff").form("validate")){
				$.get('courseplan/add',
					$("#ff").serialize(),
					function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#addWindow").window("close");
							$("#list").datagrid("reload");
							$("#ff").form("clear");
						});
					} else {
						$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
					}
				},"JSON");
			}
			
		} 
		
		 function closeAdd(){
		 	$("#addWindow").window("close");
			$("#list").datagrid("reload");
			$("#ff").form("clear");
		 }
		// 打开编辑窗口
		function editOpen() {
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
			if (row) {
				$("#ob").combobox({
					url:"<%=path%>/courseplan/object",
					method:'get',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto',
				}); 
				$("#ob").combobox("setValue", row.course.objectname);
				$("#ob").combobox("select", row.course.objectid);
				$("#emp").combobox("setValue", row.dep.ename);
				$("#emp").combobox("select", row.dep.eid);
				$("#ki").textbox("setValue", row.kid);
				$("#co").textbox("setValue", row.content); 
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			if($("#editForm").form("validate")){
				$.post('courseplan/update',$("#editForm").serialize(),
					function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#editWindow").window("close");
							$("#list").datagrid("reload");
							$("#editForm").form("clear");
						});
					} else {
						$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
					}
				},"JSON");
			}
		}
		
		function closeEdit(){
			$("#editWindow").window("close");
			$("#list").datagrid("reload");
			$("#editForm").form("clear");
		}
		//删除
		function expurgate() {
			var row = $("#list").datagrid("getSelected");
			if (row) {
				$("#editForm").form("load", row);
				$.post('courseplan/delete',{'cplan.kid':row.kid},"JSON");
				$("#list").datagrid('reload');
				$.messager.show({
					title:'提示消息',
					msg:'删除成功',
					showType:'show'
				});
				$("#list").datagrid('reload');
			} else {
				$.messager.alert('提示', '请选中需要删除的选项', 'info');
			}
			$("#list").datagrid('reload');
		}
		
		function formatterDepName(value){
			return value.ename;
		}
		function formatterCoureseName(value){
			return value.objectname;
		}
		
	</script>
</body>
</html>