<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>值班情况</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="/Automation/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/duty/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'did',checkbox:true,width:100">值班管理编号</th>
        <th data-options="field:'eid',width:100">员工编号</th>
        <th data-options="field:'ddatetime',width:100">值班时间</th>
        <th data-options="field:'drange',width:100">值班范围</th>
        <th data-options="field:'ddesc',width:100">情况记录</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'">删除</a>
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>员工姓名:</td>
                    <td><input class="easyui-numberbox" id="eid" data-options="required:true,validType:'length[1,5]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>值班时间:</td>
                    <td>
                    	<input class="easyui-datetimebox" id="ddatetime" style="width: 150px;" 
                    		   data-options="required:true,novalidate:true">
                    </td>
                </tr>
                <tr>
                    <td>值班范围:</td>
                    <td><input class="easyui-textbox" id="drange" data-options="required:true,validType:'length[1,10]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>情况记录:</td>
                    <td>
                    <input class="easyui-textbox" id="ddesc" data-options="multiline:true,required:true,novalidate:true" style="width:150px;height:60px">
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWindow').dialog('close')"
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
                    <td>管理编号：</td>
                    <td>
                        <input class="textbox" name="did" style="height:25px;width:150px;" id="ddid" readonly/>
                    </td>
                </tr>
                <tr>
                    <td><br/>员工姓名：</td>
                    <td><br/>
                        <input class="easyui-validatebox textbox" style="height:25px;width:150px;" name="eid" id="dutyeid" data-options="required:true,validType:'length[1,10]',novalidate:true"/>
                        <!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td><br/>值班时间：</td>
                    <td><br/>
                        <input class="easyui-datetimebox" style="height:25px;width:150px;" name="ddatetime" id="dutyddatetime"
                               data-options="required:true,novalidate:true"/><!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td><br/>值班范围：</td>
                    <td><br/>
                        <input class="easyui-validatebox textbox" style="height:25px;width:150px;" name="drange" id="dutydrange"
                               data-options="required:true,validType:'length[1,10]',novalidate:true"/><!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
                <tr>
                    <td><br/>情况记录：</td>
                    <td><br/>
                        <input class="easyui-textbox" style="width:150px;height:100px" name="ddesc" id="dutyddesc"
                               data-options="multiline:true,required:true,novalidate:true"/><!-- 由dataoptions指定验证的规则 -->
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#editWindow').dialog('close')"
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
    	toValidate("ff");
    	if (validateForm("ff")) {
            var eid = $("#eid").val();
            var ddatetime = $("#ddatetime").val();
            var drange = $("#drange").val();
            var ddesc = $("#ddesc").val();
            $.get('duty/add', {
                        'duty.eid': eid,
                        'duty.ddatetime': ddatetime,
                        'duty.drange': drange,
                        'duty.ddesc': ddesc
                    },
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWindow").window("close");
                                $("#list").datagrid("reload");
                                $("#ff").form("clear");
                            });
                        } else {
                            $.messger.alert("提示", data.msg, "info");
                        }
                    }, "JSON");
        }
        $("#list").datagrid('reload');
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
    	toValidate("editForm");
    	if (validateForm("editForm")) {
            var did = $("#ddid").val();
            var eid = $("#dutyeid").val();
            var ddatetime = $("#dutyddatetime").val();
            var drange = $("#dutydrange").val();
            var ddesc = $("#dutyddesc").val();
            //alert(did+"  "+eid +" "+ddatetime+" "+drange+" "+ddesc);
            $.get('duty/update', {
                        'duty.did': did,
                        'duty.eid': eid,
                        'duty.ddatetime': ddatetime,
                        'duty.drange': drange,
                        'duty.ddesc': ddesc
                    },
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
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个产品吗？", function (r) {
                if (r) {
                    $.post("duty/delete", {'duty.did': row.did}, function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        }
                    }, "JSON");
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的产品', 'info');
        }
        $("#list").datagrid('reload');
    }
</script>
</body>
</html>