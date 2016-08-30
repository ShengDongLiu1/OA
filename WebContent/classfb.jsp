<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
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
    <title>Insert title here</title>
    <script type="text/javascript">

        //打开添加班级窗口
        function addPro() {
            var limitNum = 10;
            var pattern = '还可以输入' + limitNum + '字';
            $('#classnamets').html(pattern);
            $("#classname").keyup(function () {
                var remain = $(this).val().length;
                if (remain > 10) {
                    pattern = "字数超过10个限制！请重新输入！";
                } else {
                    var result = limitNum - remain;
                    pattern = '还可以输入' + result + '字';
                }
                $("#classnamets").html(pattern);
            });

            var dlimitNum = 50;
            var dpattern = '还可以输入' + dlimitNum + '字';
            $('#wordage').html(dpattern);
            $("#wordtext").keyup(function () {
                var dremain = $(this).val().length;
                if (dremain > 50) {
                    pattern = "字数超过50个限制！请重新输入！";
                } else {
                    var dresult = dlimitNum - dremain;
                    dpattern = '还可以输入' + dresult + '字';
                }
                $("#wordage").html(dpattern);
            });

            $("#rkls").combobox({
                url: "<%=path%>/classes/tjrkls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#rkls').combobox('getData');
                    if (data.length > 0) {
                        $("#rkls").combobox('select', data[0].id);
                    }
                }
            });

            $("#fdls").combobox({
                url: "<%=path%>/classes/tjfdls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#fdls').combobox('getData');
                    if (data.length > 0) {
                        $("#fdls").combobox('select', data[0].id);
                    }
                }
            });

            $("#bzr").combobox({
                url: "<%=path%>/classes/tjls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#bzr').combobox('getData');
                    if (data.length > 0) {
                        $("#bzr").combobox('select', data[0].id);
                    }
                }
            });
            $("#addWin").window("open");
        }

        function trim(str) { //删除左右两端的空格
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }

        function doAdd() {
            var title = document.getElementsByName("classes.classname")[0].value;
            var wordtext = document.getElementsByName("classes.classaddr")[0].value;

            if (trim(title) == "") {
                alert("班级名称填写不能为空，请重新输入！");
                return;
            } else if (title.length > 10) {
                alert("您输入的班级名称不得超过10字，请重新输入！")
                return;
            } else if (wordtext.length > 50) {
                alert("您输入的班级地址不得超过50字，请重新输入！")
                return;
            }
            if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
                $.post("classes/add", $("#addForm").serialize(), 'json')
            }
        }
    </script>
</head>
<body onload="addPro()">

<div id="addWin" class="easyui-window" title="添加班级" data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 400px; height: 450px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
        <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
            <div>班级名称:</div>
            <br/>
            <input class="easyui-textarea" id="classname" name="classes.classname" style="width:300px;height:25px">
            <div id="classnamets"></div>
        </div>
        <div style="margin-bottom:20px;margin-left: 40px;">
            任课老师：<input id="rkls" class="easyui-combobox" data-options="required:true"
                        name="classes.empteach.eid"/><br/><br/>
            辅导老师：<input id="fdls" class="easyui-combobox" data-options="required:true"
                        name="classes.empteachs.eid"/><br/><br/>
            &nbsp;班主任：<input id="bzr" class="easyui-combobox" data-options="required:true"
                             name="classes.empteaches.eid"/>
        </div>
        <div style="margin-bottom: 20px;margin-left: 40px;">
            <div>班级地址:</div>
            <br/>
            <textarea id="wordtext" name="classes.classaddr" style="width:300px;height:50px;"></textarea>
            <div id="wordage"></div>
        </div>
        <div style="margin-left: 170px;float: left;">
            <a href="javascript:;" onclick="closeAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
               style="height:32px;float: left;">取消添加</a>
        </div>
        <div style="margin-left: 20px;float: left;">
            <a href="javascript:;" onclick="doAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
               style="height:32px;">确认添加</a>
        </div>
    </form>
</div>
</body>
</html>