<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>项目答辩管理</title>
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
		url:'<%=path %>/items/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'xid',checkbox:true,width:100">编号</th>
        <th data-options="field:'sname',width:100">项目名称</th>
        <th data-options="field:'sstuid',width:100">学生编码</th>
        <th data-options="field:'steacher',width:100">指导老师</th>
        <th data-options="field:'sdate',width:100">答辩时间</th>
        <th data-options="field:'score',width:100">答辩成绩</th>
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
            <table>
                <tr>
                    <td>项目名称</td>
                    <td>
                        <input class="easyui-textbox" id="sname" name="items.sname" data-options="required:true">
                    </td>
                </tr>
                <tr>
                    <td>学生编码:</td>
                    <td><input class="easyui-textbox" id="sstuid" name="items.sstuid" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>指导老师:</td>
                    <td><input class="easyui-textbox" id="steacher" name="items.steacher" data-options="required:true">
                    </td>
                </tr>

                <tr>
                    <td>答辩时间:</td>
                    <td><input class="easyui-textbox" id="sdate" name="items.sdate" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>答辩成绩:</td>
                    <td><input class="easyui-textbox" id="score" name="items.score" data-options="required:true"></td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick=""
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
            <table>
                <tr>
                    <td>编号</td>
                    <td>
                        <input class="easyui-textbox" name="xid" id="xid" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>项目名称</td>
                    <td>
                        <input class="easyui-textbox" name="sname" id="sname" data-options="required:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td>学生编码</td>
                    <td>
                        <input class="easyui-textbox" name="sstuid" id="sstuid" data-options="required:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td>指导老师</td>
                    <td>
                        <input class="easyui-textbox" name="steacher" id="steacher" data-options="required:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td>答辩时间</td>
                    <td>
                        <input class="easyui-textbox" name="sdate" id="sdate" data-options="required:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td>答辩成绩</td>
                    <td>
                        <input class="easyui-textbox" name="score" id="score" data-options="required:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick=""
                   style="width:80px">取消</a>
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
        if ($("#ff").form("validate")) {
            $.get('items/add', $("#ff").serialize(), "JSON");
            $("#ff").form("clear");
            $("#addWindow").window("close");
            $("#list").datagrid('reload');
            $.messager.show({
                title: '提示消息',
                msg: '添加成功',
                showType: 'show'
            });
        }
    }
    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
            $("#editForm").form("load", row);
            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {

        if ($("#editForm").form("validate")) {
            var xid = $("#xid").val();
            var sname = $("#sname").val();
            var sstuid = $("#sstuid").val();
            var steacher = $("#steacher").val();
            var sdate = $("#sdate").val();
            var score = $("#score").val();
            $.get('items/update', {
                'items.xid': xid,
                'items.sname': sname,
                'items.sstuid': sstuid,
                'items.steacher': steacher,
                'items.sdate': sdate,
                'items.score': score
            }, "JSON");
            $("#editForm").form("clear");
            $("#editWindow").window("close");
            $("#list").datagrid('reload');
            $.messager.show({
                title: '提示消息',
                msg: '编辑成功',
                showType: 'show'
            });
        }
    }
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $("#editForm").form("load", row);
            $.post('items/delete', {'items.xid': row.id}, "JSON");
            $("#list").datagrid('reload');
            $.messager.show({
                title: '提示消息',
                msg: '删除成功',
                showType: 'show'
            });
            $("#list").datagrid('reload');
        } else {
            $.messager.alert('提示', '请选中需要删除的产品', 'info');
        }
        $("#list").datagrid('reload');
    }
</script>
</body>
</html>