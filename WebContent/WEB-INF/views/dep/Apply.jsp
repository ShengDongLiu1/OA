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
		url:'<%=path %>/apply/queryAll', 
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
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'" >添加</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'" >编辑</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'" >删除</a>
		<c:choose>
             <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 7}">
                <a href="javascript:(0);" class="easyui-linkbutton" onclick="updateSP();" data-options="iconCls:'icon-add'">通过审批</a>
             </c:when>
         </c:choose>
         <br/>
		<input class="easyui-textbox" id="name" size="10px" />
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByDepName();" data-options="iconCls:'icon-search'">按员工姓名查询</a>
		<input class="easyui-textbox" id="lname" size="10px" />
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByWorktypeName();" data-options="iconCls:'icon-search'">按物品类型查询</a><br/>
		<input class="easyui-datebox" id="time" size="10px" />
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByTime();" data-options="iconCls:'icon-search'">按时间查询</a>
		<select class="easyui-combobox" style="width: 80px;" id="status" data-options="required:true">
			 <option value="未审批">未审批</option>
			 <option value="已审批">已审批</option>
			 <option value="已购买">已购买</option>
		</select>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByStatus();" data-options="iconCls:'icon-search'">按状态查询</a>
		<a href="javascript:(0);" class="easyui-linkbutton" onclick="QueryAll();" data-options="iconCls:'icon-search'">查询所有</a>
	</div>
	<!-- 添加窗口 -->
	<div style="margin:20px 0;"></div>
	<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'" style="padding:10px;">
		<div style="padding:10px 60px 20px 60px">
			<form id="ff" method="post">
			<input type="hidden" id="eid" name="apply.dep.eid" value="${sessionScope.user.dep.getEid()}" />
			  	<table>
					<tr>
						<td>物品名称:</td>
						<td><input class="easyui-textbox" name="apply.gname" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
					</tr>
					<tr>
						<td>物品类型:</td>
						<td><input class="easyui-combobox" id="wid" name="apply.worktype.swid" data-options="required:true" /></td>
					</tr>
					<tr>
						<td>物品数量:</td>
						<td><input class="easyui-numberbox" name="apply.gcounts"
							data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
					</tr>
					<tr>
						<td>物品单价:</td>
						<td><input class="easyui-numberbox" name="apply.gprice"
							data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
					</tr>
					<tr>
						<td>物品用途:</td>
						<td><input class="easyui-textbox" name="apply.gpurpose"
							data-options="required:true,validType:'length[5,20]',novalidate:true, multiline:true" style="width: 150px;height: 55px;" name="dep.eaddr"/></td>
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
			<input type="hidden" id="aid" name="apply.aid" />
			<input type="hidden" id="astatus" name="apply.astatus" />
			<input type="hidden" id="ei" name="apply.dep.eid" />
			<table>
				<tr>
					<td>物品名称</td>
					<td>
						<input class="easyui-textbox" name="apply.gname" id="gn" data-options="required:true,validType:'length[1,20]',novalidate:true" /><!-- 由dataoptions指定验证的规则 -->
					</td>
				</tr>
				<tr>
					<td>物品类型:</td>
					<td><input class="easyui-combobox" id="wi" name="apply.worktype.swid" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>物品数量</td>
					<td><input class="easyui-numberbox" id="gs" name="apply.gcounts" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
				</tr>
				<tr>
					<td>物品单价</td>
					<td><input class="easyui-numberbox" id="gp" name="apply.gprice" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
				</tr>
				<tr>
					<td>物品用途</td>
					<td><input class="easyui-textbox" id="gpe" name="apply.gpurpose" data-options="required:true,validType:'length[5,20]',novalidate:true, multiline:true"  style="width: 150px;height: 55px;" name="dep.eaddr"/></td>
				</tr>
				<tr>
					<td>申请时间:</td>
					<td><input class="easyui-datetimebox" id="dt" value="apply.adatetime" name="apply.adatetime" data-options="required:true" /></td>
				</tr>
			</table>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();" style="width:80px">保存</a>
				<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="Winclose('editWindow')" style="width:80px">取消</a>
			</div>
		</form>
		</div>
	</div>
	<c:choose>
        <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 7}">
		<div id="mm" class="easyui-menu" style="width: 120px;">
			<div data-options="name:'add',iconCls:'icon-edit'" onclick="updateSP();">审批</div>
		</div>
		</c:when>
	</c:choose>
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
		// 打开添加窗口
		function addOpen() {
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
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		 function add(){
			 toValidate("ff");
		     if (validateForm("ff")){
				$.post('<%=path%>/apply/add',$("#ff").serialize(),
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
				document.getElementById("astatus").value = row.astatus;
				document.getElementById("ei").value = row.dep.eid;
				$("#gn").textbox("setValue", row.gname);
				$("#gs").textbox("setValue", row.gcounts);
				$("#gp").textbox("setValue", row.gprice);
				$("#gt").textbox("setValue", row.gtotle);
				$("#gpe").textbox("setValue", row.gpurpose);
				$("#dt").textbox("setValue", row.adatetime);
				$("#editWindow").window("open");
			} else {
				$.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
			}
		}
		// 编辑提交
		function edit(){
			toValidate("editForm");
	    	if (validateForm("editForm")){
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
				$.post('apply/updateSP',{'apply.aid':row.aid,'apply.astatus':row.astatus,"apply.gprice":row.gprice,"apply.gcounts":row.gcounts,"apply.worktype.swid":row.worktype.swid,"apply.gname":row.gname},
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
				$.messager.confirm("提示", "确认要删除吗？", function(r) {
					if (r) {
						$.post("apply/delete",{'apply.aid':row.aid,'apply.astatus':row.astatus}, function(data) {
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
				$.messager.alert('提示', '请选中需要删除的lie', 'info');
			}
		}
		// 关闭窗口
		function Winclose(c) {
			$("#" + c).window("close");
		}
		//绑定查询按钮的的点击事件
		function queryByDepName() {
            //按条件进行查询数据，首先我们得到数据的值
            name=$('#name').val()
            $('#list').datagrid('load',{  
            	name:name
            });
		}
		function queryByWorktypeName(){
            lname=$('#lname').val()
            $('#list').datagrid('load',{  
            	lname:lname
            }); 
		}
		function queryByTime(){
			var time = $('#time').datebox('getValue')
	        $('#list').datagrid('load',{  
	        	time:time
	        }); 
		}
		function queryByStatus(){
			status=$('#status').combobox('getValue');
            $('#list').datagrid('load',{  
            	status:status
            }); 
		}
		function QueryAll(){
		  	$('#list').datagrid('load', {   
		  		name:'',
		  		lname:'',
		  		time:'',
		  		status:''
			});
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