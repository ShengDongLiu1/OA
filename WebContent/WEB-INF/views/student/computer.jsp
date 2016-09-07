<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
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
		url:'<%=path %>/computer/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		fit:true">
		<thead>
			<tr>
				<th data-options="field:'comid',checkbox:true,width:100" align="center">电脑编号</th>
				<th data-options="field:'coma',width:100" align="center">电脑型号</th>
				<th data-options="field:'comb',width:100" align="center">电脑名称</th>
				<th data-options="field:'comcount',width:100" align="center">领用数量</th>
				<th data-options="field:'student',width:100" formatter="forStudentName" align="center">学生姓名</th>
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
			  			<td>电脑型号:</td>
			  			<td><input class="easyui-textbox" name="computer.coma" data-options="required:true,validType:'length[2,20]',novalidate:true" /></td>
			  		</tr>
			  		<tr>
			  			<td>电脑名称:</td>
			  			<td><input class="easyui-textbox" name="computer.comb" data-options="required:true,validType:'length[2,20]',novalidate:true" /></td>
			  		</tr>
			  		<tr>
			  			<td>学生姓名:</td>
			  			<td><br/>
			  			<div style="float: left;">
			  				<input class="easyui-combobox" id="stuid" name="computer.student.intenid" data-options="required:true" /><br /><br />
			  			</div>
			  			<div style="float: left;">
							&nbsp;<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width: 80px; height: 20px;"  onclick="openstudent();">选择学生</a>
						</div>
						<p style="clear: both;"></p>
						</td>
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
			<input type="hidden" id="ci" name="computer.comid"/>
			<table>
				<tr>
					<td>电脑型号</td>
					<td>
						<input class="easyui-textbox" name="computer.coma" id="ca" data-options="required:true,validType:'length[2,20]',novalidate:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>电脑名称</td>
					<td><input class="easyui-textbox" id="cb" name="computer.comb" data-options="required:true,validType:'length[2,20]',novalidate:true" /></td>
				</tr>
				<tr>
					<td>学生姓名</td>
					<td><br /><div style="float: left;">
						<input class="easyui-combobox" id="si" name="computer.student.intenid" data-options="required:true" /><br /><br />
						</div>
	               		<div style="float: left;">
							&nbsp;<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width: 80px; height: 20px;"  onclick="openstudent();">选择学生</a>
						</div>
						<p style="clear: both;"></p>
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
	
<div id="studentwin1" class="easyui-window" title="选择学生"
		data-options="iconCls:'icon-edit', closable:true, closed:true"
		style="width: 800px; height: 500px; padding: 5px;">
		<form id="xuanForm1" enctype="multipart/form-data">
			<table id="student_list" class="easyui-datagrid"
				data-options=" 
				toolbar:'#tc',
				url:'<%=path%>/stu/queryAll', 
				method:'get', 
				rownumbers:true,
				singleSelect:true,
				autoRowHeight: true,
				pagination:true,
				border:false
				">
				<thead>
					<tr>
						<th data-options="field:'intenid',checkbox:true,width:100" align="center">编号</th>
				        <th data-options="field:'intenname',width:100" align="center">名称</th>
				        <th data-options="field:'intensch',width:100" align="center">就读学校</th>
				        <th data-options="field:'intensex',width:100" align="center">性别</th>
				        <th data-options="field:'intenage',width:50" align="center">年龄</th>
				        <th data-options="field:'intentel',width:100" align="center">学生记录号码</th>
				        <th data-options="field:'intenaddr',width:100" align="center">家庭住址</th>
				        <th data-options="field:'classes',width:100" formatter="forClasses" align="center">所在班级</th>
				        <th data-options="field:'hourse',width:100" formatter="forHourse" align="center">所在宿舍</th>
					</tr>
				</thead>
			</table>
			<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok'" onclick="student_xuan();">确定选择</a>
		</form>
	</div>
	
	<div id="tc" style="padding: 5px;">
		<div style="float: left;">
			<input class="easyui-combobox" data-options="required:true"
				style="width: 150px;" id="classid" name="rawpun.jstuid" /> <a
				href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryByClassName();">按照班级查询</a> <input
				class="easyui-textbox" style="width: 150px;" id="tiaoname" name="rawpun.jstuid" />
				<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryName();">按名字查询</a>
				<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryall();">查询全部</a>
		</div>
	</div>
	
	<script type="text/javascript">
		function forStudentName(value){
			return value.intenname;
		}
		function forHourse(value) {
		    return value.hourname;
		}
		function forClasses(value) {
		    return value.classname;
		}
		
		$(function() {
			setPagination("list");
		});
		// 显示数据
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageSize:15,
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
			 $("#stuid").combobox({
	            url: "<%=path%>/computer/xzxs",
	            method: 'get',
	            valueField: 'id',
	            textField: 'name',
	            panelHeight: 'auto',
	            onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#stuid').combobox('getData');
	                if (data.length > 0) {
	                    $("#stuid").combobox('select', data[0].id);
	                }
	            }
	        });
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		 function add(){
			 toValidate("ff");
		    	if (validateForm("ff")){
				$.get('computer/add',$("#ff").serialize(),
				function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#ff").form("clear");
							$("#addWindow").window("close");
							$("#list").datagrid('reload');
						});
					} else {
						$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
					}
				},"JSON");
			}
		} 
		// 打开编辑窗口
		function editOpen() {
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
			if (row) {
				document.getElementById("ci").value = row.comid;
				$("#ca").textbox("setValue", row.coma);
				$("#cb").textbox("setValue", row.comb);
				$("#si").combobox({
					url:"<%=path%>/computer/xzxs",
					method:'get',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto',
				});
			    $("#si").combobox("setValue", row.student.intenname);
	            $("#si").combobox('select', row.student.intenid);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			toValidate("editForm");
	    	if (validateForm("editForm")){
				$.post('computer/update',$("#editForm").serialize(),
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
				$.messager.confirm("提示", "确认要删除这条记录吗？", function(r) {
					if (r) {
						$.post("computer/delete",{'computer.comid':row.comid}, function(data) {
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
		function openstudent(){
			$("#student_list").datagrid("reload");
			$("#classid").combobox({
	            url: "<%=path%>/rawpun/tjls",
	            method: 'get',
	            valueField: 'id',
	            textField: 'name',
	            panelHeight: 'auto',
	            onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#classid').combobox('getData');
	                if (data.length > 0) {
	                    $("#classid").combobox('select', data[0].id);
	                }
	            }
	        });
			$("#studentwin1").window("open");
		}
	    
	    function student_xuan(){
			var row=$("#student_list").datagrid("getSelected");	//获取datagrid中选中的行
			if(row){
		         $("#stuid").combobox("setValue", row.intenname);
		         $("#stuid").combobox('select', row.intenid);
		         
		         $("#si").combobox("setValue", row.intenname);
		         $("#si").combobox('select', row.intenid);
				 $("#studentwin1").window("close");
			}else{
				$.messager.alert('提示','请选择学生','info');	//messager消息控件
			}
		}
	    
		function queryByClassName() {
	        classid=$('#classid').combobox("getValue");
	        $('#student_list').datagrid('load',{  
	        	classid:classid
	        });
		}
		
		function queryName(){
			tiaoname = $("#tiaoname").textbox("getValue");
			$('#student_list').datagrid('load',{
				tiaoname:tiaoname
			});
		}
		
		function queryall(){
			$('#student_list').datagrid('load',{
			});
		}
	</script>
</body>
</html>