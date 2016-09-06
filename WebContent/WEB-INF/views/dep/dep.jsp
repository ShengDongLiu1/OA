<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工管理</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>

<script type="text/javascript">

    function depardname(value) {
        return value.dname;
    }

    function statuname(value) {
        return value.dsname;
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
        setPagination("list");

    });

    function edit() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $("#eid").textbox("setValue", row.eid);
            $("#ename").textbox('setValue', row.ename);
            $("#mid").textbox('setValue', row.mid);
            $("#ebirth").textbox("setValue", row.ebirth);
            $("#enumber").textbox("setValue", row.enumber);
            $("#ecertid").textbox('setValue', row.ecertid);
            $("#ecity").textbox("setValue", row.ecity);
            $("#eanton").textbox('setValue', row.eanton);
            $("#edu").textbox("setValue", row.edu);
            $("#eaddr").textbox('setValue', row.eaddr);
            $("#estatus").textbox("setValue", row.dstatuss.dsname);
            $("#depar1").combobox({
                url: '<%=path%>/dep/tjls',
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#depar1").combobox("setValue", row.departments.dname);
            $("#depar1").combobox('select', row.departments.did);
            $("#updateestatus").combobox({
                url: '<%=path%>/dep/tjls2',
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#updateestatus").combobox("setValue", row.dstatuss.dsname);
            $("#updateestatus").combobox('select', row.dstatuss.dsid);
            /* 			$('#depar1').combobox('setValue',row.departments.dname);//让他默认选中当前要修改的员工部门
             */
            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的与员工', 'info');// messager消息控件
        }
    }
    function closeedit() {
        $("#editWin").window("close");
    }
    function doEdit() {
        var row = $("#list").datagrid("getSelected");
        toValidate("editForm");
        if (validateForm("editForm")) {
            $.post("dep/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
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
            $.messager.confirm("提示", "确认要删除这个员工吗？", function (r) {
                if (r) {
                    $.post("dep/delete", {
                        'dep.eid': row.eid
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
            $.messager.alert('提示', '请选中需要删除的员工', 'info');// messager消息控件
        }
    }
    //打开添加部门窗口
    function addPro() {
        var row = $("#list").datagrid("getSelected");
        if(row){
            $("#addWin").window("open");
            $("#adddepar").combobox({
                url: "<%=path%>/dep/tjls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#adddepar').combobox('getData');
                    if (data.length > 0) {
                        $("#adddepar").combobox('select', data[0].id);
                    }
                }
            });
            $("#addestatus").combobox({
                url: "<%=path%>/dep/tjls2",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#addestatus').combobox('getData');
                    if (data.length > 0) {
                        $("#addestatus").combobox('select', data[0].id);
                    }
                }
            });
            document.getElementById("eid").value = row.eid;
	    } else {
		        $.messager.alert('提示', '请选中需要招收的员工', 'info');// messager消息控件
	    }
    }

    function closes() {
        $("#addWin").window("close");
    }
    function doAdd() {
        if (validateForm("addForm")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post("dep/addn", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWin").window("close");
                                $("#list").datagrid("reload");
                                $("#").form("clear");
                            });
                        } else {
                            $.messger.alert("提示", data.msg, "info");
                        }
                    }, 'json')
        }
    }
    function queryById() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            window.location.href = "<%=path%>/family/byid?eid=" + row.eid;
        } else {
            $.messager.alert('提示', '请选中需要查看的员工', 'info');// messager消息控件
        }

    }

    function queryById1() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            window.location.href = "<%=path%>/jobs/query?jobs.eid=" + row.eid;
        } else {
            $.messager.alert('提示', '请选中需要查看的员工', 'info');// messager消息控件
        }
    }

</script>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options=" 
		toolbar:'#tb',
		url:'<%=path%>/dep/queryAlln', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		fit:true
		">
    <thead>
    <tr>
        <th data-options="field:'eid',checkbox:true" align="center">员工编号</th>
        <th data-options="field:'ename',width:100" align="center">员工姓名</th>
        <th data-options="field:'esex',width:100" align="center">员工性别</th>
        <th data-options="field:'ebirth',width:100" align="center">员工生日</th>
        <th data-options="field:'enumber',width:100" align="center">员工号码</th>
        <th data-options="field:'ecertid',width:100" align="center">身份证号</th>
        <th data-options="field:'ecity',width:100" align="center">员工籍贯</th>
        <th data-options="field:'eanton',width:100" align="center">民族</th>
        <th data-options="field:'edu',width:100" align="center">学历</th>
        <th data-options="field:'eaddr',width:100" align="center">家庭住址</th>
        <th data-options="field:'etry',width:100" align="center">招聘时间</th>
        <th data-options="field:'basepay',width:100" align="center">基本工资</th>
    </tr>

    </thead>
</table>


<div id="tb" style="padding: 5px;">
    <div style="float: left;">
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-add'" onclick="addPro();">招收</a>
        <!-- 链接按钮控件 -->
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-remove'" onclick="removeCP();">移除</a>
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-search'" onclick="queryById1();">查看该员工工作经历</a>
    </div>
    <p style="clear: both;"></p>
</div>


<div id="addWin" class="easyui-window" title="添加员工"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 300px; height: 300px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
    	<input type="hidden" name="dep.eid" id="eid" />
        <table>
            <tr>
                <td>部门:</td>
                <td><br/>
                    <input class="easyui-combobox" data-options="required:true" id="adddepar" name="dep.mid"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>职位:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true" id="addestatus"
                           name="dep.dstatuss.dsid"/><br/><br/>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:30px 30px 0;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closes();"
               style="width:80px;height:20px;">取消</a>
        </div>
    </form>
</div>
</body>
</html>