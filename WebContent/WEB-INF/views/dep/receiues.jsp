<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		String  path = request.getContextPath();
   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品申领</title>
<link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>

<script type="text/javascript">

	function onSelect(d) {
    	var issd = this.id == 'ucreattime2', sd = issd ? d : new Date($('#ucreattime2').datebox('getValue')), ed = issd ? new Date($('#uendtime2').datebox('getValue')) : d;
        if (ed < sd) {
        	$('#uendtime2').textbox('setValue', '');
        	$.messager.alert('提示', '结束日期小于开始日期', 'info');
            //只要选择了日期，不管是开始或者结束都对比一下，如果结束小于开始，则清空结束日期的值并弹出日历选择框
          
        }
    }
	function onSelect2(d) {
    	var issd = this.id == 'ucreattime', sd = issd ? d : new Date($('#ucreattime').datebox('getValue')), ed = issd ? new Date($('#uendtime').datebox('getValue')) : d;
        if (ed < sd) {
        	$('#uendtime').textbox('setValue', '');
        	$.messager.alert('提示', '结束日期小于开始日期', 'info');
            //只要选择了日期，不管是开始或者结束都对比一下，如果结束小于开始，则清空结束日期的值并弹出日历选择框
          
        }
    }
	function depdname(value){
		return value.ename;
	}
	
	function workname1(value){
		return value.wname;
	}
	
	function setPagination(tableId) {
		var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
		$(p).pagination({
			pageSize:15,
			pageList:[10,15,20,25],
			beforePageText:"第",
			afterPageText:"页    共{pages}页",
			displayMsg:"当前显示{from} - {to} 条记录    共{total}条记录",
			onBeforeRefresh:function() {
				$(this).pagination("loading");
				$(this).pagination("loaded");
			}
		});
	}
	
	$(function() {
		$("#list").datagrid({
			onRowContextMenu: function(e, rowindex, rowData) {//datagrid中的每一行都绑定右键菜单
				e.preventDefault();
				$("#mm").menu("show",{
					left:e.pageX,
					top:e.pageY
				});
			}
		});
		setPagination("list");
		
	});
	function edit() {
		var row = $("#list").datagrid("getSelected");
		if (row) {
			if(row.restore=="借"){
				document.getElementById("uid").value = row.uid;
				document.getElementById("eid").value = row.dep.eid;
				$("#workname").combobox({
					url:"<%=path%>/receiue/tjls2",
					method:'get',
				    valueField:'id',
				    textField:'name',
				    panelHeight:'auto',
				
				});
				  $("#workname").combobox("setValue", row.work.wname);
		           $("#workname").combobox('select', row.work.wid);
				
				$('#ugname').combobox({
				    value:row.ugname,
				    listHeight: 10
				});
				$("#ucount").textbox('setValue', row.ucount);
				$("#upurpose").textbox('setValue', row.upurpose);
				$("#ucreattime").textbox('setValue', row.ucreattime);
				$("#uendtime").textbox('setValue', row.uendtime);
				$('#restore').combobox({
				    value:row.restore,
				    listHeight:5
				});
				
				$("#editWin").window("open");
			}else{
				$.messager.alert('提示', '已经归还的物品 记录不能修改', 'info');// messager消息控件

			}
			
		} else {
			$.messager.alert('提示', '请选中需要修改的申领记录', 'info');// messager消息控件
		}
	}
	//修改方法
	function doEdit() {
		var row = $("#list").datagrid("getSelected");
		toValidate("editForm");
    	if (validateForm("editForm")){
			if(row){
				var ucount1 = row.ucount;
				$.get('count1',{'ucount1':ucount1},"json"); 
				$.post("receiue/update",$("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
				function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info", function() {
							$("#editWin").window("close");
							$("#list").datagrid("reload");
						});
					} else {
						$.messager.alert("提示", data.result.msg, "info");
					}
				},"json");
			}
		}
	}
	function editPro(){
		$("#editWin").window("close");
	}
	//删除方法
	function removeCP() {
		var row = $("#list").datagrid("getSelected");
		if (row) {
			if(row.restore=="还"){
			$.messager.confirm("提示", "确认要删除这个申领记录吗？", function(r) {
				if (r) {
					$.post("receiue/delete", {
						'receiue.uid' : row.uid
					}, function(data) {
						if (data.result.result == "success") {
							$.messager.alert("提示", data.result.msg, "info",
									function() {
										$("#list").datagrid("reload");
									});
						}else{
							$.messager.alert("提示", data.result.msg, "info",
									function() {
										$("#list").datagrid("reload");
									});
						}
					},"json");
				}
			});
			}else{
				$.messager.alert('提示', '不能删除正在借用的物品记录！', 'info');// messager消息控件
			}
		} else {
			$.messager.alert('提示', '请选中需要删除的申领记录！', 'info');// messager消息控件
		}
	}
	
	function updateCount() {
		var row = $("#list").datagrid("getSelected");
		if (row) {
			if(row.restore=="借"){
			$.post("receiue/guihuan", {
				'receiue.uid' : row.uid,'receiue.uwork':row.work.wid
			}, function(data) {
				if (data.result.result == "success") {
					$.messager.alert("提示", data.result.msg, "info",
							function() {
								$("#list").datagrid("reload");
							});
				}else{
					$.messager.alert("提示", data.result.msg, "info",
							function() {
								$("#list").datagrid("reload");
							});
				}
			},"json");
			
			}else{
				$.messager.alert('提示', '该物品已经归还了！！', 'info');// messager消息控件
			}
		
		} else {
			$.messager.alert('提示', '请选中需要删除的申领记录', 'info');// messager消息控件
		}
	}
	
	//打开添加申领记录窗口
	function addPro() {
		$("#addWin").window("open");
		
		$("#addwork").combobox({
			url:"<%=path%>/receiue/tjls2",
			method:'get',
		    valueField:'id',
		    textField:'name',
		    panelHeight:'auto',
		    onLoadSuccess: function () { //数据加载完毕事件
	            var data = $('#addwork').combobox('getData');
	            if (data.length > 0) {
	                $("#addwork").combobox('select', data[0].id);
	            }
	        }
		});
	}
	function addPro1(){
		$("#addWin").window("close");
	}
	function doAdd() {
		toValidate("addForm");
    	if (validateForm("addForm")){// 验证整个表单里的所有validatabox是否通过验证
			$.post("receiue/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
			function(data) {
				if (data.result.result == 'success') {
					$.messager.alert("提示", data.result.msg, "info", function() {
						$("#addWin").window("close");
						$("#list").datagrid("reload");
						$("#addForm").form("clear");
					});
				} else {
					$.messager.alert("提示", data.result.msg, "info");
				}
			}, 'json');
		}
	}
</script>
</head>
<body>
	<table id="list" class="easyui-datagrid"
		data-options=" 
	toolbar:'#tb',
	url:'<%=path%>/receiue/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		fit:true">
		<thead>
			<tr>
				<th data-options="field:'uid',checkbox:true" width="100" align="center">员工申领记录编号</th>
				<th data-options="field:'dep'" width="100" formatter="depdname" align="center">员工姓名</th>
				<th data-options="field:'work'" width="100" formatter="workname1" align="center">申领物品名称</th>
				<th data-options="field:'ucount'" width="100" align="center">申领物品数量</th>
				<th data-options="field:'upurpose'" width="100" align="center">用途</th>
				<th data-options="field:'ucreattime'" width="100" align="center">创建时间</th>
				<th data-options="field:'uendtime'" width="100" align="center">结束时间</th>
				<th data-options="field:'restore'" width="100" align="center">借还状态</th>
			</tr>
		</thead>
	</table>

	<div id="tb" style="padding: 5px;">
		<a href="javascript:;" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" onclick="addPro();">添加</a>
		<!-- 链接按钮控件 -->
		<a href="javascript:;" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'" onclick="removeCP();">移除</a> 
			<a href="javascript:;" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onclick="edit();">修改</a>
			<a href="javascript:;" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onclick="updateCount();">归还</a>
	</div>
	
	
	<div id="editWin" class="easyui-window" title="修改申领记录"
		data-options="iconCls:'icon-edit', closable:true, closed:true"
		style="width: 350px; height: 400px; padding: 5px;">
		<form id="editForm" enctype="multipart/form-data">
			<input type="hidden" id="uid" name="receiue.uid"/>
			<input type="hidden" id="eid" name="receiue.dep.eid"/>
			<table>
				<tr>
		  			<td>选择物品:</td>
		  			<td><br>
		  			<input class="easyui-combobox" data-options="required:true" id="workname" name="receiue.uwork" /><br/><br/>
		  			</td>
		  		</tr>
				<tr>
	                <td><br/>申领物品数量:</td>
	                <td><br/><input class="easyui-textbox" id="ucount" style="width: 150px;" name="receiue.ucount"
                                data-options="required:true,validType:'length[1,5]',novalidate:true"
                                style="width:200px"></td>
            	</tr>
				
				<tr>
	                <td><br/>用途:</td>
	                <td><br/><input class="easyui-textbox" id="upurpose" style="width: 150px;height: 55px;" name="receiue.upurpose"
                         data-options="required:true,validType:'length[3,50]',novalidate:true,multiline:true" ></td>
          		 </tr>
				<tr>
					<td>借用时间：</td>
					<td><input class="easyui-datebox" value="10/11/2012" data-options="onSelect:onSelect2,required:true" id="ucreattime" name="receiue.ucreattime" style="width:200px"></td>
				</tr>
				<tr>
					<td>归还时间：</td>
					<td><input class="easyui-datebox" value="10/11/2012" data-options="onSelect:onSelect2,required:true" id="uendtime" name="receiue.uendtime" style="width:200px"></td>
				</tr>
				<tr height="35px;">
					<td>借还状态：</td>
					<td>&nbsp;<select class="easyui-combobox" name="receiue.restore" id="restore" style="width:150px;" readonly>
							<option value="借">正在借用</option>
							<option value="还">已经归还</option>
						</select>
					</td>
				</tr>
		
				
				
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="doEdit();" style="width:80px; height: 20px;">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="editPro();" style="width:80px; height: 20px;">取消</a>
			</div>
		</form>
	</div>

	<div id="addWin" class="easyui-window" title="添加申领记录"
		data-options="iconCls:'icon-edit', closable:true, closed:true"
		style="width: 350px; height: 350px; padding: 5px;">
		<form id="addForm" enctype="multipart/form-data">
			<input type="hidden" id="rece" name="receiue.dep.eid" value="${sessionScope.user.dep.getEid()}"/>
			<table>
			<tr>
				<tr>
		  			<td>选择物品:</td>
		  			<td><br>
		  			<input class="easyui-combobox" data-options="required:true" id="addwork" name="receiue.uwork" /><br/><br/>
		  			</td>
		  		</tr>
				<tr>
	                <td><br/>申领物品数量:</td>
	                <td><br/><input class="easyui-textbox" id="ucount" style="width: 150px;" name="receiue.ucount"
                                data-options="required:true,validType:'length[1,5]',novalidate:true"
                                style="width:200px"></td>
            	</tr>
				<tr>
	                <td><br/>用途:</td>
	                <td><br/><input class="easyui-textbox" id="upurpose" style="width: 150px;height: 55px;" name="receiue.upurpose"
                         data-options="required:true,validType:'length[3,50]',novalidate:true,multiline:true"        data-options=""></td>
          		 </tr>
				<tr>
					<td>借用时间：</td>
					<td><input class="easyui-datebox" value="10/11/2012" data-options="onSelect:onSelect,required:true" id="ucreattime2" name="receiue.ucreattime" style="width:200px"></td>
				</tr>
				<tr>
					<td>归还时间：</td>
					<td><input class="easyui-datebox" value="10/11/2012" data-options="onSelect:onSelect,required:true" id="uendtime2" name="receiue.uendtime" style="width:200px"></td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();" style="width:80px;height:20px;" >添加</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="addPro1();" style="width:80px;height:20px;">取消</a>
			</div>
		</form>
	</div>

	<div id="mm" class="easyui-menu" style="width: 120px;">
		<div data-options="name:'edit',iconCls:'icon-edit'" onclick="updateCount();">归还</div>
	</div>
</body>
</html>