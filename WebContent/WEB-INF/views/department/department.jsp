<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>部门管理</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>

<script type="text/javascript">
    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageSize: 3,
            pageList: [3, 5, 10, 15],
            beforePageText: "第",
            afterPageText: "页    共{pages}页",
            displayMsg: "当前显示{from} - {to} 条记录    共{total}条记录",
            onBeforeRefresh: function () {
                $(this).pagination("loading");
                $(this).pagination("loaded");
            }
        });
    }

    $(function () {
        $("#new").click(function () {
            $.messager.alert("提示", "新建菜单", "info");
        });

        $("#list").datagrid({
            onRowContextMenu: function (e, rowindex, rowData) {//datagrid中的每一行都绑定右键菜单
                e.preventDefault();
                $("#mm").menu("show", {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        });
        setPagination("list");

    });
    function edit() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $("#did").textbox("setValue", row.did);
            $("#dname").textbox('setValue', row.dname);
            $("#dstatus").textbox("setValue", row.dstatus);
            $("#dcreatetime").textbox("setValue", row.dcreatetime);
            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的部门', 'info');// messager消息控件
        }
    }
    function closeupdate() {
        $("#editWin").window("close");

    }
    function doEdit() {
        var row = $("#list").datagrid("getSelected");
        if ($("#editForm").form("validate")) {
            $.post("department/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWin").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "JSON");
        }
    }

    //删除方法
    function removeCP() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个部门吗？", function (r) {
                if (r) {
                    $.post("department/delete", {
                        'department.did': row.did
                    }, function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        } else {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        }
                    }, "JSON");
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的部门', 'info');// messager消息控件
        }
    }
    //打开添加部门窗口
    function addPro() {
        $("#addWin").window("open");
    }

    function doAdd() {
        if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post("department/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWin").window("close");
                                $("#list").datagrid("reload");
                                $("#addForm").form("clear");
                            });
                        } else {
                            $.messger.alert("提示", data.msg, "info");
                        }
                    }, 'json')
        }
    }
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }
</script>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options=" 
	toolbar:'#tb',
	url:'<%=path%>/department/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:true">
    <thead>
    <tr>
        <th data-options="field:'did',checkbox:true" width="100" align="center">部门编号</th>
        <th data-options="field:'dname'" width="100" align="center">部门名称</th>
        <th data-options="field:'dcreatetime'" width="100" align="center">创建时间</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding: 5px;">
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'" onclick="addPro();">添加</a>
    <!-- 链接按钮控件 -->
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'" onclick="removeCP();">移除</a> <a
        href="javascript:;" class="easyui-linkbutton"
        data-options="iconCls:'icon-edit'" onclick="edit();">修改</a>
</div>

<div id="editWin" class="easyui-window" title="修改部门"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 270px; height: 270px; padding: 5px;">
    <form id="editForm" enctype="multipart/form-data">
        <table>
            <tr height="35px;">
                <td>部门编号：</td>
                <td>&nbsp;<input id="did" class="easyui-textbox"
                                 name="department.did" readonly/>
                </td>
            </tr>
            <tr height="35px;">
                <td>部门名称：</td>
                <td>&nbsp;<input id="dname"
                                 class="easyui-validatebox easyui-textbox" name="department.dname"
                                 data-options="required:true, validate:true"/> <!-- novalidate:true 不出现提示 -->
                </td>
            </tr>
            <tr>
                <td>&nbsp;<input id="dcreatetime"
                                 class="easyui-validatebox easyui-textbox"
                                 name="department.dcreatetime" data-options="required:true" type="hidden"/>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="doEdit();"
               style="width:80px; height: 20px;">保存</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               onclick="closeupdate();" style="width:80px; height: 20px;">取消</a>
        </div>
    </form>
</div>

<!-- 添加部门框  -->
<div id="addWin" class="easyui-window" title="添加部门"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 270px; height: 200px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
        <table>
            <tr>
            <tr height="35px;">
                <td>部门名称：</td>
                <td>&nbsp;<input id="dname"
                                 class="easyui-validatebox easyui-textbox" name="department.dname"
                                 data-options="required:true, validate:true"/> <!-- novalidate:true 不出现提示 -->
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 0 0;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               onclick="Winclose('addWin')" style="width:80px;height:20px;">取消</a>
        </div>
    </form>
</div>

<div id="mm" class="easyui-menu" style="width: 120px;">
    <div id="new" data-options="name:'new'">New</div>
    <div data-options="name:'save',iconCls:'icon-save'">Save</div>
    <div data-options="name:'print',iconCls:'icon-print'">Print</div>
    <div class="menu-sep"></div>
    <div data-options="name:'exit'">Exit</div>
</div>
</body>
</html>