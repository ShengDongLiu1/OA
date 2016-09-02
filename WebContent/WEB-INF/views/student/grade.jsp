<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>成绩管理</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/student/queryAll', 
		method:'get',
		rownumbers: true,
		singleSelect: true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:20">
    <thead>
    <tr>
        <th data-options="field:'scoid',checkbox:true,width:100">编号</th>
        <th data-options="field:'students',width:100" formatter="studentname">姓名</th>
        <th data-options="field:'sconame',width:100">课程</th>
        <th data-options="field:'score',width:100">分数</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="$('#AddWin').dialog('open')" data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="$('#selectMulti').dialog('open')" data-options="iconCls:'icon-add'">添加多个</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editWin();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();" data-options="iconCls:'icon-remove'">删除</a>
</div>
<!-------------------------------- 选择单个学生成绩 -------------------------------->
<div id="AddWin" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="添加学生成绩">
    <table id="addlist" class="easyui-datagrid" toolbar="#addss" data-options="
			url:'<%=path %>/stu/queryAll', 
			method:'get', 
			rownumbers:true,
			singleSelect:true,
			autoRowHeight: true,
			pagination:true,
			border:false,
			pageSize:20"
           style="width:275px;height:240px;padding:10px"
    >
        <thead>
        <tr>
            <th data-options="field:'intenid',checkbox:true,width:100">编号</th>
            <th data-options="field:'intenname',width:100">姓名</th>
            <th data-options="field:'intensex',width:100">性别</th>
        </tr>
        </thead>
    </table>
</div>
<div id="addss" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addWin();" data-options="iconCls:'icon-add'">确认选择</a>
</div>
<!-------------------------------- 选择多个学生 -------------------------------->
<div id="selectMulti" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="选择多个学生">
	<table id="dg" class="easyui-datagrid" toolbar="#ass" data-options="
			url:'<%=path %>/stu/queryAllStu', 
			method:'get', 
			border:false"
           style="width:250px;height:240px;padding:10px"
    >
        <thead>
        <tr>
            <th data-options="field:'student.intenid',checkbox:true,width:100">编号</th>
            <th data-options="field:'intenname',width:100">姓名</th>
            <th data-options="field:'intensex',width:100">性别</th>
        </tr>
        </thead>
    </table>
</div>
<div id="ass" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addPl();" data-options="iconCls:'icon-ok'">确认选择</a>
</div>
<!-------------------------------- 单个学生成绩添加 -------------------------------->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="保存" data-options="closed:true,iconCls:'icon-save'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="addfrom">
            <table>
                <tr>
                    <td><span style="width:100%;height:32px">编&nbsp;号&nbsp;</span></td>
                    <td>
                        <input name="intenid" id="stuid" class="easyui-textbox" style="width:100%;height:32px">
                    </td>
                </tr>
                <tr>
                    <td><span style="width:100%;height:32px">姓&nbsp;名&nbsp;</span></td>
                    <td>
                        <input name="intenname" class="easyui-textbox" style="width:100%;height:32px">
                    </td>
                </tr>
                <tr>
                    <td><span style="width:100%;height:32px">科&nbsp;目&nbsp;</span></td>
                    <td>
                        <input id="xiala" class="easyui-combobox" style="width:100%;height:32px"
                               data-options="required:true,validType:'length[1,10]',novalidate:true" name="sconame"/>
                    </td>
                </tr>
                <tr>
                    <td><span style="width:100%;height:32px">分&nbsp;数&nbsp;</span></td>
                    <td>
                        <input name="grade.score" id="score" class="easyui-textbox" style="width:100%;height:32px">
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="add();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#addWindow').dialog('close')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>
<!-------------------------------- 修改学生成绩 -------------------------------->
<div style="margin:20px 0;"></div>
<div id="editWindow" class="easyui-window" title="编辑" data-options="closed:true,iconCls:'icon-edit'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="editfrom">
            <table>
                <tr>
                    <td><span style="width:100%;height:32px">姓&nbsp;名&nbsp;</span></td>
                    <td>
                        <input name="intenname" class="easyui-textbox" id="aa" style="width:100%;height:32px" readonly/>
                    </td>
                </tr>
                <tr>
                    <td><span style="width:100%;height:32px">科&nbsp;目&nbsp;</span></td>
                    <td>
                        <input name="scoid" id="ssid" type="hidden"/>
                        <input id="en" class="easyui-combobox" style="width:100%;height:32px"
                               data-options="required:true,validType:'length[1,10]',novalidate:true" name="sconame"/>
                    </td>
                </tr>
                <tr>
                    <td><span style="width:100%;height:32px">分&nbsp;数&nbsp;</span></td>
                    <td>
                        <input name="score" id="ec" class="easyui-textbox" style="width:100%;height:32px">
                    </td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="Edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#editWindow').dialog('close')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

<!--/////////////////////////////////////////////////////////////////////////////////-->
<script type="text/javascript">
    $(function () {
        setPagination("list");
    });
    
    function addPl() {
        var intenid = [];
        var intenname = [];
        var rows = $("#dg").datagrid("getSelections");
        if (rows == null || rows == "") {
            $.messager.alert('提示', '请至少选中一个需要添加学生成绩的学生!', 'info');// messager消息控件
        } else {
            for (var i = 0; i < rows.length; i++) {
            	intenid[i] = rows[i].intenid;
            	intenname[i] = rows[i].intenname;
            }
            window.location.href = "<%=path%>/student/plSelect?intenid=" + intenid + "&intenname=" + intenname;
        }
    }

    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager");
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
    
    function subject() {
        var subject = $("#subject").val();
        $.post('student/batch', {'subject': subject}, "JSON");
        $('#adds').dialog('close');
    }

    function addWin() {
        var row = $("#addlist").datagrid('getSelected');
        if (row) {
            $("#addfrom").form("load", row);
            $('#AddWin').dialog('close');
            $('#addWindow').dialog('open');
        }
        $("#xiala").combobox({
            url: "<%=path%>/course/queryCourse",
            method: 'get',
            valueField: 'name',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#xiala').combobox('getData');
                if (data.length > 0) {
                    $("#xiala").combobox('select', data[0].name);
                }
            }
        });
    }

    function add() {
        var stuid = $("#stuid").val();
        var score = $("#score").val();
        var sconame = $('#xiala').combobox('getValue');
        $.get('student/add', {'grade.students.intenid': stuid, 'grade.score': score, 'grade.sconame': sconame},
                function (data) {
                    $.messager.alert("提示", data.result.msg, "info");
                    $("#list").datagrid('reload');
                }, "JSON");
        $("#list").datagrid('reload');
        $('#addWindow').dialog('close');
        $("#addfrom").form("clear");
        $("#list").datagrid('reload');
    }


    function editWin() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            /* $("#editfrom").form("load", row); */
            $("#aa").textbox("setValue", row.students.intenname);
            $("#ec").textbox('setValue', row.score);
            document.getElementById("ssid").value = row.scoid;
            $("#editWindow").dialog('open');
            $("#en").combobox({
                url: "<%=path%>/course/queryCourse",
                method: 'get',
                valueField: 'name',
                textField: 'name',
                panelHeight: 'auto',
                onLoadSuccess: function () { //数据加载完毕事件
                    var data = $('#en').combobox('getData');
                    if (data.length > 0) {
                        $("#en").combobox('select', row.sconame);
                    }
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要编辑的成绩', 'info');
        }
        $("#list").datagrid('reload');
    }

    function Edit() {
        var scoid = $("#ssid").val();
        var score = $("#ec").val();
        var sconame = $('#en').combobox('getValue');
        $.post('student/update', {'grade.scoid': scoid, 'grade.score': score, 'grade.sconame': sconame},
                function (data) {
                    if (data.result.result == "success") {
                        $.messager.alert("提示", data.result.msg, "info");
                        $("#list").datagrid('reload');
                        $("#editWindow").dialog('close');
                        $("#list").datagrid('reload');
                    } else {
                        $.messager.alert("提示", data.result.msg, "info");
                    }
                }, "JSON");
    }

    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.post('student/delete', {'grade.scoid': row.scoid},
                    function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info");
                            $("#list").datagrid('reload');
                        } else {
                            $.messager.alert("提示", data.result.msg, "info");
                        }
                    }, "JSON");
        } else {
            $.messager.alert('提示', '请选中需要删除的列', 'info');
        }
        $("#list").datagrid('reload');
    }

    function batchAdd() {
        var ids = [];
        var rows = $('#batchList').datagrid('getSelections');
        if (rows) {
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].intenid + rows[i].intenname);
            }
            $('#batchAdd').dialog('close');
            $('#addsWindow').dialog('open');
        } else {
            $.messager.alert('提示', '请选中需要添加的列', 'info');
        }
    }

    function studentname(value) {
        return value.intenname;
    }
</script>
</body>
</html>