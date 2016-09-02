<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>反馈</title>
    <link rel="stylesheet"
          href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb"
       data-options="
		url:'<%=path %>/sback/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:t:true">
    <thead>
    <tr>
        <th data-options="field:'sbackid',checkbox:true,width:100" align="center">意见编码</th>
        <th data-options="field:'student',width:100" formatter="forStudentName" align="center">学生编码</th>
        <th data-options="field:'sbacktitle',width:100" align="center">意见标题</th>
        <th data-options="field:'sbackcon',width:100" align="center">意见内容</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton"
       onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
</div>
<!-- 添加窗口 -->
<div style="margin: 20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加"
     data-options="closed:true,iconCls:'icon-add'" style="padding: 10px;">
    <div style="padding: 10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>Stdid:</td>
                    <td><input class="easyui-combobox" id="stdid" name="sback.student.intenid"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Sbacktitle:</td>
                    <td><input class="easyui-textbox" name="sback.sbacktitle"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Sbackcon:</td>
                    <td><input class="easyui-textbox" name="sback.sbackcon"
                               data-options="required:true"/></td>
                </tr>
            </table>
            <div data-options="region:'south',border:false"
                 style="text-align: right; padding: 5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton"
                   data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width: 80px">添加</a> <a href="javascript:(0);"
                                                 class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                                                 onclick="closeAdd();" style="width: 80px">取消</a>
            </div>
        </form>
    </div>
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
        $("#stdid").combobox({
            url: "<%=path%>/sback/xzxs",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#stdid').combobox('getData');
                if (data.length > 0) {
                    $("#stdid").combobox('select', data[0].id);
                }
            }
        });
        $("#addWindow").window("open");
    }
    // 添加(提交後臺)
    function add() {
        if ($("#ff").form("validate")) {
            var stdid = $("#stdid").val();
            var sbacktitle = $("#sbacktitle").val();
            var sbackcon = $("#sbackcon").val();
            $.get('sback/add', $("#ff").serialize(), "JSON");
            $("#ff").form("clear");
            $("#addWindow").window("close");
            $('#list').datagrid("reload");
            $.messager.show({
                title: '提示消息',
                msg: '添加成功',
                showType: 'show'
            });
        }
        $("#list").datagrid('reload');
    }
    function closeAdd() {
        $("#ff").form("clear");
        $("#addWindow").window("close");
    }
</script>
</body>
</html>