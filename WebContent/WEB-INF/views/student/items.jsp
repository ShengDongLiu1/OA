<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>项目答辩管理</title>
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
		url:'<%=path %>/items/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'xid',checkbox:true,width:100">编号</th>
				<th data-options="field:'sname',width:100">项目名称</th>
				<th data-options="field:'student',width:100" formatter="formatterStudentName">学生姓名</th>
				<th data-options="field:'dep',width:100" formatter="forTeacherName">指导老师</th>
				<th data-options="field:'sdate',width:100">答辩时间</th>
				<th data-options="field:'score',width:100">答辩成绩</th>
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
						<td>项目名称</td>
						<td>
							<input class="easyui-textbox" id="sname" name="items.sname" data-options="required:true" /></input>
						</td>
					</tr>
			  		<tr>
			  			<td>学生编码:</td>
			  			<td><input class="easyui-combobox" id="sstuid" name="items.student.intenid" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>答辩时间:</td>
			  			<td><input class="easyui-datetimebox" id="sdate" name="items.sdate" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>答辩成绩:</td>
			  			<td><input class="easyui-textbox" id="score" name="items.score" data-options="required:true" /></input></td>
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
					<td>编号</td>
					<td>
						<input class="easyui-textbox" name="items.xid" id="xi" readonly />
					</td>
				</tr>
				<tr>
					<td>项目:</td>
					<td>
						<input class="easyui-textbox" name="items.sname" id="sn" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>学生:</td>
					<td><input class="easyui-combobox" id="si" name="items.student.intenid"  data-options="required:true" /></input></td>
				</tr>
				<tr>
					<td>答辩时间:</td>
					<td>
						<input class="easyui-datetimebox" name="items.sdate" id="sd" data-options="required:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>成绩:</td>
					<td>
						<input class="easyui-textbox" name="items.score" id="sc"  data-options="required:true"/><!-- 由dataoptions指定验证的规则 -->
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
	
		function formatterStudentName(value){
			return value.intenname;
		}
		
		function forTeacherName(value){
			return value.ename;
		} 
		
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
			$("#sstuid").combobox({
				url:"<%=path%>/items/stud",
				method:'get',
			    valueField:'id',
			    textField:'name',
			    panelHeight:'auto',
			    onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#sstuid').combobox('getData');
	                if (data.length > 0) {
	                    $("#sstuid").combobox('select', data[0].id);
	                }
	            }
			}); 
			$("#addWindow").window("open");
		}
		
		function closeAdd(){
			$("#addWindow").window("close");
			$("#ff").form("clear");
		}
		// 添加(提交後臺)
		 function add(){
			if($("#ff").form("validate")){
				$.post('<%=path%>/items/add',$("#ff").serialize(),
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
		} 
		// 打开编辑窗口
		function editOpen() {
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
			if (row) {
				$("#si").combobox({
					url:"<%=path%>/items/stud",
					method:'get',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto',
				});
				$("#si").combobox('setValue',row.student.intenname);
				$("#si").combobox('select',row.student.intenid);
				$("#sn").textbox("setValue", row.sname);
				$("#xi").textbox("setValue", row.xid);
				$("#sd").textbox("setValue", row.sdate);
				$("#sc").textbox("setValue", row.score);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			if($("#editForm").form("validate")){
				$.post('<%=path%>/items/update',$("#editForm").serialize(),
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
				$("#editForm").form("load", row);
				$.post('items/delete',{'items.xid':row.xid},"JSON");
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
		// 关闭窗口
		function Winclose(c) {
			$("#" + c).window("close");
		}
	</script>
</body>
</html>