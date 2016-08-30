<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>研讨会</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
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
			$.get('<%=path%>/dis/add',$("#ff").serialize(),
				function(data) {
				if (data.result.result == 'success') {
					$.messager.alert("提示", data.result.msg, "info", function() {
						$("#addWindow").window("close");
						$("#list").datagrid("reload");
						$("#ff").form("clear");
					});
				} else { $.messger.alert("提示", data.result.msg, "info");}
			},"JSON");
		}
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
			var discom = $("#editDiscom").val();
			var empid = $("#editEmpid").val();
			var dispro = $("#editDispro").val();
			var diskey = $("#editDiskey").val();
			var disid = $("#disid").val();
			$.get('dis/update',{'dis.disid':disid,'dis.discom':discom,'dis.empid':empid,'dis.dispro':dispro,'dis.diskey':diskey},
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
	}
	//删除
	function expurgate() {
		var row = $("#list").datagrid("getSelected");
		if (row) {
			$.messager.confirm("提示", "确认要删除这个条记录吗?", function(r) {
				if (r) {
					$.post("dis/delete",{'dis.disid':row.disid}, function(data) {
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
			$.messager.alert('提示', '请选中需要删除的消息', 'info');
		}
		$("#list").datagrid('reload');
	}
	// 关闭窗口
	function close(c) {
		alert("da");
		$("#"+c).window("close");
	}
	
</script>
<body>

	
	<!-- 表格 -->
	<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/dis/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'disid',checkbox:true,width:100">编号</th>
				<th data-options="field:'discom',width:100">研讨内容</th>
				<th data-options="field:'distime',width:100">研讨时间</th>
				<th data-options="field:'empid',width:100">主讲老师</th>
				<th data-options="field:'dispro',width:100">研讨问题</th>
				<th data-options="field:'diskey',width:100">解决方案</th>
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
			  			<td>研讨内容:</td>
			  			<td><input class="easyui-textbox" name="dis.discom" data-options="required:true,validType:'length[2,20]',novalidate:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>主讲教师:</td>
			  			<td><input class="easyui-textbox" name="dis.empid" data-options="required:true,validType:'length[1,10]',novalidate:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>研讨问题:</td>
			  			<td><input class="easyui-textbox" name="dis.dispro" data-options="required:true,validType:'length[5,10]',novalidate:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>解决方案:</td>
			  			<td><input class="easyui-textbox" name="dis.diskey" data-options="required:true,validType:'length[10,20]',novalidate:true" /></input></td>
			  		</tr>
				</table>
				<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();" style="width:80px">添加</a>
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWindow').dialog('close')" style="width:80px">取消</a>
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
					<td>研讨内容:</td>
					<td>
						<input class="easyui-validatebox textbox" name="discom" id="editDiscom" data-options="required:true,validType:'length[1,10]',novalidate:true" />
					</td>
				</tr>
				<tr>
					<td>主讲教师:</td>
					<td>
						<input class="easyui-validatebox textbox" name="empid" id="editEmpid" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
						<input class="easyui-validatebox textbox" name="disid" id="disid" type="hidden" />
					</td>
				</tr>
				<tr>
					<td>研讨问题:</td>
					<td>
						<input class="easyui-validatebox textbox" name="dispro" id="editDispro" data-options="required:true,validType:'length[1,10]',novalidate:true" /><!-- 由dataoptions指定验证的规则 --><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>解决方案:</td>
					<td>
						<input class="easyui-validatebox textbox" name="diskey" id="editDiskey" data-options="required:true,validType:'length[1,30]',novalidate:true" /><!-- 由dataoptions指定验证的规则 --><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#editWindow').dialog('close')" style="width:80px">取消</a>
			</div>
		</form>
		</div>
	</div>
	
</body>
</html>