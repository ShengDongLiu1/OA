<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>用品</title>
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
		url:'<%=path %>/work/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		fit:true">
		<thead>
			<tr>
				<th data-options="field:'wid',checkbox:true,width:100" align="center">编号</th>
				<th data-options="field:'worktype',width:100" formatter="forTypeName" align="center">类型</th>
				<th data-options="field:'wname',width:100" align="center">名称</th>
				<th data-options="field:'wcount',width:100" align="center">可用数量</th>
				<th data-options="field:'wamount',width:100" align="center">总数量</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'" >添加</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'" >编辑</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'" >删除</a>
		<a href="<%=path%>/worktype/all" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询所有类型</a>
	</div>
	<!-- 添加窗口 -->
	<div style="margin:20px 0;"></div>
	<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'" style="padding:10px;">
		<div style="padding:10px 60px 20px 60px">
			<form id="ff" method="post">
			<input type="hidden" id="wct" name="work.wcount"/>
			  	<table>
			  		<tr>
						<td>类型:</td>
						<td>
							<input class="easyui-combobox" id="wtypeid" name="work.worktype.swid" data-options="required:true,validType:'length[2,20]',novalidate:true" />
						</td>
					</tr>
			  		<tr>
			  			<td>名称:</td>
			  			<td><input class="easyui-textbox" id="wname" name="work.wname" data-options="required:true,validType:'length[2,20]',novalidate:true" /></td>
			  		</tr>
			  		<tr>
			  			<td>总数量:</td>
			  			<td><input class="easyui-numberbox" id="wamount" name="work.wamount" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
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
			<input type="hidden" id="wi" name="work.wid"/>
			<table>
				<tr>
					<td>类型</td>
					<td>
						<input class="easyui-combobox" name="work.worktype.swid" id="wt" data-options="required:true,validType:'length[2,20]',novalidate:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>名称</td>
					<td><input class="easyui-textbox" id="wn" name="work.wname" data-options="required:true,validType:'length[2,20]',novalidate:true" /></td>
				</tr>
				<tr>
					<td>可用数量</td>
					<td>
						<input class="easyui-numberbox" name="work.wcount" id="wc" data-options="required:true,validType:'length[1,20]',novalidate:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>总数量</td>
					<td>
						<input class="easyui-numberbox" name="work.wamount" id="wa" data-options="required:true,validType:'length[1,20]',novalidate:true" /><!-- 由dataoptions指定验证的规则 -->
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
		function forTypeName(value){
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
			$("#wtypeid").combobox({
				url:"<%=path%>/work/xzlx",
				method:'get',
			    valueField:'id',
			    textField:'name',
			    panelHeight:'auto',
			    onLoadSuccess: function () { //数据加载完毕事件
	                var data = $('#wtypeid').combobox('getData');
	                if (data.length > 0) {
	                    $("#wtypeid").combobox('select', data[0].id);
	                }
	            }
			});
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		 function add(){
			 var z =$('#wamount').textbox('getValue');
			document.getElementById("wct").value = z;
			 toValidate("ff");
		     if (validateForm("ff")){
		    		 $.post('<%=path%>/work/add',$("#ff").serialize(),
	 					function(data) {
	 					if (data.result.result == 'success') {
	 						$.messager.alert("提示", data.result.msg, "info", function() {
	 							$("#addWindow").window("close");
	 							$("#list").datagrid("reload");
	 							$("#ff").form("clear");
	 						});
	 					} else {
	 						$.messger.alert("提示",data.result.msg, "info");
	 					}
	 				},"JSON");
			}
		} 
		// 打开编辑窗口
		function editOpen() {
			var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
			if (row) {
				document.getElementById("wi").value = row.wid;
				$("#wt").combobox({
					url:"<%=path%>/work/xzlx",
					method:'get',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto',
				});
				$("#wt").combobox("setValue",row.worktype.swname);
				$("#wt").combobox('select',row.worktype.swid);
				$("#wn").textbox("setValue", row.wname);
				$("#wc").textbox("setValue", row.wcount);
				$("#wa").textbox("setValue", row.wamount);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			var k =$('#wc').textbox('getValue');
			var z =$('#wa').textbox('getValue');
			toValidate("editForm");
	    	if (validateForm("editForm")){
	    		if((z-k) < 0){
		    		 $.messager.alert('提示', '可用数量不能大于总量', 'info');
		    	 }else{
					$.post('update',$("#editForm").serialize(),
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
		}
		//删除
		function expurgate() {
			var row = $("#list").datagrid("getSelected");
			if (row) {
				$.messager.confirm("提示", "确认要删除吗？", function(r) {
					if (r) {
						$.post("work/delete",{'work.wid':row.wid}, function(data) {
							if (data.result.result == "success") {
								$.messager.alert("提示", data.result.msg, "info",
									function() {
										$("#list").datagrid("reload");
									});
							}else{
								$.messager.alert("提示", data.result.msg, "info");
							}
						},"JSON");
					}
				});
			} else {
				$.messager.alert('提示', '请选中需要删除的lie', 'info');
			}
		}
		// 关闭窗口
		function Winclose(c) {
			$("#" + c).window("close");
		}
	</script>
</body>
</html>