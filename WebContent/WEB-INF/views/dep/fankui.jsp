<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String path = request.getContextPath(); %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/mobile.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <title>反馈</title>
    <style type="text/css">
        #wordtext {
            display: inline-block;
            padding: 6px 12px;
            font-size: 12px;
            font-weight: 300;
            line-height: 1.4;
            color: #221919;
            background: #fff;
            border: 1px solid #a4a2a2;
            resize: none;

            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            -webkit-box-sizing: border-box;

            border-radius: 6px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;

            box-shadow: inset 0 1px rgba(34, 25, 25, .15), 0 1px rgba(255, 255, 255, .8);
            -moz-box-shadow: inset 0 1px rgba(34, 25, 25, .15), 0 1px rgba(255, 255, 255, .8);
            -webkit-box-shadow: inset 0 1px rgba(34, 25, 25, .15), 0 1px rgba(255, 255, 255, .8);

            -webkit-transition: all .08s ease-in-out;
            -moz-transition: all .08s ease-in-out;

            min-height: 90px;
        }

        #wordtext:focus {
            border-color: #006499;
            box-shadow: 0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
            -moz-box-shadow: 0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
            -webkit-box-shadow: 0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
        }

        #wordage {
            text-align: right;
            font-size: 14px;
            color: #5e5e5e;
            margin: 10px 0 0 0;
            margin-right: 50px;
        }
    </style>
    <script type="text/javascript">
        //打开添加反馈
        function addPro() {
            //文本框字数提示
            var limitNum = 150;
            var pattern = '还可以输入' + limitNum + '字';
            $('#wordage').html(pattern);
            $("#wordtext").keyup(function () {
                var remain = $(this).val().length;
                if (remain > 150) {
                    pattern = "字数超过150个限制！请重新输入！";
                } else {
                    var result = limitNum - remain;
                    pattern = '还可以输入' + result + '字';
                }
                $("#wordage").html(pattern);
            });
            $("#addWin").window("open");
        }

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

        function trim(str) { //删除左右两端的空格
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }

        function doAdd() {
            var title = document.getElementsByName("fankui.title")[0].value;
            var wordtext = document.getElementsByName("fankui.pro")[0].value;
            if (trim(title) == "" || trim(wordtext) == "") {
                alert("标题或问题填写不能为空，请重新输入！");
                return;
            } else if (title.length > 50) {
                alert("您输入的标题不得超过50字，请重新输入！")
                return;
            } else if (wordtext.length > 150) {
                alert("您输入的问题不得超过150字，请重新输入！")
                return;
            }

            if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
                $.post(
                        "<%=path%>/fankui/add",
                        $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
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

        function closeAdd() {
            $("#addWin").window("close");
            $("#addForm").form("clear");
        }

        function closeHf() {
            $("#hfWin").window("close");
            $("#hfForm").form("clear");
        }

        //选择查看详情
        function addLook() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
                window.location.href = "<%=path%>/fankui/query?fankui.Tbackid=" + row.tbackid;
            } else {
                $.messager.alert('提示', '请选中需要查看的反馈!', 'info');// messager消息控件
            }
        }

        function formatterDepName(value) {
            return value.ename;
        }

    </script>
</head>
<body>
<table id="list" class="easyui-datagrid" data-options=" 
		 width:'960' ,
		toolbar:'#tb',
		url:'<%=path %>/fankui/queryAll', 
			method:'get', 
			rownumbers:true,
			singleSelect:true,
			autoRowHeight: true,
			pagination:true,
			border:false,
			pageSize:10,
			fit:true
			">
    <thead>
    <tr>
        <th align="center" data-options="field:'tbackid',checkbox:true" align="center">编号</th>
        <th align="center" data-options="field:'dep'" width="100" formatter="formatterDepName" align="center">反馈人</th>
        <th align="center" data-options="field:'title'" width="500" align="center">反馈标题</th>
        <th align="center" data-options="field:'ans'" width="100" align="center">是否回复</th>
        <th align="center" data-options="field:'time'" width="200" align="center">反馈时间</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding:5px;">
    <c:if test="${ sessionScope.user.statuss.getZid() ne 11}">
        <c:if test="${ sessionScope.user.statuss.getZid() ne 6}">
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
               onclick="addPro();">添加反馈</a>
        </c:if>
    </c:if>
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
       onclick="addLook();">选择查看详情</a>
</div>
<!-- 添加反馈框 -->
<div id="addWin" class="easyui-window" title="添加反馈" data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 400px; height: 380px; padding: 5px;">
    <form id="addForm">
        <input type="hidden" id="eid" name="fankui.dep.eid" value="${sessionScope.user.dep.getEid()}"/>
        <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
            <div>标题:</div>
            <br/>
            <input class="easyui-textbox" id="title" name="fankui.title" style="width:300px;height:32px">
        </div>
        <div style="margin-bottom: 20px;margin-left: 40px;">
            <div>反馈问题:</div>
            <br/>
            <textarea id="wordtext" name="fankui.pro" style="width:300px;height:120px;"></textarea>
            <div id="wordage"></div>
        </div>
        <div style="margin-left: 170px;float: left;">
            <a href="javascript:;" onclick="closeAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
               style="height:32px;float: left;">取消提交</a>
        </div>
        <div style="margin-left: 20px;float: left;">
            <a href="javascript:;" onclick="doAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
               style="height:32px;">提交问题</a>
        </div>
    </form>
</div>
</body>
</html>