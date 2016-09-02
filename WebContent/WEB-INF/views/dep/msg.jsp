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
    <title>发布公告</title>
    <style type="text/css">
        #wordage {
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
</head>
<body>
<div class="easyui-navpanel">
    <div style="margin:20px 0 10px 0;"></div>
    <div id="content" class="easyui-panel" title="发布公告" style="width:730px;height:491px;"
         data-options="iconCls:'icon-man'">
        <table id="list" class="easyui-datagrid" data-options=" 
			toolbar:'#tb',
			url:'<%=path %>/msg/queryAll',  	
				pageList:[5,10],
				method:'get', 
				rownumbers:true,
				singleSelect:true,
				autoRowHeight: true,
				pagination:true,
				border:false,
				pageSize:10,
				fit:true">
            <thead>
            <tr>
                <th data-options="field:'msgid',checkbox:true" width="150" align="center">编号</th>
                <th align="center" data-options="field:'msgcon'" width="300" align="center">公告内容</th>
                <th align="center" data-options="field:'msgks'" width="150" align="center">发布时间</th>
                <th align="center" data-options="field:'msgjz'" width="150" align="center">截止时间</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px;">
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
               onclick="addPro();">添加公告</a>
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="removeCP();">删除公告</a>
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
               onclick="edit();">修改公告信息</a>
        </div>

        <div id="addWin" class="easyui-window" title="添加公告"
             data-options="iconCls:'icon-edit', closable:true, closed:true"
             style="width: 400px; height: 400px; padding: 5px;">
            <form id="addForm" enctype="multipart/form-data">
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>公告内容:</div>
                    <br/>
                    <textarea id="wordtext" name="msg.msgcon" style="width:300px;height:50px;"></textarea>
                    <div id="wordage"></div>
                </div>
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>公告开始时间:</div>
                    <br/>
                    <input class="easyui-datetimebox" data-options="required:true" name="msg.msgks" id="msgks"
                           style="width:300px;height:25px">
                </div>
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>公告有效期至:</div>
                    <br/>
                    <input class="easyui-datetimebox" data-options="required:true" name="msg.msgjz"
                           style="width:300px;height:25px">
                </div>
                <div style="margin-left: 170px;float: left;">
                    <a href="javascript:;" onclick="closeAdd();" class="easyui-linkbutton"
                       data-options="iconCls:'icon-remove'" style="height:32px;float: left;">取消添加</a>
                </div>
                <div style="margin-left: 20px;float: left;">
                    <a href="javascript:;" onclick="doAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
                       style="height:32px;">确认添加</a>
                </div>
            </form>
        </div>

        <div id="editWin" class="easyui-window" title="修改班级信息"
             data-options="iconCls:'icon-edit', closable:true, closed:true"
             style="width: 400px; height: 450px; padding: 5px;">
            <form id="editForm" enctype="multipart/form-data">
                <input type="hidden" id="msgid" name="msg.msgid"/>
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>公告内容:</div>
                    <br/>
                    <textarea id="xgwordtext" name="msg.msgcon" style="width:300px;height:50px;"></textarea>
                    <div id="xgwordage"></div>
                </div>
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>公告开始时间:</div>
                    <br/>
                    <input class="easyui-datetimebox" data-options="required:true" name="msg.msgks" id="xgmsgks"
                           style="width:300px;height:25px">
                </div>
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>公告有效期至:</div>
                    <br/>
                    <input class="easyui-datetimebox" data-options="required:true" name="msg.msgjz" id="xgmsgjz"
                           style="width:300px;height:25px">
                </div>
                <div style="margin-left: 170px;float: left;">
                    <a href="javascript:;" onclick="closeEdit();" class="easyui-linkbutton"
                       data-options="iconCls:'icon-remove'" style="height:32px;float: left;">取消修改</a>
                </div>
                <div style="margin-left: 20px;float: left;">
                    <a href="javascript:;" onclick="doEdit();" class="easyui-linkbutton"
                       data-options="iconCls:'icon-ok'" style="height:32px;">确认修改</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    //删除公告的方法
    function removeCP() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个公告吗？", function (r) {
                if (r) {
                    $.post("msg/delete",
                            {'msg.msgid': row.msgid}, function (data) {
                                if (data.result.result == "success") {
                                    $.messager.alert("提示", data.result.msg, "info", function () {
                                        $("#list").datagrid("reload");
                                    });
                                }
                            });
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的公告', 'info');// messager消息控件
        }
    }

    function addPro() {
        var dlimitNum = 300;
        var dpattern = '还可以输入' + dlimitNum + '字';
        $('#wordage').html(dpattern);
        $("#wordtext").keyup(function () {
            var dremain = $(this).val().length;
            if (dremain > 300) {
                pattern = "字数超过300个限制！请重新输入！";
            } else {
                var dresult = dlimitNum - dremain;
                dpattern = '还可以输入' + dresult + '字';
            }
            $("#wordage").html(dpattern);
        });
        $('#msgks').datetimebox('setValue', '9999');
        $("#addWin").window("open");
    }

    function trim(str) { //删除左右两端的空格
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }

    function doAdd() {
        var wordtext = document.getElementsByName("msg.msgcon")[0].value;

        if (trim(wordtext) == "") {
            alert("公告内容填写不能为空，请重新输入！");
            return;
        } else if (wordtext.length > 300) {
            alert("您输入的公告内容不得超过300字，请重新输入！")
            return;
        }

        if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post(
                    "msg/add",
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

    //修改班级信息
    function edit() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            document.getElementById("msgid").value = row.msgid;
            document.getElementById("xgwordtext").value = row.msgcon;
            $('#xgmsgks').datetimebox('setValue', row.msgks);
            $('#xgmsgjz').datetimebox('setValue', row.msgjz);

            var dlimitNum = 300 - row.msgcon.length;
            var dpattern = '还可以输入' + dlimitNum + '字';
            $('#xgwordage').html(dpattern);
            $("#xgwordtext").keyup(function () {
                var dremain = $(this).val().length;
                if (dremain > 300) {
                    pattern = "字数超过300个限制！请重新输入！";
                } else {
                    var dresult = dlimitNum - dremain;
                    dpattern = '还可以输入' + dresult + '字';
                }
                $("#xgwordage").html(dpattern);
            });
            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的公告', 'info');// messager消息控件
        }
    }

    //提交修改
    function doEdit() {
        if ($("#editForm").form("validate")) {
            $.post("msg/update",
                    $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWin").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    });
        }
    }

    function closeEdit() {
        $("#editWin").window("close");
        $("#editForm").form("clear");
    }
</script>
</body>
</html>