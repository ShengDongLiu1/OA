<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奖惩管理</title>
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
		url:'<%=path %>/rawpun/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'jid',width:100">ID</th>
				<th data-options="field:'jstuid',width:100">奖惩对象</th>
				<th data-options="field:'jtitle',width:100">奖惩标题</th>
				<th data-options="field:'jcontent',width:100">奖惩内容</th>
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
			  			<td>奖惩对象:</td>
			  			<td><input class="easyui-textbox" name="rawpun.jstuid" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>奖惩标题:</td>
			  			<td><input class="easyui-textbox" name="rawpun.jtitle" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>奖惩内容:</td>
			  			<td><input class="easyui-textbox" name="rawpun.jcontent" data-options="required:true" /></input></td>
			  		</tr>
				</table>
				<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();" style="width:80px">添加</a>
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="Winclose('addWindow')" style="width:80px">取消</a>
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
					<td>ID</td>
					<td>
						<input class="textbox" name="jid" id="rjid" readonly />
					</td>
				</tr>
				<tr>
					<td>奖惩对象</td>
					<td>
						<input class="easyui-validatebox textbox" name="jstuid" id="rjstuid" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>奖惩标题</td>
					<td>
						<input class="easyui-validatebox textbox" name="jtitle" id="rjtitle"  data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>奖惩内容</td>
					<td>
						<input class="easyui-validatebox textbox" name="jcontent" id="rjcontent" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="Winclose('editWindow')" style="width:80px">取消</a>
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
				$.post('rawpun/add',$("#ff").serialize(),
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
				var jid = $("#rjid").val();
				var jstuid = $("#rjstuid").val();
				var jtitle = $("#rjtitle").val();
				var jcontent = $("#rjcontent").val();
				
				//alert(did+"  "+eid +" "+ddatetime+" "+drange+" "+ddesc);
				$.get('rawpun/update',{'rawpun.jid':jid,'rawpun.jstuid':jstuid,'rawpun.jtitle':jtitle,'rawpun.jcontent':jcontent},
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
						$.post("rawpun/delete",{'rawpun.jid':row.jid}, function(data) {
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
		function Winclose(c) {
			$("#"+c).window("close");
		}
	</script>
</body>
</html>