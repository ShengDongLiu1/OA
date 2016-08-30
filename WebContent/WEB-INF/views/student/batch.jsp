<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>批量插入</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<div>
    <div style="height: 50px;"></div>
    <form id="addsForm">
        <c:forEach items="${students }" var="stu">
            <div style="margin-bottom:20px; padding-left: 200px; ">
                <input name="stuid" value="${stu.getIntenid()}" type="hidden">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size: 13px;">姓名：</span><input class="easyui-validatebox easyui-textbox"
                                                                disabled="disabled" value="${stu.getIntenname() }"
                                                                style="font-size:15px; width:100px;height:32px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size: 13px;">分数：</span><input class="easyui-textbox" name="score"
                                                                data-options="required:true,validType:'length[1,10]',novalidate:true"
                                                                style="font-size:15px; width:100px;height:32px">
            </div>
        </c:forEach>
        <br/>
        <div style="margin-left: 500px;">
            <span style="font-size: 13px;">科目：</span>
            <input id="subject" class="easyui-combobox" style="height:32px"
                   data-options="required:true,validType:'length[1,10]',novalidate:true" name="subject"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="adds();"
               style="width:100px">提交</a>
        </div>
    </form>
</div>
<br/>
<div style="padding-left: 70%;"><a href="<%=path %>/student/all" data-options="iconCls:'icon-back'"
                                   class="easyui-linkbutton">返回成绩管理</a></div>

<!-- //////////////////////////////////////////////////////////////////// -->

<script type="text/javascript">

    $("#subject").combobox({
        url: "<%=path%>/course/queryCourse",
        method: 'get',
        valueField: 'name',
        textField: 'name',
        panelHeight: 'auto',
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $('#subject').combobox('getData');
            if (data.length > 0) {
                $("#subject").combobox('select', data[0].name);
            }
        }
    });

    function adds() {
        var score = $(".score");
        var subject = $('#subject').combobox('getValue');
        if (trim(subject)) {
            $.post('batchSave', $("#addsForm").serialize(), function (data) {
                if (data.result.result == "success") {
                    $.messager.alert("提示", data.result.msg, "info");
                    $("#addsForm").form("clear");
                } else {
                    $.messager.alert("提示", data.result.msg, "info");
                }
            }, "JSON");
        } else {
            $.messager.alert("提示", "请输入科目名称!", "info");
            return false;
        }
    }
    function trim(str) { //删除左右两端的空格
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
</script>

</body>
</html>