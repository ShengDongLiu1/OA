<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
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
    function depdname(value) {
        return value.ename;
    }

    function workname1(value) {
        return value.wname;
    }

    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageSize: 10,
            pageList: [10, 15],
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
            $("#rece").combobox({
                url: "<%=path%>/receiue/tjls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#rece').combobox('getData');
                    if (data.length > 0) {
                        $("#rece").combobox('select', data[0].id);
                    }
                }
            });
            $("#uid").textbox("setValue", row.uid);
            $("#workname").combobox({
                url: "<%=path%>/receiue/tjls2",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#workname').combobox('getData');
                    if (data.length > 0) {
                        $("#workname").combobox('select', data[0].id);
                    }
                }
            });
            $('#ugname').combobox({
                value: row.ugname,
                listHeight: 10
            });
            $("#ucount").textbox('setValue', row.ucount);
            $("#upurpose").textbox('setValue', row.upurpose);
            $("#ucreattime").textbox('setValue', row.ucreattime);
            $("#uendtime").textbox('setValue', row.uendtime);
            $('#restore').combobox({
                value: row.restore,
                listHeight: 5
            });

            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的申领记录', 'info');// messager消息控件
        }
    }
    //修改方法
    function doEdit() {
        var row = $("#list").datagrid("getSelected");
        if ($("#editForm").form("validate")) {
            if (row) {
                var ucount1 = row.ucount;
                $.get('count1', {'ucount1': ucount1}, "json");
                $.post("receiue/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                        function (data) {
                            if (data.result.result == 'success') {
                                $.messager.alert("提示", data.result.msg, "info", function () {
                                    $("#editWin").window("close");
                                    $("#list").datagrid("reload");
                                });
                            } else {
                                $.messager.alert("提示", data.result.msg, "info");
                            }
                        }, "json");
            }
        }
    }
    function editPro() {
        $("#editWin").window("close");
    }
    //删除方法
    function removeCP() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个申领记录吗？", function (r) {
                if (r) {
                    $.post("receiue/delete", {
                        'receiue.uid': row.uid
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
            $.messager.alert('提示', '请选中需要删除的申领记录', 'info');// messager消息控件
        }
    }

    //删除方法
    function updateCount() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.post("receiue/guihuan", {
                'receiue.uid': row.uid, 'receiue.wid': row.wid
            }, function (data) {
                alert(data)
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

        } else {
            $.messager.alert('提示', '请选中需要删除的申领记录', 'info');// messager消息控件
        }
    }

    //打开添加申领记录窗口
    function addPro() {
        $("#addWin").window("open");
        $("#addrece").combobox({
            url: "<%=path%>/receiue/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addrece').combobox('getData');
                if (data.length > 0) {
                    $("#addrece").combobox('select', data[0].id);
                }
            }
        });

        $("#addwork").combobox({
            url: "<%=path%>/receiue/tjls2",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addwork').combobox('getData');
                if (data.length > 0) {
                    $("#addwork").combobox('select', data[0].id);
                }
            }
        });
    }
    function addPro1() {
        $("#addWin").window("close");
    }
    function doAdd() {
        if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post("receiue/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
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
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'uid',checkbox:true" width="100">员工申领记录编号</th>
        <th data-options="field:'dep'" width="100" formatter="depdname">员工编号</th>
        <th data-options="field:'work'" width="100" formatter="workname1">申领物品名称</th>
        <th data-options="field:'ucount'" width="100">申领物品数量</th>
        <th data-options="field:'upurpose'" width="100">用途</th>
        <th data-options="field:'ucreattime'" width="100">创建时间</th>
        <th data-options="field:'uendtime'" width="100">结束时间</th>
        <th data-options="field:'restore'" width="100">借还状态</th>
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
     style="width: 350px; height: 300px; padding: 5px;">
    <form id="editForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择员工:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true" id="rece" name="receiue.eid"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>选择物品:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true" id="workname"
                           name="receiue.wid"/><br/><br/>
                </td>
            </tr>
            <tr height="35px;">
                <td>申领物品数量：</td>
                <td>&nbsp;<input id="ucount" class="easyui-textbox"
                                 name="receiue.ucount"/>
                </td>
            </tr>
            <tr height="35px;">
                <td>用途：</td>
                <td>&nbsp;<input id="upurpose" class="easyui-textbox"
                                 name="receiue.upurpose"/>
                </td>
            </tr>
            <tr>
                <td>创建时间</td>
                <td><input class="easyui-datebox" value="10/11/2012" id="ucreattime" name="receiue.ucreattime"
                           style="width:200px"></td>
            </tr>
            <tr>
                <td>结束时间</td>
                <td><input class="easyui-datebox" value="10/11/2012" id="uendtime" name="receiue.uendtime"
                           style="width:200px"></td>
            </tr>
            <tr height="35px;">
                <td>借还状态：</td>
                <td>&nbsp;<select class="easyui-combobox" name="receiue.restore" id="restore" style="width:150px;">
                    <option value="借">正在借用</option>
                    <option value="还">已经归还</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="uid"
                           class="easyui-validatebox easyui-textbox"
                           name="receiue.uid" type="hidden"/>
                </td>
            </tr>


        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="doEdit();"
               style="width:80px; height: 20px;">保存</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               onclick="editPro();" style="width:80px; height: 20px;">取消</a>
        </div>
    </form>
</div>

<!-- 添加产品框  -->
<div id="addWin" class="easyui-window" title="添加申领记录"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 350px; height: 300px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择员工:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true" id="addrece"
                           name="receiue.eid"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>选择物品:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true" id="addwork"
                           name="receiue.wid"/><br/><br/>
                </td>
            </tr>
            <tr height="35px;">
                <td>申领物品数量：</td>
                <td>&nbsp;<input id="ucount" class="easyui-textbox"
                                 name="receiue.ucount"/>
                </td>
            </tr>
            <tr height="35px;">
                <td>用途：</td>
                <td>&nbsp;<input id="upurpose" class="easyui-textbox"
                                 name="receiue.upurpose"/>
                </td>
            </tr>
            <tr>
                <td>创建时间：</td>
                <td><input class="easyui-datebox" value="10/11/2012" id="ucreattime" name="receiue.ucreattime"
                           style="width:200px"></td>
            </tr>
            <tr>
                <td>结束时间：</td>
                <td><input class="easyui-datebox" value="10/11/2012" id="uendtime" name="receiue.uendtime"
                           style="width:200px"></td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               onclick="addPro1();" style="width:80px;height:20px;">取消</a>
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