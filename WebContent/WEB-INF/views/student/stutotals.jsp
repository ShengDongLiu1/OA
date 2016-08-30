<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生总结</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>

<script type="text/javascript">
    function studentname(value) {
        return value.intenname;
    }

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
            $("#sid").textbox("setValue", row.sid);
            $("#updatestuid").combobox({
                url: '<%=path%>/stutotal/tjls',
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#updatestuid").combobox("setValue", row.student.intenname);
            $("#updatestuid").combobox('select', row.student.intenid);
            $("#ssay").textbox('setValue', row.ssay);
            $('#semester').combobox({
                panelHeight: 'auto',
                value: row.semester,
            });
            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的总结', 'info');// messager消息控件
        }
    }
    //修改方法
    function doEdit() {
        var row = $("#list").datagrid("getSelected");
        if ($("#editForm").form("validate")) {
            $.post("stutotal/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWin").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "json");
        }
    }

    //删除方法
    function removeCP() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个总结吗？", function (r) {
                if (r) {
                    $.post("stutotal/delete", {
                        'stutotal.sid': row.sid
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
                    }, "json");
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的总结', 'info');// messager消息控件
        }
    }
    //打开添加总结窗口
    function addPro() {
        $("#addWin").window("open");
        $("#addstuid").combobox({
            url: "<%=path%>/stutotal/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addstuid').combobox('getData');
                if (data.length > 0) {
                    $("#addstuid").combobox('select', data[0].id);
                }
            }
        });

        $('#semester2').combobox({
            panelHeight: 'auto',
        });
    }

    function doAdd() {
        if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post("stutotal/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
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
</script>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options=" 
	toolbar:'#tb',
	url:'<%=path%>/stutotal/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'sid',checkbox:true" width="100">学生总结编号</th>
        <th data-options="field:'student'" width="100" formatter="studentname">学生姓名</th>
        <th data-options="field:'ssay'" width="100">学生评语</th>
        <th data-options="field:'semester'" width="100">第几学期</th>
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

<div id="editWin" class="easyui-window" title="修改总结"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 350px; height: 300px; padding: 5px;">
    <form id="editForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择学生:</td>
                <td><br>&nbsp;
                    <input class="easyui-combobox" data-options="required:true" id="updatestuid" name="stutotal.stuid"/><br/><br/>
                </td>
            </tr>
            <tr height="35px;">
                <td>学生评语：</td>
                <td>&nbsp;<input id="ssay" class="easyui-textbox"
                                 name="stutotal.ssay" data-options="multiline:true"
                                 style="width: 200px; height: 100px;"/>
                </td>
            </tr>
            <tr height="35px;">
                <td>第几学期：</td>
                <td>&nbsp;<select class="easyui-combobox" name="stutotal.semester" id="semester" style="width:150px;">
                    <option value="第一学期">第一学期</option>
                    <option value="第二学期">第二学期</option>
                    <option value="第三学期">第三学期</option>
                    <option value="第四学期">第四学期</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="sid"
                           class="easyui-validatebox easyui-textbox"
                           name="stutotal.sid" type="hidden"/>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="doEdit();"
               style="width:80px; height: 20px;">保存</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick=""
               style="width:80px; height: 20px;">取消</a>
        </div>
    </form>
</div>

<!-- 添加产品框  -->
<div id="addWin" class="easyui-window" title="添加总结"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 350px; height: 300px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择学生:</td>
                <td><br>&nbsp;
                    <input class="easyui-combobox" data-options="required:true" id="addstuid"
                           name="stutotal.stuid"/><br/><br/>
                </td>
            </tr>
            <tr height="35px;">
                <td>学生评语：</td>
                <td>&nbsp;<input id="ssay" class="easyui-textbox"
                                 name="stutotal.ssay" data-options="multiline:true"
                                 style="width: 200px; height: 100px;"/>
                </td>
            </tr>
            <tr height="35px;">
                <td>第几学期：</td>
                <td>&nbsp;<select class="easyui-combobox" name="stutotal.semester" id="semester2" style="width:150px;">
                    <option value="第一学期">第一学期</option>
                    <option value="第二学期">第二学期</option>
                    <option value="第三学期">第三学期</option>
                    <option value="第四学期">第四学期</option>
                </select>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick=""
               style="width:80px;height:20px;">取消</a>
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