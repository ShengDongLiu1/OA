<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>收入管理</title>
<link rel="stylesheet"
	href="<%=path%>/js/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path%>/css/site_main.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/site_easyui.js"></script>
</head>
<body>
	<!-- 表格 -->
	<table id="list" class="easyui-datagrid" toolbar="#tb"
		data-options="
		url:'<%=path%>/income/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:true">
		<thead>
			<tr>
				<th data-options="field:'mname',width:100" align="center">收入人</th>
				<th data-options="field:'moncount',width:100" align="center">收入金额</th>
				<th data-options="field:'monpro',width:100" align="center">收入原因</th>
				<th data-options="field:'mdate',width:100" align="center">收入时间</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:2px;">
	&nbsp;&nbsp;
		<!-- 按时间查询 -->
		<input  class="easyui-datebox" id="begin" size="10px" />&nbsp;-&nbsp;
		<input  class="easyui-datebox" id="end" size="10px" />
		 <a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByTime();" >时间查询</a>
		
		<!-- 按支出人查询 -->
		<input  class="easyui-textbox" id="name" size="10px" />
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByName();" >收入人查询</a>
		
		<!-- 查询所有 -->
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryall()" >查询所有</a>
		
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
		function queryall(){
			$('#list').datagrid('load', {});  
		}
	
		function queryByTime(){
			var begin= $('#begin').datebox('getValue');
			var end= $('#end').datebox('getValue');
	    	if(begin=='' && end=='' || begin==null && end==null){
	    		alert("请输入时间")
	    	}else{
	    		$('#list').datagrid('load', {   
	    			begin:begin,
	    			end:end
	    		});  
	    	}
		}
	
		function queryByName(){
			var name=$("#name").textbox('getValue');
	    	if(name!='' || name!=null){
	    		$('#list').datagrid('load', {   
	    			name:name
	    		});  
	    	}else{
	    		alert("请输入收入人名称")
	    	}
		} 
	</script>
</body>
</html>