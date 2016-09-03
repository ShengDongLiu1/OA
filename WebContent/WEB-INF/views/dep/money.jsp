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
    <title>班级管理</title>
    <style type="text/css">
        .bt div {
            font-size: 25px;
        }

        #classnamets {
            text-align: right;
            font-size: 14px;
            color: #5e5e5e;
            margin: 10px 0 0 0;
            margin-right: 50px;
        }

        #wordage {
            text-align: right;
            font-size: 14px;
            color: #5e5e5e;
            margin: 10px 0 0 0;
            margin-right: 50px;
        }

        #xgclassnamets {
            text-align: right;
            font-size: 14px;
            color: #5e5e5e;
            margin: 10px 0 0 0;
            margin-right: 50px;
        }

        #xgwordage {
            text-align: right;
            font-size: 14px;
            color: #5e5e5e;
            margin: 10px 0 0 0;
            margin-right: 50px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            setPagination("list");
        });

        function setPagination(tableId) {
            var p = $("#" + tableId).datagrid("getPager");
            $(p).pagination({
                pageList: [5, 10],
                beforePageText: "第",
                afterPageText: "页     共{pages}页",
                displayMsg: "当前显示{from} - {to} 条记录    共{total}条记录",
                onBeforeRefresh: function () {
                    $(this).pagination("loading");
                    $(this).pagination("loaded");
                }
            })
        }

        //选择查看详情
        function addLook() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
                window.location.href = "<%=path%>/income/batch?classid=" + row.classid;
            } else {
                $.messager.alert('提示', '请选中需要查看的班级!', 'info');// messager消息控件
            }
        }

        function formatterChesName(value) {
            return value.ename;
        }
    </script>
</head>
<body>
<div class="easyui-navpanel">
    <div style="margin:20px 0 10px 0;" style="padding: 2px;height:auto;margin-top: 5px;"></div>
    <table id="list" class="easyui-datagrid" data-options=" 
			toolbar:'#tb',
			url:'<%=path %>/classes/queryAllyk',  	
				method:'get', 
				rownumbers:true,
				singleSelect:true,
				autoRowHeight: true,
				pagination:true,
				border:false,
				pageSize:10,
				">
        <thead>
        <tr>
            <th data-options="field:'classid',checkbox:true" width="100" align="center">班级编号</th>
            <th align="center" data-options="field:'classname'" width="150" align="center">班级名称</th>
            <th align="center" data-options="field:'empteaches'" width="100" formatter="formatterChesName" align="center">班主任</th>
            <th align="center" data-options="field:'classaddr'" width="400" align="center">班级地址</th>
            <th align="center" data-options="field:'classlx'" width="100" align="center">班级类型</th>
        </tr>
        </thead>
    </table>
    <div id="tb" style="padding:5px;">
        <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
           onclick="addLook();">选择班级</a>
        <a href="<%=path %>/income/money" class="easyui-linkbutton" data-options="iconCls:'icon-search'">返回</a>
    </div>
</div>
</body>
</html>