<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>支出管理</title>
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
		url:'<%=path%>/expend/queryAll',
		method:'get',
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:20,fit:true">
		<thead>
			<tr>
				<th data-options="field:'payname',width:100" align="center">支出人</th>
				<th data-options="field:'paycount',width:100" align="center">支出金额</th>
				<th data-options="field:'paypro',width:700" align="center">支出原因</th>
				<th data-options="field:'ptime',width:150" align="center">支出时间</th>
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
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByName();" >支出人查询</a>
		
		<!-- 查询所有 -->
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryall()" >查询所有</a>
		
	</div>

	<script type="text/javascript">
		$(function() {
			setPagination("list");
		});
		function timezh(time){

		}
		// 显示数据
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageList: [20, 30, 40],
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
	    		alert("请输入支出人名称")
	    	}
		}  
	</script>
</body>
</html>