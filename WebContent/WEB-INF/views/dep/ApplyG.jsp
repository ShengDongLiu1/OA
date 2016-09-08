<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>物品申购</title>
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
		url:'<%=path %>/apply/queryAllG', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		fit:true">
		<thead>
			<tr>
				<th data-options="field:'aid',checkbox:true,width:100" align="center">申购编号</th>
				<th data-options="field:'dep',width:100" formatter="forDepName" align="center">员工姓名</th>
				<th data-options="field:'gname',width:100" align="center">物品名称</th>
				<th data-options="field:'worktype',width:100" formatter="forWorktypeName" align="center">物品类型</th>
				<th data-options="field:'gcounts',width:100" align="center">物品数量</th>
				<th data-options="field:'gprice',width:100" align="center">物品单价</th>
				<th data-options="field:'gtotle',width:100" align="center">物品总价</th>
				<th data-options="field:'gpurpose',width:100" align="center">物品用途</th>
				<th data-options="field:'adatetime',width:100" align="center">申请时间</th>
				<th data-options="field:'astatus',width:100" align="center" formatter="formatPrice">状态</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
         <a href="javascript:(0);" class="easyui-linkbutton" onclick="updateSP();" data-options="iconCls:'icon-add'">前去购买</a>
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
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageSize:15,
				pageList:[5,10,15,20],
				beforePageText:"第",
				afterPageText:"页    共{pages}页",
				displayMsg:"当前显示{from} - {to} 条记录    共{total}条记录",
				onBeforeRefresh:function() {
					$(this).pagination("loading");
					$(this).pagination("loaded");
				}
			});
		}
		function updateSP(){
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
				$.post('updateGM',{'apply.aid':row.aid,'apply.astatus':row.astatus,"apply.gprice":row.gprice,"apply.gcounts":row.gcounts,"apply.worktype.swid":row.worktype.swid,"apply.gname":row.gname},
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

		function formatPrice(val,row){
			if (val == "未审批"){
				return val;
			} else if(val == "已审批"){
				return '<span style="color:red;">'+val+'</span>';
			} else if(val == "已购买"){
				return '<span style="color:green;">'+val+'</span>';
			}
		}
	</script>
</body>
</html>