<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String path = request.getContextPath();%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        .bt div {
            font-size: 25px;
        }
    </style>
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
    <script type="text/javascript">
        $(function () {
            setPagination("list");
        });

        function setPagination(tableId) {
            var p = $("#" + tableId).datagrid("getPager");
            $(p).pagination({
                pageList: [5, 10, 15],
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
                window.location.href = "<%=path%>/stu/query?student.intenid=" + row.intenid;
            } else {
                $.messager.alert('提示', '请选中需要查看的班级!', 'info');// messager消息控件
            }
        }
    </script>
    <title>班级详情信息</title>
</head>
<body>
<div class="easyui-navpanel">
    <div style="margin:20px 0 10px 0;"></div>
    <div id="content" class="easyui-panel" data-options="footer:'#ft'" style="width:711px;height:600px;"
         data-options="headerCls:'bt'">
        <header>
            <div class="m-toolbar">
                <div class="m-left" style="margin-left: 60px;">
                    <a href="<%=path%>/classes/allyk?lx=${lx}" class="easyui-linkbutton m-back"
                       data-options="plain:true,outline:true,back:true">返回班级列表</a>
                </div>
                <div><h2><s:property value="classes.classname"/>详情信息</h2></div>
            </div>
        </header>
        <!-- 表格 -->
        <table id="list" class="easyui-datagrid" data-options="
				toolbar:'#tb',
				url:'<%=path %>/stu/queryAllstu?student.classes.classid=${classes.classid}', 
				method:'get', 
				rownumbers:true,
				singleSelect:true,
				autoRowHeight: true,
				pagination:true,
				border:false,
				pageSize:10">
            <thead>
            <tr>
                <th data-options="field:'intenid',checkbox:true,width:100">学生编号</th>
                <th data-options="field:'intenname',width:100" align="center">学生姓名</th>
                <th data-options="field:'intensch',width:150" align="center">就读学校</th>
                <th data-options="field:'intensex',width:100" align="center">性别</th>
                <th data-options="field:'intenbir',width:150" align="center">出生年月</th>
                <th data-options="field:'intentel',width:150" align="center">学生号码</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px;">
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="addLook();">选择查看学生详情</a>
        </div>
    </div>
    <div id="ft" style="padding:5px;">
        <div>
            <div style="float: left;">任课老师：<s:property value="classes.empteach.ename"/></div>
            <div style="float: left; margin-left: 180px;">辅导老师：<s:property value="classes.empteachs.ename"/></div>
            <div style="float: right;">班主任：<s:property value="classes.empteaches.ename"/></div>
        </div>
        <br/><br/>
        <div style="float: left;">
            学生人数：<s:property value="classes.classcount"/>
        </div>
        <div style="float: left;margin-left: 150px;">
            班级地址：<s:property value="classes.classaddr"/>
        </div>
    </div>
</div>
</body>
</html>