<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <title>收费管理</title>
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
		url:'<%=path %>/money/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:20,
		fit:true">
    <thead>
    <tr>
        <th data-options="field:'mid',checkbox:true,width:100" align="center">编号</th>
        <th data-options="field:'student',width:100" formatter="forStudent" align="center">学生名称</th>
        <th data-options="field:'dep',width:100" formatter="forDep" align="center">收取人</th>
        <th data-options="field:'semester',width:100" align="center">学期</th>
        <th data-options="field:'ys',width:100" align="center">应交费用</th>
        <th data-options="field:'actual',width:100" align="center">实交费用</th>
        <th data-options="field:'owe',width:100" align="center">还欠费用</th>
        <th data-options="field:'mtime',width:100" align="center">收取时间</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="addOpen();">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();"
       data-options="iconCls:'icon-remove'">删除</a>
</div>
<div style="margin:20px 0;"></div>
<div id="studentwin1" class="easyui-window" title="选择学生"
	data-options="iconCls:'icon-edit', closable:true, closed:true"
	style="width: 800px; height: 500px; padding: 5px;">
	<form id="xuanForm1"  enctype="multipart/form-data">
		<table id="student_list" toolbar="#tc" class="easyui-datagrid"
			data-options=" 
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
		style="width: 150px;" id="classid" name="rawpun.jstuid" /> <a
		href="javascript:;" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'" onclick="queryByClassName();">按照班级查询</a> <input
		class="easyui-textbox" style="width: 150px;" id="tiaoname" name="rawpun.jstuid" />
		<a href="javascript:;" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'" onclick="queryName();">按姓名查询</a>
		<a href="javascript:;" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'" onclick="queryall();">查询全部</a>
	</div>
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
        	<input type="hidden" id="eid" name="money.dep.eid" value="${sessionScope.user.dep.getEid()}" />
        	<input type="hidden" id="owe" name="money.owe" />
			<table>
			 <tr>
			    <td>学生姓名:</td>
			    <td>
                	<div style="float: left;">
                    	<input class="easyui-combobox" data-options="required:true,novalidate:true" id="stuid" name="money.student.intenid"/><br/><br/>
             		</div>
               		<div style="float: left;">
						&nbsp;<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width: 80px; height: 20px;"  onclick="openstudent();">选择学生</a>
					</div>
					<p style="clear: both;"></p>
				</td>
			</tr>
			    <tr>
			    <td>学期:</td>
			    <td>
			        <input class="easyui-combobox" id="semester" name="money.semester" data-options="required:true,novalidate:true"/><br/><br/>
			    </td>
			</tr>
			<tr>
			    <td>应交费用:</td>
			    <td><input class="easyui-textbox" id="ys" name="money.ys" data-options="required:true,novalidate:true,readonly:true"/><br/><br/></td>
			</tr>
			<tr>
			    <td>实交费用:</td>
			    <td><input class="easyui-textbox" id="actual" name="money.actual" data-options="required:true,novalidate:true"/><br/><br/></td>
			</tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="Winclose('addWindow')" style="width:80px">取消</a>
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
  			<input type="hidden" id="depid" name="money.dep.eid"/>
  			<input type="hidden" id="mid" name="money.mid" />
        	<input type="hidden" id="ow" name="money.owe" />
			<table>
			 <tr>
			    <td>学生姓名:</td>
			    <td>
                	<div style="float: left;">
                    	<input class="easyui-combobox" data-options="required:true,novalidate:true" id="intid" name="money.student.intenid"/><br/><br/>
             		</div>
               		<div style="float: left;">
						&nbsp;<a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width: 80px; height: 20px;"  onclick="openstudent();">选择学生</a>
					</div>
					<p style="clear: both;"></p>
				</td>
			</tr>
			    <tr>
			    <td>学期:</td>
			    <td>
			        <input class="easyui-combobox" id="xq" name="money.semester" data-options="required:true,novalidate:true"/><br/><br/>
			    </td>
			</tr>
			<tr>
			    <td>应交费用:</td>
			    <td><input class="easyui-textbox" id="yj" name="money.ys" data-options="required:true,novalidate:true"/><br/><br/></td>
			</tr>
			<tr>
			    <td>实交费用:</td>
			    <td><input class="easyui-textbox" id="sj" name="money.actual" data-options="required:true,novalidate:true"/><br/><br/></td>
			</tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="edit();"
                   style="width:80px">保存</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="Winclose('editWindow')" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">

	function forStudent(value){
		return value.intenname;
	}
	function forDep(value){
		return value.ename;
	}
    function forClasses(value) {
        return value.classname;
    }
    function forHourse(value) {
        return value.hourname;
    }
    $(function () {
        setPagination("list");
    });
    // 显示数据
    function setPagination(tableId) {
        var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
        $(p).pagination({
            pageList: [20, 30, 40],
            beforePageText: "第",
            afterPageText: "页    共{pages}页",
            displayMsg: "当前显示{from} - {to} 条记录    共{total}条记录",
            onBeforeRefresh: function () {
                $(this).pagination("loading");
                $(this).pagination("loaded");
            }
        });
    }
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
    
    function student_xuan(){
		var row=$("#student_list").datagrid("getSelected");	//获取datagrid中选中的行
		if(row){
	         $("#stuid").combobox("setValue", row.intenname);
	         $("#stuid").combobox('select', row.intenid);

	         $("#intid").combobox("setValue", row.intenname);
	         $("#intid").combobox('select', row.intenid);
			 $("#studentwin1").window("close");
		}else{
			$.messager.alert('提示','请选择学生','info');	//messager消息控件
		}
	}
    // 打开添加窗口
    function addOpen() {
    	$('#semester').combobox({
    		url : 'semester',
   			editable : false, //不可编辑状态  
   			cache : false,
   			panelHeight : '150',
   			valueField : 'name',
   			textField : 'name',

   			onHidePanel : function() {
   				$("#ys").textbox("setValue", '');//清空课程  
   				var id = $('#semester').combobox('getValue');

   				$.ajax({
   					type : "POST",
   					url : 'should?xq='+id,
   					cache : false,
   					dataType : "json",
   					success : function(data) {
   						$("#ys").textbox("setValue", data[0].name);
   						}
   					});
    			}
    		});
        $("#stuid").combobox({
            url: "<%=path%>/says/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#stuid').combobox('getData');
                if (data.length > 0) {
                    $("#stuid").combobox('select', data[0].id);
                }
            }
        });
        $("#addWindow").window("open");
    }
    // 添加(提交後臺)
    function add() {
    	toValidate("ff");
    	if (validateForm("ff")){
    		var ys = $('#ys').textbox('getValue');
    		var actual = $('#actual').textbox('getValue');
    		var owe = eval(ys-actual);
    		if(owe < 0){
    			 $.messager.alert('提示', '实交学费大于应交学费', 'info');
    		}else{
	            document.getElementById("owe").value = ys - actual;
                $.get('add', $("#ff").serialize(),
                  function (data) {
                      if (data.result.result == 'success') {
                          $.messager.alert('提示', data.result.msg, 'info', function () {
                              $("#addWindow").window("close");
                              $("#list").datagrid("reload");
                              $("#ff").form("clear");
                          });
                      } else {
                          $.messager.alert('提示', data.msg, 'info');
                      }
                  }, "JSON");
    		}
        }
        $("#list").datagrid('reload');
    }
    
    
    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
        	document.getElementById("depid").value = row.dep.eid;
        	document.getElementById("mid").value = row.mid;

        	$('#xq').combobox({
        		url : 'semester',
       			editable : false, //不可编辑状态  
       			cache : false,
       			panelHeight : '150',
       			valueField : 'name',
       			textField : 'name',

       			onHidePanel : function() {
       				$("#yj").textbox("setValue", '');//清空课程  
       				var id = $('#xq').combobox('getValue');

       				$.ajax({
       					type : "POST",
       					url : 'should?xq='+id,
       					cache : false,
       					dataType : "json",
       					success : function(data) {
       						$("#yj").textbox("setValue", data[0].name);
       						}
       					});
        			}
        		});
            $("#xq").combobox("setValue", row.semester);
            $("#xq").combobox('select', row.semester);
			$("#yj").textbox("setValue", row.ys);
            

            $("#intid").combobox({
                url: "<%=path%>/says/tjls",
                method: 'get',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto',
            });
            $("#intid").combobox("setValue", row.student.intenname);
            $("#intid").combobox('select', row.student.intenid);
            
            $("#sj").textbox("setValue", row.actual);
            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
    	toValidate("editForm");
    	if (validateForm("editForm")){
    		var ys = $('#yj').textbox('getValue');
    		var actual = $('#sj').textbox('getValue');
    		var owe = eval(ys-actual);
    		if(owe < 0){
    			 $.messager.alert('提示', '实交学费大于应交学费', 'info');
    		}else{
	            document.getElementById("ow").value = owe;
            	$.get('update', $("#editForm").serialize(),
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
        $("#list").datagrid('reload');
    }
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个学生记录吗？", function (r) {
                if (r) {
                    $.post("delete", {'money.mid': row.mid}, function (data) {
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
            $.messager.alert('提示', '请选中需要删除的学生记录', 'info');
        }
        $("#list").datagrid('reload');
    }
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }
</script>
</body>
</html>