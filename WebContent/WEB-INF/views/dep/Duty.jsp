<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>巡查情况</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="/Automation/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
	
<script type="text/javascript">
    $(function () {
        setPagination("list");
    });
    
    function depname(value){
    	return value.ename;
    }
    // 显示数据
    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageList: [5, 10, 15, 20],
            beforePageText: "第",
            afterPageText: "页    共{pages}页",
            displayMsg: "当前显示{from} - {to} 条记录    共{total}条记录",
            onBeforeRefresh: function () {
                $(this).pagination("loading");
                $(this).pagination("loaded");
            }
        });
    }
    // 打开添加窗口
    function addOpen() {
        $("#addWindow").window("open");
	$('#dstatuses').combobox({
		url : 'tjls3',
			editable : false, //不可编辑状态  
			cache : false,
			panelHeight : '150',
			valueField : 'name',
			textField : 'name',

			onHidePanel : function() {
				$("#addddrange1").combobox("setValue", '');//清空课程  
				var id = $('#dstatuses').combobox('getValue');

				$.ajax({
					type : "POST",
					url : 'tjls2?lx='+id,
					cache : false,
					dataType : "json",
					success : function(data) {
						$("#addddrange1").combobox("loadData", data);
						}
					});
			}
		});
		$('#addddrange1').combobox({   
	        //url:'itemManage!categorytbl',   
	        editable:false, //不可编辑状态  
	        cache: false,  
	        panelHeight: '150',//自动高度适合  
	        valueField:'name',     
	        textField:'name'  
	       });  

    }
    // 添加(提交後臺)
    function add() {
    	toValidate("ff");
    	if (validateForm("ff")) {
            $.post('duty/add',$("#ff").serialize(),
            		 function (data) {
                if (data.result.result == 'success') {
                    $.messager.alert("提示", data.result.msg, "info", function () {
                        $("#addWindow").window("close");
                        $("#list").datagrid("reload");
                        $("#ff").form("clear");
                    });
                } else {
                    $.messger.alert("提示", data.msg, "info");
                }
            }, 'json');
        }
    }

    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
            $("#editWindow").window("open");
            document.getElementById("did").value = row.did;
            document.getElementById("depid").value = row.dep.eid;
            
        	$('#dstatus').combobox({
        		url : 'tjls3',
       			editable : false, //不可编辑状态  
       			cache : false,
       			panelHeight : '150',
       			valueField : 'name',
       			textField : 'name',

       			onHidePanel : function() {
    				$("#updatedrange").combobox("setValue", '');//清空课程  
       				var id = $('#dstatus').combobox('getValue');

       				$.ajax({
       					type : "POST",
       					url : 'tjls2?lx='+id,
       					cache : false,
       					dataType : "json",
       					success : function(data) {
       						$("#updatedrange").combobox("loadData", data);
       						}
       					});
        			}
        		});
            $("#dstatus").combobox("setValue", row.dstatus);
            $("#dstatus").combobox('select', row.dstatus);
       		$('#updatedrange').combobox({   
       	       	url:'tjls2?lx='+row.dstatus,  
       	        editable:true, //不可编辑状态  
       	        cache: false,  
       	        panelHeight: '150',//自动高度适合  
       	        valueField:'name',     
       	        textField:'name'  
       	       });  
            $("#updatedrange").combobox("setValue", row.drange);
            $("#updatedrange").combobox('select', row.drange);
            $("#ddatetime").textbox("setValue", row.ddatetime);
            $("#ddesc").textbox('setValue', row.ddesc);
            
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
    	toValidate("editForm");
    	if (validateForm("editForm")) {
    		$.post("duty/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWindow").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "json");
        }
    }
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个巡查记录吗？", function (r) {
                if (r) {
                    $.post("duty/delete", {'duty.did': row.did}, function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        }
                    }, "JSON");
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的巡查记录', 'info');
        }
        $("#list").datagrid('reload');
    }
    
    
</script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/duty/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,
		fit:true">
    <thead>
    <tr>
        <th data-options="field:'did',checkbox:true,width:100" align="center">值班管理编号</th>
        <th data-options="field:'dep',width:100" align="center" formatter="depname">班主任姓名</th>
        <th data-options="field:'ddatetime',width:150" align="center">巡查时间</th>
         <th data-options="field:'dstatus',width:100" align="center">巡查类型</th>
     	<th data-options="field:'drange',width:100" align="center">巡查范围</th>
        <th data-options="field:'ddesc',width:500" align="center">情况记录</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'">删除</a>
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
        	<input type="hidden" id="eid" name="duty.eid" value="${sessionScope.user.dep.getEid()}" />
            <table>
                <tr>
                    <td>值班时间:</td>
                    <td>
                    	<input class="easyui-datetimebox" name="duty.ddatetime" style="width: 150px;" 
                    		   data-options="required:true,novalidate:true"><br/><br/>
                    </td>
                </tr>
                 <tr>
                    <td>巡查类型:</td>
               		<td>
               			<input class="easyui-combobox" data-options="required:true,novalidate:true" id="dstatuses" name="duty.dstatus" /><br/><br/>
                    </td>
                </tr>
            	<tr>
		  			<td>巡查对象:</td>
		  			<td>
		  			<input class="easyui-combobox" data-options="required:true,novalidate:true" id="addddrange1" name="duty.drange" /><br/><br/>
		  			</td>
		  		</tr>
                <tr>
                    <td>情况记录:</td>
                    <td>
                   	 <input class="easyui-textbox" name="duty.ddesc" data-options="validType:'length[5,30]',multiline:true,required:true,novalidate:true" style="width:150px;height:60px"><br/>
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWindow').dialog('close')"
                   style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>
<!-- 编辑窗口 -->
<div style="margin:20px 0;"></div>
<div id="editWindow" class="easyui-window" title="编辑" data-options="closed:true,iconCls:'icon-edit'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="editForm">
        	<input type="hidden" id="did" name="duty.did" />
        	<input type="hidden" id="depid" name="duty.eid" />
            <table>
                <tr>
                    <td>巡查时间:</td>
                    <td>
                    	<input class="easyui-datetimebox" id="ddatetime" name="duty.ddatetime" style="width: 150px;" 
                    		   data-options="required:true,novalidate:true"><br/><br/>
                    </td>
                </tr>
                <tr>
               		 <td>巡查类型:</td>
               		<td>
               			<input class="easyui-combobox" data-options="required:true,novalidate:true" id="dstatus" name="duty.dstatus" /><br/><br/>
                    </td>
                </tr>
                <tr>
		  			<td>巡查对象:</td>
		  			<td>
		  			<input class="easyui-combobox" data-options="required:true" id="updatedrange" name="duty.drange" /><br/><br/>
		  			</td>
		  		</tr>
                <tr>
                    <td>情况记录:</td>
                    <td>
                    <input class="easyui-textbox" id="ddesc" name="duty.ddesc" data-options="validType:'length[5,30]',multiline:true,required:true,novalidate:true" style="width:150px;height:60px"><br/>
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#editWindow').dialog('close')"
                   style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>