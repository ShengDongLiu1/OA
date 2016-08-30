<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品申购</title>
<link rel="stylesheet" href="<%=path%>/js/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path%>/css/site_main.css" />
<link rel="stylesheet" type="text/css" href="/Automation/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/site_easyui.js"></script>
</head>
<body>
	<!-- 表格 -->
	<table id="list" class="easyui-datagrid" toolbar="#tb"
		data-options="
		url:'<%=path%>/apply/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'aid',checkbox:true,width:100">申购编号</th>
				<th data-options="field:'dep',width:100" formatter="forDepName">员工编号</th>
				<th data-options="field:'goodsname',width:100">物品名称</th>
				<th data-options="field:'worktype',width:100" formatter="forWorktypeName">物品类型</th>
				<th data-options="field:'gcounts',width:100">物品数量</th>
				<th data-options="field:'gunit',width:100">单位</th>
				<th data-options="field:'gprice',width:100">物品单价</th>
				<th data-options="field:'gpurpose',width:100">物品用途</th>
				<th data-options="field:'adatetime',width:100">申请时间</th>
				<th data-options="field:'astatus',width:100">状态</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">修改</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'">删除</a>
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="updateSP();">通过审批</a>				
	</div>
	<!-- 添加窗口 -->
	<div style="margin: 20px 0;"></div>
	<div id="addWindow" class="easyui-window" title="添加"
		data-options="closed:true,iconCls:'icon-add'" style="padding: 10px;">
		<div style="padding: 10px 60px 20px 60px">
			<form id="ff" method="post">
				<table>
					<tr>
						<td>员工姓名:</td>
						<td><input class="easyui-combobox" id="eid" name="apply.dep.eid" name="apply.eid" data-options="required:true" /></td>
					</tr>
					<tr>
						<td>物品名称:</td>
						<td><input class="easyui-textbox" name="apply.goodsname"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>物品类型:</td>
						<td><input class="easyui-combobox" id="wid" name="apply.worktype.swid" name="apply.wid" data-options="required:true" /></td>
					</tr>
					<tr>
						<td>物品数量:</td>
						<td><input class="easyui-textbox" name="apply.gcounts"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>单位:</td>
						<td><input class="easyui-textbox" name="apply.gunit"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>物品单价:</td>
						<td><input class="easyui-textbox" name="apply.gprice"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>物品用途:</td>
						<td><input class="easyui-textbox" name="apply.gpurpose"
							data-options="required:true" /></td>
					</tr>
				</table>
				<div data-options="region:'south',border:false"
					style="text-align: right; padding: 5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();" style="width: 80px">添加</a> 
					<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeAdd();" style="width: 80px">取消</a>
				</div>
			</form>
		</div>
	</div>
	<div style="margin:20px 0;"></div>
	<div id="editWindow" class="easyui-window" title="编辑" data-options="closed:true,iconCls:'icon-edit'" style="padding:10px;">
		<div style="padding:10px 60px 20px 60px">
			<form id="editForm">
			<input type="hidden" id="aid" name="apply.aid" />
			<table>
				<tr>
					<td>员工姓名:</td>
					<td><input class="easyui-combobox" id="ei" name="apply.dep.eid" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>物品名称</td>
					<td>
						<input class="easyui-textbox" name="apply.goodsname" id="gn" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>物品类型:</td>
					<td><input class="easyui-combobox" id="wi" name="apply.worktype.swid" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>物品数量</td>
					<td><input class="easyui-textbox" id="gs" name="apply.gcounts" data-options="required:true" /></input></td>
				</tr>
				<tr>
					<td>单位</td>
					<td><input class="easyui-textbox" id="gt" name="apply.gunit" data-options="required:true" /></input></td>
				</tr>
				<tr>
					<td>物品单价</td>
					<td><input class="easyui-textbox" id="gp" name="apply.gprice" data-options="required:true" /></input></td>
				</tr>
				<tr>
					<td>物品用途</td>
					<td><input class="easyui-textbox" id="gpe" name="apply.gpurpose" data-options="required:true" /></input></td>
				</tr>
				<tr>
					<td>申请时间:</td>
					<td><input class="easyui-datetimebox" id="dt" value="apply.adatetime" name="apply.adatetime" data-options="required:true" /></td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeEdit()" style="width:80px">取消</a>
			</div>
		</form>
		</div>
	</div>
	<script type="text/javascript">
		function forDepName(value){
			return value.ename;
		}
		function forWorktypeName(value){
			return value.swname;
		}
		$(function() {
			setPagination("list");
		});
		// 显示数据
		function setPagination(tableid) {
			var p = $("#" + tableid).datagrid("getPager"); // 获取由tableid指定的datagrid控件的分页组件
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
			$("#eid").combobox({
				url:"<%=path%>/apply/xzyg",
				method:'get',
			    valueField:'id',
			    textField:'name',
			    panelHeight:'auto',
			    onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#eid').combobox('getData');
	                if (data.length > 0) {
	                    $("#eid").combobox('select', data[0].id);
	                }
	            }
			});
			$("#wid").combobox({
				url:"<%=path%>/apply/xzlx",
				method:'get',
			    valueField:'id',
			    textField:'name',
			    panelHeight:'auto',
			    onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#wid').combobox('getData');
	                if (data.length > 0) {
	                    $("#wid").combobox('select', data[0].id);
	                }
	            }
			});
		}
		// 添加(提交後臺)
		function add() {
			if ($("#ff").form("validate")) {
				$.get('apply/add', $("#ff").serialize(), "JSON");
				$("#ff").form("clear");
				$("#addWindow").window("close");
				$("#list").datagrid('reload');
				$.messager.show({
					title : '提示消息',
					msg : '添加成功',
					showType : 'show'
				});
			}
			$("#list").datagrid('reload');
		}
		function closeAdd(){
			 $("#ff").form("clear");
				$("#addWindow").window("close");
		 }
		function closeEdit(){
			 $("#editForm").form("clear");
				$("#editWindow").window("close");
		 }
		// 打开编辑窗口
		function editOpen() {
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
			if (row) {
				$("#ei").combobox({
					url:"<%=path%>/apply/xzyg",
					method:'get',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto'
				});
				$("#ei").combobox("setValue",row.dep.ename);
				$("#ei").combobox('select',row.dep.eid);
				$("#wi").combobox({
					url:'<%=path%>/apply/xzlx',
					method:'post',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto'
				});
				$("#wi").combobox("setValue",row.worktype.swname);
				$("#wi").combobox('select',row.worktype.swid);
				document.getElementById("aid").value = row.aid;
				$("#gn").textbox("setValue", row.goodsname);
				$("#gs").textbox("setValue", row.gcounts);
				$("#gt").textbox("setValue", row.gunit);
				$("#gp").textbox("setValue", row.gprice);
				$("#gl").textbox("setValue", row.gtotle);
				$("#gpe").textbox("setValue", row.gpurpose);
				$("#dt").textbox("setValue", row.adatetime);
				$("#st").textbox("setValue", row.astatus);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			if($("#editForm").form("validate")){
				$.post('apply/update',$("#editForm").serialize(),
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
		
		function updateSP(){
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
				$.post('apply/updateSP',{'apply.aid':row.aid,'apply.astatus':row.astatus,"apply.gprice":roe.gprice,"apply.gcounts":row.gcounts},
					function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#list").datagrid("reload");
						});
					} else {
						$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
					}
				},"JSON");
		}
		//删除
		function expurgate() {
			var row = $("#list").datagrid("getSelected");
			if (row) {
				$.messager.confirm("提示", "确认要删除这个产品吗？", function(r) {
					if (r) {
						$.post("apply/delete",{'apply.aid':row.aid,'apply.astatus':row.astatus}, function(data) {
							if (data.result.result == "success") {
								$.messager.alert("提示", data.result.msg, "info", function() {
									$("#list").datagrid("reload");
								});
							}
						},"JSON");
					}
				});
			} else {
				$.messager.alert('提示', '请选中需要删除的产品', 'info');
			}
			$("#list").datagrid("reload");
		}
	</script>
</body>
</html>