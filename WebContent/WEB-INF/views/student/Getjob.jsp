<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>就业管理</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb"
       data-options="
		url:'<%=path %>/getjob/queryAll', 
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
        <th data-options="field:'jobid',checkbox:true,width:100">就业编号</th>
        <th data-options="field:'jobname',width:100">公司名称</th>
        <th data-options="field:'student',width:100" formatter="forStudentName">学生编码</th>
        <th data-options="field:'jobdesc',width:100">职位描述</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:(0);" class="easyui-linkbutton"
       onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a> <a
        href="javascript:(0);" class="easyui-linkbutton"
        onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a> <a
        href="javascript:(0);" class="easyui-linkbutton"
        onclick="expurgate();" data-options="iconCls:'icon-remove'">删除</a>
</div>
<!-- 添加窗口 -->
<div style="margin: 20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加"
     data-options="closed:true,iconCls:'icon-add'" style="padding: 10px;">
    <div style="padding: 10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>公司名称:</td>
               		<td><input class="easyui-textbox"  name="getjob.jobname" style="width: 150px;"
                           data-options="required:true,validType:'length[2,20]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>选择学生:</td>
                    <td><input class="easyui-combobox" id="jobstu" name="getjob.student.intenid"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>职位描述:</td>
                    <td><input class="easyui-textbox" name="getjob.jobdesc"
                           data-options="required:true,validType:'length[5,20]',novalidate:true, multiline:true" style="width: 150px;height: 55px;" name="dep.eaddr"
                          /></td>
                </tr>
            </table>
            <div data-options="region:'south',border:false"
                 style="text-align: right; padding: 5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton"
                   data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width: 80px">添加</a> <a href="javascript:(0);"
                                                 class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                                                 onclick="closeAdd();" style="width: 80px">取消</a>
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
          <input type="hidden" id="ji" name="getjob.jobid"/>
            <table>
                <tr>
                    <td>公司名称</td>
                    <td>
                       <input class="easyui-textbox" id="jn" name="getjob.jobname" style="width: 150px;"
                           data-options="required:true,validType:'length[2,20]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>学生编码</td>
                    <td><input class="easyui-combobox" id="js" name="getjob.student.intenid"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>职位描述</td>
					<td><input class="easyui-textbox" id="jd" name="getjob.jobdesc" 
   								data-options="required:true,validType:'length[5,20]',novalidate:true, multiline:true" style="width: 150px;height: 55px;" name="dep.eaddr"  /></td>      
   		      </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="closeEdit()" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function forStudentName(value) {
        return value.intenname;
    }
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
        $("#jobstu").combobox({
            url: "<%=path%>/getjob/xzxs",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#jobstu').combobox('getData');
                if (data.length > 0) {
                    $("#jobstu").combobox('select', data[0].id);
                }
            }
        });
        $("#addWindow").window("open");
    }
    // 添加(提交後臺)
    function add() {
    	toValidate("ff");
    	if (validateForm("ff")){
         // 验证整个表单里的所有validatabox是否通过验证
            $.post("getjob/add", $("#ff").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
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
                  }, 'json');
        }
    }

    function closeAdd() {
        $("#ff").form("clear");
        $("#addWindow").window("close");
    }

    function closeEdit() {
        $("#editForm").form("clear");
        $("#editWindow").window("close");
    }
    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
        	 document.getElementById("ji").value = row.jobid;
            $("#jn").textbox("setValue", row.jobname);
            $("#js").combobox({
                url: "<%=path%>/getjob/xzxs",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#js").combobox("setValue", row.student.intenname);
            $("#js").combobox('select', row.student.intenid);
            $("#jd").textbox("setValue", row.jobdesc);

            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
    	toValidate("editForm");
    	if (validateForm("editForm")){
            $.post('getjob/update', $("#editForm").serialize(),
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

    function expurgate() {
		var row = $("#list").datagrid("getSelected");
		if (row) {
			$.messager.confirm("提示", "确认要删除这条记录吗？", function(r) {
				if (r) {
					$.post("getjob/delete", {
						'getjob.jobid': row.jobid
					}, function(data) {
						if (data.result.result == "success") {
							$.messager.alert("提示", data.result.msg, "info",
									function() {
										$("#list").datagrid("reload");
									});
						}else{
							$.messager.alert("提示", "删除成功", "info");
						}
					},"json");
				}
			});
		} else {
			$.messager.alert('提示', '请选中需要删除的申领记录！', 'info');// messager消息控件
		}
	}
	
</script>
</body>
</html>