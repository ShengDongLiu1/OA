<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工家庭联系人</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>

<script type="text/javascript">
    function depnames(value) {
        return value.ename;
    }

    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageSize: 3,
            pageList: [3, 5, 10, 15],
            beforePageText: "第",
            afterPageText: "页    共{pages}页",
            displayMsg: "当前显示{from} - {to} 条记录    共{total}条记录",
            onBeforeRefresh: function () {
                $(this).pagination("loading");
                $(this).pagination("loaded");
            }
        });
    }

    $(function () {
        $("#new").click(function () {
            $.messager.alert("提示", "新建菜单", "info");
        });

        $("#list").datagrid({
            onRowContextMenu: function (e, rowindex, rowData) {//datagrid中的每一行都绑定右键菜单
                e.preventDefault();
                $("#mm").menu("show", {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        });
        setPagination("list");

    });


    function edit() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $("#updatedep").combobox({
                url: '<%=path%>/family/tjls',
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                value: row.did,
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#updatedep').combobox('getData');
                    if (data.length > 0) {
                        $("#updatedep").combobox('select', data[0].id);
                    }
                }
            });
            $("#fid").textbox("setValue", row.fid);
            $("#eid").textbox("setValue", row.eid);
            $("#fname").textbox('setValue', row.fname);
            $("#fjob").textbox("setValue", row.fjob);
            $("#frelation").textbox("setValue", row.frelation);
            $("#ftel").textbox("setValue", row.ftel);
            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的联系人', 'info');// messager消息控件
        }
    }

    function doEdit() {
        var row = $("#list").datagrid("getSelected");
        toValidate("editForm");
        if (validateForm("editForm")) {
            $.post("family/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWin").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "json");
        }
    }

    //删除方法
    function removeCP() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个联系人吗？", function (r) {
                if (r) {
                    $.post("family/delete", {
                        'fid': row.fid
                    }, function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        }
                    }, "json");
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的联系人', 'info');// messager消息控件
        }
    }
    //打开添加联系人窗口
    function addPro() {
        $("#addWin").window("open");

        $("#adddep").combobox({
            url: '<%=path%>/family/tjls',
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#adddep').combobox('getData');
                if (data.length > 0) {
                    $("#adddep").combobox('select', data[0].id);
                }
            }
        });
    }

    function doAdd() {
    	toValidate("addForm");
    	if (validateForm("addForm")) {
            $.post("family/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWin").window("close");
                                $("#list").datagrid("reload");
                                $("#").form("clear");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg, "info");
                        }
                    }, 'json')
        }
    }
</script>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options=" 
	toolbar:'#tb',
	url:'<%=path%>/family/queryAll', 
		method:'post', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'fid',checkbox:true" width="100">编号</th>
        <th data-options="field:'dep'" width="100" formatter="depnames">员工姓名</th>
        <th data-options="field:'fname'" width="100">家庭联系人姓名</th>
        <th data-options="field:'fjob'" width="100">家庭联系人职位</th>
        <th data-options="field:'frelation'" width="100">与本人关系</th>
        <th data-options="field:'ftel'" width="100">联系电话</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding: 5px;">
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'" onclick="addPro();">添加</a>
    <!-- 链接按钮控件 -->
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'" onclick="removeCP();">移除</a>
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'" onclick="edit();">修改</a>
    <a href="<%=path %>/dep/all" class="easyui-linkbutton"
       data-options="iconCls:'icon-back'">返回员工列表</a>
</div>

<div id="editWin" class="easyui-window" title="修改联系人 "
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 270px; height: 300px; padding: 5px;">
    <form id="editForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择员工:</td>
                <td><br/>
                    <input id="updatedep" class="easyui-combobox" data-options="required:true"
                           name="family.eid"/><br/><br/>
                </td>
            </tr>
            <tr height="35px;">
                <td>姓名:</td>
                <td>&nbsp;<input id="fname"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.fname" data-options="required:true"/>
                </td>
            </tr>

            <tr height="35px;">
                <td>职位:</td>
                <td>&nbsp;<input id="fjob"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.fjob" data-options="required:true"/>
                </td>
            </tr>

            <tr height="35px;">
                <td>与本人关系:</td>
                <td>&nbsp;<input id="frelation"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.frelation" data-options="required:true"/>
                </td>
            </tr>

            <tr height="35px;">
                <td>联系电话:</td>
                <td>&nbsp;<input id="ftel"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.ftel" data-options="required:true"/>
                </td>
            </tr>
            <tr style="border: 0px;">
                <td style="border: 0px;"><input id="fid"
                                                class="easyui-validatebox easyui-textbox"
                                                name="family.fid" data-options="required:true" type="hidden"/>
                </td>
            </tr>
        </table>
        <div></div>
        <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="doEdit();"
               style="width:80px; height: 20px;">保存</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick=""
               style="width:80px; height: 20px;">取消</a>
        </div>
    </form>
</div>

<!-- 添加联系人框  -->
<div id="addWin" class="easyui-window" title="添加联系人"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width:270px; height:300px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择员工:</td>
                <td><br/>
                    <input id="adddep" class="easyui-combobox" data-options="required:true"
                           name="family.eid"/><br/><br/>
                </td>
            </tr>
            <tr height="35px;">
                <td>姓名:</td>
                <td>&nbsp;<input id="fname"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.fname" data-options="required:true"/>
                </td>
            </tr>

            <tr height="35px;">
                <td>职位:</td>
                <td>&nbsp;<input id="fjob"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.fjob" data-options="required:true"/>
                </td>
            </tr>

            <tr height="35px;">
                <td>与本人关系:</td>
                <td>&nbsp;<input id="frelation"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.frelation" data-options="required:true"/>
                </td>
            </tr>

            <tr height="35px;">
                <td>联系电话:</td>
                <td>&nbsp;<input id="ftel"
                                 class="easyui-validatebox easyui-textbox"
                                 name="family.ftel" data-options="required:true"/>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 0 0;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick=""
               style="width:80px;height:20px;">取消</a>
        </div>
    </form>
</div>
</body>
</html>