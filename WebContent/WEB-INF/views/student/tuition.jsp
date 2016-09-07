<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/mobile.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/demo.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.mobile.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学费管理</title>
</head>

<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/money/tuition-queryAll', 
		method:'post', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:20,
		fit:true">
    <thead>
    <tr>
        <th data-options="field:'tid',checkbox:true,width:100" align="center">编号</th>
        <th data-options="field:'one',width:100" align="center">预科学费</th>
        <th data-options="field:'two',width:100" align="center">第一学期费用</th>
        <th data-options="field:'three',width:100" align="center">第二学期费用</th>
        <th data-options="field:'four',width:100" align="center">第三学期费用</th>
        <th data-options="field:'five',width:100" align="center">第四学期费用</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
</div>
<!-- 编辑窗口 -->
<div style="margin:20px 0;"></div>
<div id="editWindow" class="easyui-window" title="编辑" data-options="closed:true,iconCls:'icon-edit'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="editForm">
  			<input  id="tid" name="tuition.tid" type="hidden"/>
            <table>
                <tr>
	                <td>预科学费:</td>
	                <td><input class="easyui-textbox easyui-numberbox" id="one" name="tuition.one" style="width: 150px;"
	                           data-options="required:true,novalidate:true"/></td>
           		 </tr>
                <tr>
	                <td>第一学期费用:</td>
	                <td><input class="easyui-textbox easyui-numberbox" id="two" name="tuition.two" style="width: 150px;"
	                           data-options="required:true,novalidate:true"/></td>
           		 </tr>
                <tr>
	                <td>第二学期费用:</td>
	                <td><input class="easyui-textbox easyui-numberbox" id="three" name="tuition.three" style="width: 150px;"
	                           data-options="required:true,novalidate:true"/></td>
           		 </tr>
                <tr>
	                <td>第三学期费用:</td>
	                <td><input class="easyui-textbox easyui-numberbox" id="four" name="tuition.four" style="width: 150px;"
	                           data-options="required:true,novalidate:true"/></td>
           		 </tr>
                <tr>
	                <td>第四学期费用:</td>
	                <td><input class="easyui-textbox easyui-numberbox" id="five" name="tuition.five" style="width: 150px;"
	                           data-options="required:true,novalidate:true"/></td>
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
    $(function () {
        setPagination("list");
    });
    // 显示数据
    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageList: [20, 30, 40],
            beforePageText: "第",
            afterPageText: "页    共{pages}页",
            displayMsg: "当前显示{from} - {to} 条记录    共{total}条记录",
            onBeforeRefresh: function () {
                $(this).pagination("loading");
                $(this).pagination("loaded");
            }
        });
    }
    // 打开编辑窗口
    function editOpen() {
		$("#editWindow").window("open");
    }
    // 编辑提交
    function edit() {
    	toValidate("editForm");
    	if (validateForm("editForm")){
            $.get('update', $("#editForm").serialize(),
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
        $("#list").datagrid('reload');
    }
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }
</script>
</body>
</html>