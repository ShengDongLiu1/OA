<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宿舍管理</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="/Automation/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/hourse/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:true">
    <thead>
    <tr>
        <th data-options="field:'hourid',checkbox:true,width:100" align="center">宿舍编号</th>
        <th data-options="field:'hourname',width:100" align="center">宿舍名称</th>
        <th data-options="field:'hourkz',width:100" align="center">固定人数</th>
        <th data-options="field:'houryz',width:100" align="center">已住人数</th>
        <th data-options="field:'hourhkz',width:100" align="center">可住人数</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();"
       data-options="iconCls:'icon-remove'">删除</a>
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>宿舍名称:</td>
                    <td><input class="easyui-textbox" id="hourname" name="hourse.hourname" data-options="required:true"/></td>
                </tr>
                 <tr>
                    <td>固定人数:</td>
                    <td><input name="hourse.hourkz" id="hourkz" type="text" class="easyui-numberbox" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
                </tr>
                 <tr>
                    <td>已住人数:</td>
                    <td><input name="hourse.houryz" id="houryz" type="text" class="easyui-numberbox" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
                </tr>
                <!--  <tr>
                    <td>可住人数:</td>
                    <td><input name="hourse.hourhkz" id="hourhkz" type="text" class="easyui-numberbox" data-options="max:1000.00,min:0,maxlength:4"  /></td>
                </tr> -->
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#addWindow').dialog('close')" style="width:80px">取消</a>
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
        <input type="hidden" id="hid" name="hourse.hourid" />
            <table>
                <tr>
                    <td>宿舍名称</td>
                    <td>
                        <input class="easyui-textbox" name="hourse.hourname" id="hna"
                               data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>固定人数:</td>
                    <td>
                   		<input name="hourse.hourkz" id="gdr" type="text" class="easyui-numberbox" data-options="required:true,validType:'length[1,20]',novalidate:true"   />
                    </td>
                </tr>
                 <tr>
                    <td>已住人数:</td>
                    <td> <input name="hourse.houryz" id="yzr" type="text" class="easyui-numberbox" data-options="required:true,validType:'length[1,20]',novalidate:true" /></td>
                </tr>
               <!--   <tr>
                    <td>可住人数:</td>
                    <td> <input name="hourse.hourhkz" id="kzr" type="text" class="easyui-numberbox" data-options="max:1000.00,min:0,maxlength:4"  /></td>
                </tr> -->
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#editWindow').dialog('close')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        setPagination("list");
    });
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
    }
    // 添加(提交後臺)
    function add() {
    	 toValidate("ff");
	     if (validateForm("ff")){
			$.get('hourse/add',
				$("#ff").serialize(),
				function(data) {
				if (data.result.result == 'success') {
					$.messager.alert("提示", data.result.msg, "info", function() {
						$("#addWindow").window("close");
						$("#list").datagrid("reload");
						$("#ff").form("clear");
					});
				} else {
					$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
				}
			},"JSON");
		}
		$("#list").datagrid("reload");
    }

    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
        	document.getElementById("hid").value=row.hourid;
            $("#hna").textbox("setValue", row.hourname);
			$("#gdr").numberbox("setValue", row.hourkz);
			$("#yzr").numberbox("setValue", row.houryz);
			/* $("#kzr").numberbox("setValue", row.hourhkz); */
            $("#editWindow").window("open");
            
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
    	if($("#editForm").form("validate")){
			$.get('update',$("#editForm").serialize(),
				function(data) {
				if (data.result.result == 'success') {
					$.messager.alert("提示", data.result.msg, "info", function() {
						$("#editWindow").window("close");
						$("#list").datagrid("reload");
						$("#editForm").form("clear");
					});
				} else {
					$.messager.alert("提示", data.result.msg + " 请稍候再试", "info");
				}
			},"JSON");
		}
    	$("#list").datagrid("reload");
    }
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个选项吗？", function (r) {
                if (r) {
                    $.post("hourse/delete", {'hourse.hourid': row.hourid}, function (data) {
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
            $.messager.alert('提示', '请选中需要删除的选项', 'info');
        }
    }
    // 关闭窗口
    function close(c) {
        alert("da");
        $("#" + c).window("close");
    }
</script>
</body>
</html>