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
		pageSize:20,fit:true">
    <thead>
    <tr>
        <th data-options="field:'scoid',checkbox:true,width:100" align="center">编号</th>
        <th data-options="field:'students',width:100" formatter="studentname" align="center">姓名</th>
        <th data-options="field:'sconame',width:100" align="center">课程</th>
        <th data-options="field:'score',width:100" align="center">分数</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="$('#selectClassWindow').dialog('open')"
       data-options="iconCls:'icon-add'">添加</a>
       <a href="javascript:(0);" class="easyui-linkbutton" onclick="$('#selectMultipleClassWindow').dialog('open')"
       data-options="iconCls:'icon-add'">多个多个学生成绩</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editScores();"
       data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="deleteGrade();"
       data-options="iconCls:'icon-remove'">删除</a>
       <input id="selectClass" class="easyui-combobox"  data-options="required:true,validType:'length[1,10]',novalidate:true" />
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="accordingClassName()"
       data-options="iconCls:'icon-search'">选择班级</a>
    <input class="easyui-textbox" id="studentName" size="10px"/>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="accordingStudentName();"
       data-options="iconCls:'icon-search'">按学生姓名查询</a>
	<input class="easyui-textbox" id="courseName" size="10px"/>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="accordingCourseName();"
       data-options="iconCls:'icon-search'">按考试科目查询</a>
</div>
<!-- 选择班级 -->
<div id="selectClassWindow" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="请选择班级"
     style="width:430px;height:250px;">
    <table id="selectClassTable" class="easyui-datagrid" toolbar="#selectClassToolbar" data-options="
			url:'<%=path %>/classes/queryAll', 
			method:'get', 
			rownumbers:true,
			singleSelect:true,
			autoRowHeight: true,
			pagination:true,
			border:false,
			pageSize:10,
			fit:true"
    >
        <thead>
        <tr>
            <th data-options="field:'classid',checkbox:true" width="100" align="center">班级编号</th>
            <th align="center" data-options="field:'classname'" width="150" align="center">班级名称</th>
        </tr>
        </thead>
    </table>
</div>
<div id="selectClassToolbar" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="confirmClass();"
        data-options="iconCls:'icon-ok'">确认选择</a>
</div>
<!-- 选择学生 -->
<div id="selectStudentWindow" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="请选择学生"
     style="width:430px;height:250px;">
    <table id="selectStudentTable" class="easyui-datagrid" toolbar="#selectStudentToolbar" data-options="
			url:'<%=path %>/stu/queryClassStudent', 
			method:'get',
			singleSelect:true,
			border:false"
    >
        <thead>
        <tr>
            <th data-options="field:'intenid',checkbox:true,width:100" align="center">编号</th>
            <th data-options="field:'intenname',width:100" align="center">姓名</th>
            <th data-options="field:'intensex',width:100" align="center">性别</th>
            <th data-options="field:'intenage',width:50" align="center">年龄</th>
        </tr>
        </thead>
    </table>
</div>
<div id="selectStudentToolbar" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="confirmStudent();" data-options="iconCls:'icon-ok'">确认选择</a>
</div>
<!-- 添加成绩 -->
<div id="addGradeWindow" class="easyui-window" title="保存" data-options="closed:true,iconCls:'icon-save'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="addGradeForm">
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
                        <input id="selectCourse" class="easyui-combobox" style="width:100%;height:32px"
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
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'"
                   onclick="addScores();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#addGradeWindow').dialog('close')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>
<!-- 修改成绩 -->
<div id="editGradeWindow" class="easyui-window" title="编辑" data-options="closed:true,iconCls:'icon-edit'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="editGradeForm">
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
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'"
                   onclick="affirmEditScores();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#editGradeWindow').dialog('close')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

<!-- 选择班级(选择多个学生) -->
<div id="selectMultipleClassWindow" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="请选择班级(添加多个学生)"
     style="width:430px;height:250px;">
    <table id="selectMultipleClassTable" class="easyui-datagrid" toolbar="#selectMultipleClassToolbar" data-options="
			url:'<%=path %>/classes/queryAll', 
			method:'get', 
			rownumbers:true,
			singleSelect:true,
			autoRowHeight: true,
			pagination:true,
			border:false,
			pageSize:10,
			fit:true"
    >
        <thead>
        <tr>
            <th data-options="field:'classid',checkbox:true" width="100" align="center">班级编号</th>
            <th align="center" data-options="field:'classname'" width="150" align="center">班级名称</th>
        </tr>
        </thead>
    </table>
</div>
<div id="selectMultipleClassToolbar" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="selectMultipleClass();"
        data-options="iconCls:'icon-ok'">确认选择</a>
</div>

<!-- 选择学生(选择多个学生) -->
<div id="selectMultipleStudentWindow" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="请选择学生(选择多个学生)"
     style="width:430px;height:250px;">
    <table id="selectMultipleStudentTable" class="easyui-datagrid" toolbar="#selectMultipleStudentToolbar" data-options="
			url:'<%=path %>/stu/queryClassStudent', 
			method:'get',
			border:false"
    >
        <thead>
        <tr>
            <th data-options="field:'intenid',checkbox:true,width:100" align="center">编号</th>
            <th data-options="field:'intenname',width:100" align="center">姓名</th>
            <th data-options="field:'intensex',width:100" align="center">性别</th>
            <th data-options="field:'intenage',width:50" align="center">年龄</th>
        </tr>
        </thead>
    </table>
</div>
<div id="selectMultipleStudentToolbar" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="confirmMultipleStudent();" data-options="iconCls:'icon-ok'">确认选择</a>
</div>
<script type="text/javascript">
    $(function () {
        setPagination("list");
    });

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
        
        $("#selectClass").combobox({
            url: "<%=path%>/student/queryClasses",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#selectClass').combobox('getData');
                if (data.length > 0) {
                    $("#selectClass").combobox('select', data[0].id);
                }
            }
        });
    }

    //选择班级
    function confirmClass() {
        var row = $("#selectClassTable").datagrid("getSelected");
        if (row) {
            $("#selectStudentTable").datagrid("load", "<%=path %>/stu/queryClassStudent?classid=" + row.classid);
            $('#selectClassWindow').dialog('close');
            $('#selectStudentWindow').dialog('open');
        } else {
            $.messager.alert('提示', '请选中需要添加成绩班级', 'info');
        }
    }
    
  //选择班级(多个学生)
    function selectMultipleClass() {
        var row = $("#selectMultipleClassTable").datagrid("getSelected");
        if (row) {
            $("#selectMultipleStudentTable").datagrid("load", "<%=path %>/stu/queryClassStudent?classid=" + row.classid);
            $('#selectClassWindow').dialog('close');
            $('#selectMultipleStudentWindow').dialog('open');
        } else {
            $.messager.alert('提示', '请选中需要添加成绩班级', 'info');
        }
    }

    //选择学生
    function confirmStudent() {
        var row = $("#selectStudentTable").datagrid('getSelected');
        if (row) {
            $('#selectStudentWindow').dialog('close');
            $("#addGradeForm").form("load", row);
            $('#addGradeWindow').dialog('open');
        }
        $("#selectCourse").combobox({
            url: "<%=path%>/course/queryCourse",
            method: 'get',
            valueField: 'name',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#selectCourse').combobox('getData');
                if (data.length > 0) {
                    $("#selectCourse").combobox('select', data[0].name);
                }
            }
        });
    }
    
  //选择学生(选择多个学生)
    function confirmMultipleStudent() {
    	var intenid = [];
        var intenname = [];
        var rows = $("#selectMultipleStudentTable").datagrid("getSelections");
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

    //添加成绩
    function addScores() {
        var stuid = $("#stuid").val();
        var score = $("#score").val();
        var sconame = $('#selectCourse').combobox('getValue');
        $.get('<%=path%>/student/add', {
                    'grade.students.intenid': stuid,
                    'grade.score': score,
                    'grade.sconame': sconame
                },
                function (data) {
                    $.messager.alert("提示", data.result.msg, "info");
                    $("#list").datagrid('reload');
                }, "JSON");
        $("#list").datagrid('reload');
        $('#addGradeWindow').dialog('close');
        $("#addGradeForm").form("clear");
        $("#list").datagrid('reload');
    }

    //修改成绩加载数据
    function editScores() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $("#aa").textbox("setValue", row.students.intenname);
            $("#ec").textbox('setValue', row.score);
            document.getElementById("ssid").value = row.scoid;
            $("#editGradeWindow").dialog('open');
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
    }

    //修改成绩
    function affirmEditScores() {
        var scoid = $("#ssid").val();
        var score = $("#ec").val();
        var sconame = $('#en').combobox('getValue');
        $.post('student/update', {'grade.scoid': scoid, 'grade.score': score, 'grade.sconame': sconame},
                function (data) {
                    if (data.result.result == "success") {
                        $.messager.alert("提示", data.result.msg, "info", function () {
                            $("#editGradeWindow").window('close');
                            $("#list").datagrid('reload');
                        });
                    } else {
                        $.messager.alert("提示", data.result.msg, "info");
                    }
                }, "JSON");
    }

    //删除成绩
    function deleteGrade() {
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
    }

    function studentname(value) {
        return value.intenname;
    }
    
  //按班级查询
    function accordingClassName() {
        var selectClass = $("#selectClass").combobox('getValue');
        if(selectClass == ""){
        	$.messager.alert('提示', '请选择要查询的班级', 'info');
        	return false;
        }
        $('#list').datagrid('load',{
        	selectClass:selectClass
        });
    }
    
    //按学生姓名查询
    function accordingStudentName() {
        var studentName = $("#studentName").val();
        if(studentName == ""){
        	$.messager.alert('提示', '请输入要查询的姓名', 'info');
        	return false;
        }
        $('#list').datagrid('load',{
            studentName:studentName
        });
    }
    
    //按考试科目查询
    function accordingCourseName() {
    	var courseName = $("#courseName").val();
    	if(courseName == ""){
        	$.messager.alert('提示', '请输入要查询的科目', 'info');
        	return false;
        }
        $('#list').datagrid('load',{
        	courseName:courseName
        });
	}
    
</script>
</body>
</html>