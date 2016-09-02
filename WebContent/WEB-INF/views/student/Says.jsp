<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="/Automation/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
	
	<script type="text/javascript">
    $(function () {
        setPagination("list");
    });
    function depnames(value){
    	return value.ename;
    }
    function studentname(value){
    	return value.intenname;
    }
    
    // 显示数据
    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageList: [10, 15, 20, 25],
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
        $("#addsay").combobox({
            url: "<%=path%>/says/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addsay').combobox('getData');
                if (data.length > 0) {
                    $("#addsay").combobox('select', data[0].id);
                }
            }
        });
        
        $("#addsayemp").combobox({
            url: "<%=path%>/says/tjls2",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addsayemp').combobox('getData');
                if (data.length > 0) {
                    $("#addsayemp").combobox('select', data[0].id);
                }
            }
        });
    }
    // 添加(提交後臺)
    function add() {
    	toValidate("ff");
    	if (validateForm("ff")){// 验证整个表单里的所有validatabox是否通过验证
            $.post("says/add", $("#ff").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWindow").window("close");
                                $("#list").datagrid("reload");
                                $("#ff").form("clear");
                            });
                        } else {
                        	 $.messager.alert("提示", data.result.msg, "info");
                        }
                    }, 'json')
        }
    }

    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
            $("#editWindow").window("open");
          	document.getElementById("ssayid").value = row.sayid;
            $("#updatessayface").combobox({
                url: "<%=path%>/says/tjls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#updatessayface").combobox("setValue", row.students.intenname);
            $("#updatessayface").combobox('select', row.students.intenid);
            $("#updatesayemp").combobox({
                url: "<%=path%>/says/tjls2",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#updatesayemp").combobox("setValue", row.deps.ename);
            $("#updatesayemp").combobox('select', row.deps.eid);
            $("#ssayscon2").textbox("setValue", row.sayscon);
            $("#ssayspro2").textbox("setValue", row.sayspro);
            $("#ssysback2").textbox("setValue", row.sysback);
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
        
    }
    // 编辑提交
    function edit() {
    	 var row = $("#list").datagrid("getSelected");
    		toValidate("editForm");
        	if (validateForm("editForm")){
             $.post("says/update", $("#editForm").serialize(),
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
    }
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个谈心记录吗？", function (r) {
                if (r) {
                    $.post("says/delete", {'says.sayid': row.sayid}, function (data) {
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
            $.messager.alert('提示', '请选中需要删除的谈心记录', 'info');
        }
    }
    // 关闭窗口
    function close(c) {
        $("#" + c).window("close");
    }
</script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid"
       data-options=" 
		toolbar:'#tb',
		url:'<%=path%>/says/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:true">
    <thead>
    <tr>
        <th data-options="field:'sayid',checkbox:true" width="100" align="center">谈心编号</th>
        <th data-options="field:'students'" width="100" formatter="studentname" align="center">谈心对象</th>
        <th data-options="field:'deps'" width="100" formatter="depnames" align="center">策划人</th>
        <th data-options="field:'sayscon'" width="100" align="center">谈心内容</th>
      	 <th data-options="field:'sayspro',width:100" align="center">谈心问题</th>
        <th data-options="field:'sysback',width:100" align="center">学生反馈</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();"
       data-options="iconCls:'icon-remove'">删除</a>
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table>
	             <tr>
	                <td>谈心对象:</td>
	                <td><br>
	                    <input class="easyui-combobox" data-options="required:true" id="addsay" name="says.sayface"/><br/><br/>
	                </td>
	            </tr>
                <tr>
	                <td>策划人:</td>
	                <td><br>
	                    <input class="easyui-combobox" data-options="required:true" id="addsayemp" name="says.sayempid"/><br/><br/>
	                </td>
	            </tr>
            
        	   <tr>
	                <td>谈心内容:</td>
	                <td><input class="easyui-textbox" id="ssayscon" style="width: 200px; height: 100px;" name="says.sayscon"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
                <tr>
	                <td>谈心问题:</td>
	                <td><input class="easyui-textbox" id="ssayspro" style="width: 200px; height: 100px;" name="says.sayspro"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
                <tr>
                  <tr>
	                <td>学生反馈:</td>
	                <td><input class="easyui-textbox" id="ssysback" style="width: 200px; height: 100px;" name="says.sysback"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
                <tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#addWindow').dialog('close')" style="width:80px">取消</a>
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
          <input name="says.sayid" id="ssayid" type="hidden"/>
            <table>
                <tr>
	                <td>谈心对象:</td>
	                <td><br>
	                    <input class="easyui-combobox" id="updatessayface" data-options="required:true" name="says.sayface"/><br/><br/>
	                </td>
	            </tr>
             	<tr>
	                <td>策划人:</td>
	                <td><br>
	                    <input class="easyui-combobox" data-options="required:true" id="updatesayemp" name="says.sayempid"/><br/><br/>
	                </td>
	            </tr>
              
                <tr>
                <td>谈心内容:</td>
                <td><input class="easyui-textbox" id="ssayscon2" style="width: 200px; height: 100px;" name="says.sayscon"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
                <tr>
	                <td>谈心问题:</td>
	                <td><input class="easyui-textbox" id="ssayspro2" style="width: 200px; height: 100px;" name="says.sayspro"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
                <tr>
                  <tr>
	                <td>学生反馈:</td>
	                <td><input class="easyui-textbox" id="ssysback2" style="width: 200px; height: 100px;" name="says.sysback"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
                <tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="$('#editWindow').dialog('close')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>


</body>
</html>