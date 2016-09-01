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
                $.post(
                        "classes/add",
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

        //删除班级的方法
        function removeCP() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
            	if(row.classcount == 0 ){
        			$.messager.confirm("提示","确认要删除这个班级吗？",function(r){
        				if(r){
        					$.post("classes/delete",
        						{'classes.classid':row.classid},function(data) {
        						if (data.result.result == "success") {
        							$.messager.alert("提示", data.result.msg, "info", function() {
        								$("#list").datagrid("reload");	
        							});
        						}
        					});
        				}
        			});
        		}else{
        			$.messager.alert('提示', '班级内还有学生，不能删除！', 'info');
        		}
            } else {
                $.messager.alert('提示', '请选中需要删除的班级', 'info');// messager消息控件
            }
        }

        //修改班级信息
        function edit() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
                document.getElementById("xgclassname").value = row.classname;
                document.getElementById("xgwordtext").value = row.classaddr;
                document.getElementById("classid").value = row.classid;
                document.getElementById("classlx").value = row.classlx;
                document.getElementById("classcount").value = row.classcount;
                var xglimitNum = 10 - row.classname.length;
                var xgpattern = '还可以输入' + xglimitNum + '字';
                $('#xgclassnamets').html(xgpattern);
                $("#xgclassname").keyup(function () {
                    var xgremain = $(this).val().length;
                    if (xgremain > 10) {
                        xgpattern = "字数超过10个限制！请重新输入！";
                    } else {
                        var xgresult = xglimitNum - xgremain;
                        xgpattern = '还可以输入' + xgresult + '字';
                    }
                    $("#xgclassnamets").html(xgpattern);
                });

                var xgdlimitNum = 50 - row.classaddr.length;
                var xgdpattern = '还可以输入' + xgdlimitNum + '字';
                $('#xgwordage').html(xgdpattern);
                $("#xgwordtext").keyup(function () {
                    var xgdremain = $(this).val().length;
                    if (xgdremain > 50) {
                        xgpattern = "字数超过50个限制！请重新输入！";
                    } else {
                        var xgdresult = xgdlimitNum - xgdremain;
                        xgdpattern = '还可以输入' + xgdresult + '字';
                    }
                    $("#xgwordage").html(xgdpattern);
                });

                $("#xgrkls").combobox({
                    url: "<%=path%>/classes/tjrkls",
                    method: 'get',
                    valueField: 'id',
                    textField: 'name',
                    panelHeight: 'auto',
                    onLoadSuccess: function () { //数据加载完毕事件
                        var data = $('#xgrkls').combobox('getData');
                        if (data.length > 0) {
                            $("#xgrkls").combobox('select', data[0].id);
                        }
                    }
                });

                $("#xgfdls").combobox({
                    url: "<%=path%>/classes/tjfdls",
                    method: 'get',
                    valueField: 'id',
                    textField: 'name',
                    panelHeight: 'auto',
                    onLoadSuccess: function () { //数据加载完毕事件
                        var data = $('#xgfdls').combobox('getData');
                        if (data.length > 0) {
                            $("#xgfdls").combobox('select', data[0].id);
                        }
                    }
                });

                $("#xgbzr").combobox({
                    url: "<%=path%>/classes/tjls",
                    method: 'get',
                    valueField: 'id',
                    textField: 'name',
                    panelHeight: 'auto',
                    onLoadSuccess: function () { //数据加载完毕事件
                        var data = $('#xgbzr').combobox('getData');
                        if (data.length > 0) {
                            $("#xgbzr").combobox('select', data[0].id);
                        }
                    }
                });
                $("#editWin").window("open");
            } else {
                $.messager.alert('提示', '请选中需要修改的班级', 'info');// messager消息控件
            }
        }

        function closeEdit() {
            $("#editWin").window("close");
            $("#editForm").form("clear");
        }
        //提交修改
        function doEdit() {
            var row = $("#list").datagrid("getSelected");
            if ($("#editForm").form("validate")) {
                $.post("classes/update",
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

        //选择查看详情
        function addLook() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
                window.location.href = "<%=path%>/classes/query?classes.classid=" + row.classid;
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
    <div style="margin:20px 0 10px 0;"></div>
    <div id="content" class="easyui-panel" title="班级管理" style="width:930px;height:491px;"
         data-options="iconCls:'icon-man',headerCls:'bt'">
        <table id="list" class="easyui-datagrid" data-options=" 
			toolbar:'#tb',
			url:'<%=path %>/classes/queryAll',  	
				method:'get', 
				rownumbers:true,
				singleSelect:true,
				autoRowHeight: true,
				pagination:true,
				border:false,
				pageSize:10">
            <thead>
            <tr>
                <th data-options="field:'classid',checkbox:true" width="100">班级编号</th>
                <th align="center" data-options="field:'classname'" width="150">班级名称</th>
                <th align="center" data-options="field:'empteaches'" width="100" formatter="formatterChesName">班主任</th>
                <th align="center" data-options="field:'classcount'" width="100">班级人数</th>
                <th align="center" data-options="field:'classaddr'" width="400">班级地址</th>
                <th align="center" data-options="field:'classlx'" width="100">班级类型</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px;">
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
               onclick="addPro();">添加班级</a>
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="removeCP();">删除班级</a>
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
               onclick="edit();">修改班级信息</a>
            <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="addLook();">选择查看班级详情</a>
        </div>

        <div id="addWin" class="easyui-window" title="添加班级"
             data-options="iconCls:'icon-edit', closable:true, closed:true"
             style="width: 400px; height: 450px; padding: 5px;">
            <form id="addForm" enctype="multipart/form-data">
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>班级名称:</div>
                    <br/>
                    <input class="easyui-textarea" id="classname" name="classes.classname"
                           style="width:300px;height:25px">
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
                <input type="hidden" id="classid" name="classes.classid"/>
                <input type="hidden" id="classlx" name="classes.classlx"/>
                <input type="hidden" id="classcount" name="classes.classcount"/>
                <div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
                    <div>班级名称:</div>
                    <br/>
                    <input class="easyui-textarea" id="xgclassname" name="classes.classname"
                           style="width:300px;height:25px">
                    <div id="xgclassnamets"></div>
                </div>
                <div style="margin-bottom:20px;margin-left: 40px;">
			                    任课老师：<input id="xgrkls" class="easyui-combobox" data-options="required:true" name="classes.empteach.eid"/><br/><br/>
			                    辅导老师：<input id="xgfdls" class="easyui-combobox" data-options="required:true" name="classes.empteachs.eid"/><br/><br/>
                   &nbsp;班主任：<input id="xgbzr" class="easyui-combobox" data-options="required:true" name="classes.empteaches.eid"/>
                </div>
                <div style="margin-bottom: 20px;margin-left: 40px;">
                    <div>班级地址:</div>
                    <br/>
                    <textarea id="xgwordtext" name="classes.classaddr" style="width:300px;height:50px;"></textarea>
                    <div id="xgwordage"></div>
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
</body>
</html>