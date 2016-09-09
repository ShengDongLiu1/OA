<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生总结</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>

<script type="text/javascript">

	function forClasses(value) {
	    return value.classname;
	}
	function forHourse(value) {
	    return value.hourname;
	}
    function studentname(value) {
        return value.intenname;
    }

    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageList: [10,15, 20, 25],
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
          	document.getElementById("sid").value = row.sid;
        	document.getElementById("semester").value = row.semester;
            $("#updatestuid").combobox({
                url: '<%=path%>/stutotal/tjls',
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#updatestuid").combobox("setValue", row.student.intenname);
            $("#updatestuid").combobox('select', row.student.intenid);
            $("#ssay").textbox('setValue', row.ssay);
            
            $("#editWin").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的总结', 'info');// messager消息控件
        }
    }
    //修改方法
    function doEdit() {
        var row = $("#list").datagrid("getSelected");
        if ($("#editForm").form("validate")) {
            $.post("stutotal/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWin").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                        	$.messager.alert("提示", data.result.msg, "info");
                        }
                    }, "json");
        }
    }

    //删除方法
    function removeCP() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个总结吗？", function (r) {
                if (r) {
                    $.post("stutotal/delete", {
                        'stutotal.sid': row.sid
                    }, function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        } else {
                            $.messager.alert("提示", data.result.msg, "info",
                                    function () {
                                        $("#list").datagrid("reload");
                                    });
                        }
                    }, "json");
                }
            });
        } else {
            $.messager.alert('提示', '请选中需要删除的总结', 'info');// messager消息控件
        }
    }
    //打开添加总结窗口
    function addPro() {
        $("#addWin").window("open");
        $("#addstuid").combobox({
            url: "<%=path%>/stutotal/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addstuid').combobox('getData');
                if (data.length > 0) {
                    $("#addstuid").combobox('select', data[0].id);
                }
            }
        });

        $('#semester2').combobox({
            panelHeight: 'auto',
        });
    }

    function doAdd() {
        if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post("stutotal/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWin").window("close");
                                $("#list").datagrid("reload");
                                $("#addForm").form("clear");
                            });
                        } else {
                        	 $.messager.alert("提示", data.result.msg, "info");
                        }
                    }, 'json')
        }
    }
    
    $(function() {
		$('#semester').combobox('disable');
	});
    
    
    function openstudent(){
		$("#student_list").datagrid("reload");
		$("#classid").combobox({
            url: "<%=path%>/rawpun/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#classid').combobox('getData');
                if (data.length > 0) {
                    $("#classid").combobox('select', data[0].id);
                }
            }
        });
		$("#studentwin1").window("open");
	}
    
    function student_xuan(){
		var row=$("#student_list").datagrid("getSelected");	//获取datagrid中选中的行
		if(row){
	         $("#addstuid").combobox("setValue", row.intenname);
	         $("#addstuid").combobox('select', row.intenid);
	         
	         $("#updatestuid").combobox("setValue", row.intenname);
	         $("#updatestuid").combobox('select', row.intenid);
			 $("#studentwin1").window("close");
		}else{
			$.messager.alert('提示','请选择学生','info');	//messager消息控件
		}
	}
    
	function queryByClassName() {
        classid=$('#classid').combobox("getValue");
        $('#student_list').datagrid('load',{  
        	classid:classid
        });
	}
	
	function queryName(){
		tiaoname = $("#tiaoname").textbox("getValue");
		$('#student_list').datagrid('load',{
			tiaoname:tiaoname
		});
	}
	
	function queryall(){
		$('#student_list').datagrid('load',{
		});
	}
</script>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options=" 
	toolbar:'#tb',
	url:'<%=path%>/stutotal/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:true">
    <thead>
    <tr>
        <th data-options="field:'sid',checkbox:true" width="100" align="center">学生总结编号</th>
        <th data-options="field:'semester'" width="100" align="center">第几学期</th>
        <th data-options="field:'student'" width="100" formatter="studentname" align="center">学生姓名</th>
        <th data-options="field:'ssay'" width="300" align="center">学生评语</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding: 5px;">
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'" onclick="addPro();">添加</a>
    <!-- 链接按钮控件 -->
    <a href="javascript:;" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'" onclick="removeCP();">移除</a> <a
        href="javascript:;" class="easyui-linkbutton"
        data-options="iconCls:'icon-edit'" onclick="edit();">修改</a>
</div>

<div id="editWin" class="easyui-window" title="修改总结"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: azimuth; height: 300px; padding: 5px;">
    <form id="editForm" enctype="multipart/form-data">
  		  <input id="sid" name="stutotal.sid" type="hidden"/>
  		  <input id="semester" name="stutotal.semester" type="hidden" />
        <table>
            <tr>
                <td>选择学生:</td>
                <td><br>
                	<div style="float: left;">
                    	<input class="easyui-combobox" data-options="required:true" id="updatestuid" name="stutotal.stuid"/><br/><br/>
             		</div>
               		<div style="float: left;">
						&nbsp;<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"   onclick="openstudent();">选择学生</a>
					</div>
                </td>
            </tr>
            <tr>
                <td><br/>学生评语:</td>
                <td><br/><input class="easyui-textbox" id="ssay" style="width: 200px; height: 100px;" name="stutotal.ssay"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="doEdit();"
               style="width:80px; height: 20px;">保存</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#editWin').dialog('close')"
               style="width:80px; height: 20px;">取消</a>
        </div>
    </form>
</div>

<!-- 添加产品框  -->
<div id="addWin" class="easyui-window" title="添加总结"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: azimuth; height: 300px; padding: 5px;">
    <form id="addForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择学生:</td>
                <td><br>
               		<div style="float: left;">
                    	<input class="easyui-combobox" data-options="required:true" id="addstuid" name="stutotal.stuid"/><br/><br/>
             		</div>
               		<div style="float: left;">
						&nbsp;<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"   onclick="openstudent();">选择学生</a>
					</div>
					<p style="clear: both;"></p>
                </td>
            </tr>
              <tr>
                <td><br/>学生评语:</td>
                <td><br/><input class="easyui-textbox" id="ssay" style="width: 200px; height: 100px;" name="stutotal.ssay"
                                data-options="multiline:true,validType:'length[10,50]'"></td>
            </tr>
            <tr height="35px;">
                <td>第几学期：</td>
                <td><select class="easyui-combobox" name="stutotal.semester" id="semester2" style="width:150px;">
                    <option value="第一学期">第一学期</option>
                    <option value="第二学期">第二学期</option>
                    <option value="第三学期">第三学期</option>
                    <option value="第四学期">第四学期</option>
                </select>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 40px 0px;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doAdd();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWin').dialog('close')"
               style="width:80px;height:20px;">取消</a>
        </div>
    </form>
</div>
	<div id="studentwin1" class="easyui-window" title="选择学生"
		data-options="iconCls:'icon-edit', closable:true, closed:true"
		style="width: 800px; height: 500px; padding: 5px;">
		<form id="xuanForm1" enctype="multipart/form-data">
			<table id="student_list" class="easyui-datagrid"
				data-options=" 
				toolbar:'#tc',
				url:'<%=path%>/stu/queryAll', 
				method:'get', 
				rownumbers:true,
				singleSelect:true,
				autoRowHeight: true,
				pagination:true,
				border:false
				">
				<thead>
					<tr>
						<th data-options="field:'intenid',checkbox:true,width:100" align="center">编号</th>
				        <th data-options="field:'intenname',width:100" align="center">名称</th>
				        <th data-options="field:'intensch',width:100" align="center">就读学校</th>
				        <th data-options="field:'intensex',width:50" align="center">性别</th>
				        <th data-options="field:'intenage',width:50" align="center">年龄</th>
				        <th data-options="field:'intentel',width:100" align="center">学生号码</th>
				        <th data-options="field:'intenaddr',width:100" align="center">家庭住址</th>
				        <th data-options="field:'classes',width:100" formatter="forClasses" align="center">所在班级</th>
				        <th data-options="field:'hourse',width:100" formatter="forHourse" align="center">所在宿舍</th>
					</tr>
				</thead>
			</table>
			<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok'" onclick="student_xuan();">确定选择</a>
		</form>
	</div>
	
	<div id="tc" style="padding: 5px;">
		<div style="float: left;">
			<input class="easyui-combobox" data-options="required:true"
				style="width: 150px;" id="classid" name="stutotal.stuid" /> <a
				href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryByClassName();">按照班级查询</a> <input
				class="easyui-textbox" style="width: 150px;" id="tiaoname" name="stutotal.stuid" />
				<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryName();">按姓名查询</a>
				<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryall();">查询全部</a>
		</div>
	</div>
<div id="mm" class="easyui-menu" style="width: 120px;">
    <div id="new" data-options="name:'new'">New</div>
    <div data-options="name:'save',iconCls:'icon-save'">Save</div>
    <div data-options="name:'print',iconCls:'icon-print'">Print</div>
    <div class="menu-sep"></div>
    <div data-options="name:'exit'">Exit</div>
</div>
</body>
</html>