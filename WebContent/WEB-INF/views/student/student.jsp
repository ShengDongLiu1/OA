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
		url:'<%=path %>/stu/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'intenid',checkbox:true,width:100">编号</th>
				<th data-options="field:'intenname',width:100">名称</th>
				<th data-options="field:'intensch',width:100">就读学校</th>
				<th data-options="field:'intensex',width:100">性别</th>
				<th data-options="field:'intenbir',width:100">出生年月</th>
				<th data-options="field:'intenmz',width:100">民族</th>
				<th data-options="field:'intenjg',width:100">籍贯</th>
				<th data-options="field:'intentel',width:100">学生号码</th>
				<th data-options="field:'intenfat',width:100">家长姓名</th>
				<th data-options="field:'intenfatel',width:100">学生家长号码</th>
				<th data-options="field:'intenaddr',width:100">家庭住址</th>
				<th data-options="field:'intenstatus',width:100">学生状态</th>
				<th data-options="field:'classes',width:100" formatter="forClasses">所在班级</th>
				<th data-options="field:'hourse',width:100" formatter="forHourse">所在宿舍</th>
				<th data-options="field:'intendate',width:100">入学时间</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="addClas();" data-options="iconCls:'icon-add'" >添加</a>
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
			  			<td>学生名称:</td>
			  			<td><input class="easyui-textbox" name="student.intenname" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>就读学校:</td>
			  			<td><input class="easyui-textbox" name="student.intensch" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生性别:</td>
			  			<td>
			  				<label >男</label>   
							<input type="radio" id="intensex" name="student.intensex" value="男" checked="checked"/>
							<label >女</label>   
							<input type="radio" id="intensex" name="student.intensex" value="女"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td>学生年龄:</td>
			  			<td><input class="easyui-textbox" name="student.intenage" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>民族：</td>
			  			<td><input class="easyui-textbox" name="student.intenmz" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>籍贯:</td>
			  			<td><input class="easyui-textbox" name="student.intenjg" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>出生年月:</td>
			  			<td><input class="easyui-datebox" value="1/1/1990" id="intenbir" name="student.intenbir" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>家长姓名:</td>
			  			<td><input class="easyui-textbox" name="student.intenfat" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生号码:</td>
			  			<td><input class="easyui-textbox" name="student.intentel" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生家长号码:</td>
			  			<td><input class="easyui-textbox" name="student.intenfatel" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>家庭住址:</td>
			  			<td><input class="easyui-textbox" name="student.intenaddr" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>就读疑问:</td>
			  			<td><input class="easyui-textbox" name="student.intenpeo" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>选择班级:</td>
			  			<td><input class="easyui-combobox" data-options="required:true" id="addclass" name="student.classid"/></input></td>
			  		</tr>
			  		<tr>
			  			<td>选择宿舍:</td>
			  			<td><input class="easyui-combobox" data-options="required:true" id="addhoure" name="student.hourid" /></input></td>
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
			  			<td>学生编号:</td>
			  			<td><input class="easyui-textbox" id="id" name="student.intenid" data-options="required:true,readonly:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生名称:</td>
			  			<td><input class="easyui-textbox" id="name" name="student.intenname" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>就读学校:</td>
			  			<td><input class="easyui-textbox" id="sch" name="student.intensch" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生性别:</td>
			  			<td>
			  				<label >男</label>   
							<input type="radio" id="sex" name="student.intensex" value="男" checked="checked"/>
							<label >女</label>   
							<input type="radio" id="sex" name="student.intensex" value="女"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td>学生年龄:</td>
			  			<td><input class="easyui-textbox" id="age" name="student.intenage" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>民族：</td>
			  			<td><input class="easyui-textbox" id="mz" name="student.intenmz" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>籍贯:</td>
			  			<td><input class="easyui-textbox" id="jg" name="student.intenjg" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>出生年月:</td>
			  			<td><input class="easyui-datebox" value="1/1/1990" id="bir" name="student.intenbir" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>家长姓名:</td>
			  			<td><input class="easyui-textbox" id="fat" name="student.intenfat" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生号码:</td>
			  			<td><input class="easyui-textbox" id="tel" name="student.intentel" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生家长号码:</td>
			  			<td><input class="easyui-textbox" id="fatel" name="student.intenfatel" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>家庭住址:</td>
			  			<td><input class="easyui-textbox" id="addr" name="student.intenaddr" data-options="required:true" /></input></td>
			  		</tr>
			  		<tr>
			  			<td>就读疑问:</td>
			  			<td><input class="easyui-textbox" id="peo" name="student.intenpeo" data-options="required:true" /></input></td>
			  		</tr>
			  		<!-- <tr>
			  			<td>学生状态:</td>
			  			<td><input class="easyui-textbox" id="status" name="student.intenstatus" /></input></td>
			  		</tr> -->
			  		<tr>
			  			<td>学生班级:</td>
			  			<td><input class="easyui-combobox" data-options="required:true" id="clas" name="student.classid"/></input></td>
			  		</tr>
			  		<tr>
			  			<td>学生宿舍:</td>
			  			<td><input class="easyui-combobox" data-options="required:true" id="hous" name="student.hourid" /></input></td>
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

	function forClasses(value){
		return value.classname;
	}
	function forHourse(value){
		return value.hourname;
	}
	//打开添加班级和宿舍窗口
	function addClas() {
		$("#addWindow").window("open");
		$("#addclass").combobox({
			url:"<%=path%>/stu/classes",
			method:'post',
		    valueField:'id',
		    textField:'name',
		    panelHeight:'auto',
		    onLoadSuccess: function () { //数据加载完毕事件
	            var data = $('#addclass').combobox('getData');
	            if (data.length > 0) {
	                $("#addclass").combobox('select', data[0].id);
	            }
	        }
		});
		$("#addhoure").combobox({
			url:"<%=path%>/stu/hourse",
			method:'post',
		    valueField:'id',
		    textField:'name',
		    panelHeight:'auto',
		    onLoadSuccess: function () { //数据加载完毕事件
	            var data = $('#addhoure').combobox('getData');
	            if (data.length > 0) {
	                $("#addhoure").combobox('select', data[0].id);
	            }
	        }
		});
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
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		 function add(){
			if($("#ff").form("validate")){
				$.get('stu/add',$("#ff").serialize(),
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
				$("#id").textbox("setValue", row.intenid);
				$("#name").textbox("setValue", row.intenname);
				$("#sch").textbox("setValue", row.intensch);
				$("#age").textbox("setValue", row.intenage);
				$("#mz").textbox("setValue", row.intenmz);
				$("#jg").textbox("setValue", row.intenjg);
				$("#bir").textbox("setValue", row.intenbir);
				$("#fat").textbox("setValue", row.intenfat);
				$("#tel").textbox("setValue", row.intentel);
				$("#fatel").textbox("setValue", row.intenfatel);
				$("#addr").textbox("setValue", row.intenaddr);
				$("#peo").textbox("setValue", row.intenpeo);
				$("#clas").combobox({
					url:'<%=path%>/stu/classes',
					method:'post',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto'
				});
				$("#clas").combobox("setValue",row.classes.classname);
				$("#clas").combobox('select',row.classes.classid);
				$("#hous").combobox({
					url:'<%=path%>/stu/hourse',
					method:'post',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto'
				});
				$("#hous").combobox("setValue", row.hourse.hourname);
				$("#hous").combobox('select',row.hourse.hourid);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			if($("#editForm").form("validate")){
				$.get('stu/update',$("#editForm").serialize(),
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
						$.post("stu/delete",{'student.intenid':row.intenid}, function(data) {
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
			$("#list").datagrid('reload');
		}
		// 关闭窗口
		function Winclose(c) {
			$("#"+c).window("close");
		}
	</script>
</body>
</html>