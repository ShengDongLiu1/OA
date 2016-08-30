<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'comid',checkbox:true,width:100">电脑编号</th>
        <th data-options="field:'coma',width:100">电脑部件</th>
        <th data-options="field:'comb',width:100">电脑整体</th>
        <th data-options="field:'student',width:100" formatter="forStudentName">学生编码</th>
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
                    <td>Coma:</td>
                    <td><input class="easyui-textbox" name="computer.coma" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Comb:</td>
                    <td><input class="easyui-textbox" name="computer.comb" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Stuid:</td>
                    <td><input class="easyui-combobox" id="stuid" name="computer.student.intenid"
                               data-options="required:true"/></td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="Winclose('addWindow')" style="width:80px">取消</a>
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
            <table>
                <tr>
                    <td>电脑编号</td>
                    <td>
                        <input class="easyui-textbox" name="computer.comid" id="ci" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>电脑部件</td>
                    <td>
                        <input class="easyui-textbox" name="computer.coma" id="ca" data-options="required:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td>电脑整体</td>
                    <td><input class="easyui-textbox" id="cb" name="computer.comb" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>学生编码</td>
                    <td><input class="easyui-combobox" id="si" name="computer.student.intenid"
                               data-options="required:true"/></td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="Winclose('editWindow')" style="width:80px">取消</a>
            </div>
        </form>
    </div>

</div>

<script type="text/javascript">
    function forStudentName(value) {
        return value.intenname;
    }
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
    function add() {
        if ($("#ff").form("validate")) {
            $.get('computer/add', $("#ff").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#ff").form("clear");
                                $("#addWindow").window("close");
                                $("#list").datagrid('reload');
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "JSON");
        }
    }
    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
            $("#ci").textbox("setValue", row.comid);
            $("#ca").textbox("setValue", row.coma);
            $("#cb").textbox("setValue", row.comb);
            $("#si").combobox({
                url: "<%=path%>/computer/xzxs",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#si').combobox('getData');
                    if (data.length > 0) {
                        $("#si").combobox('select', data[0].id);
                    }
                }
            });
            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
        if ($("#editForm").form("validate")) {
            $.post('computer/update', $("#editForm").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWindow").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "JSON");
        }
    }
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个产品吗？", function (r) {
                if (r) {
                    $.post("computer/delete", {'computer.comid': row.comid}, function (data) {
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
            $.messager.alert('提示', '请选中需要删除的产品', 'info');
        }
    }
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }
</script>
</body>
</html>