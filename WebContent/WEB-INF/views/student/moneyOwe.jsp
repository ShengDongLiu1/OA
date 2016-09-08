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
		url:'<%=path %>/money/queryOwe', 
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
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="editOpen();">学生补交</a>
	<a href="javascript:(0);" class="easyui-linkbutton" onclick="lookAll();" data-options="iconCls:'icon-search'">查看所有交费情况</a>
</div>
<!-- 编辑窗口 -->
<div style="margin:20px 0;"></div>
<div id="editWindow" class="easyui-window" title="补交" data-options="closed:true,iconCls:'icon-edit'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="editForm">
  			<input type="hidden" id="depid" name="money.dep.eid"/>
  			<input type="hidden" id="mid" name="money.mid" />
  			<input type="hidden" id="intid" name="money.student.intenid" />
  			<input type="hidden" id="act" name="money.actual" />
  			<input type="hidden" id="mtime" name="money.mtime" />
			<table>
			 <tr>
			    <td>学生姓名:</td>
			    <td>
                	<div style="float: left;">
                    	<input class="easyui-textbox" data-options="required:true,novalidate:true" id="intname" name="money.student.intenname"/><br/><br/>
             		</div>
				</td>
			</tr>
			<tr>
			    <td>学期:</td>
			    <td>
			        <input class="easyui-textbox" id="xq" name="money.semester" data-options="required:true,novalidate:true"/><br/><br/>
			    </td>
			</tr>
			<tr>
			    <td>要交费用:</td>
			    <td><input class="easyui-textbox" id="yj" name="money.ys" data-options="required:true,novalidate:true"/><br/><br/></td>
			</tr>
			<tr>
			    <td>未交费用:</td>
			    <td><input class="easyui-textbox" id="ow" name="money.owe" data-options="required:true,novalidate:true"/><br/><br/></td>
			</tr>
			<tr>
			    <td>补交费用:</td>
			    <td><input class="easyui-textbox" id="bj" name="bj" data-options="required:true,novalidate:true"/><br/><br/></td>
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
    
    
 // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
        	document.getElementById("depid").value = row.dep.eid;
        	document.getElementById("mid").value = row.mid;
        	document.getElementById("intid").value = row.student.intenid;
        	document.getElementById("mtime").value = row.mtime;
            $("#intname").textbox("setValue", row.student.intenname);
            $("#xq").textbox("setValue", row.semester);
            $("#yj").textbox("setValue", row.ys);
            $("#ow").textbox("setValue", row.owe);
            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
    	toValidate("editForm");
    	if (validateForm("editForm")){
    		var ow = $('#ow').textbox('getValue');
    		var bj = $('#bj').textbox('getValue');
    		var owe = eval(ow-bj);
    		if(owe < 0){
    			 $.messager.alert('提示', '补交学费大于未交学费', 'info');
    		}else{
                $("#ow").textbox("setValue", owe);
	            document.getElementById("act").value = eval(row.actual+"+"+bj);
	            
            	$.get('updateOwe', $("#editForm").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWindow").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg, "info");
                        }
                    }, "JSON");
    		}
        }
        $("#list").datagrid('reload');
    }
    
    
    
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }

    //选择查看详情
    function lookOpen() {
		window.location.href = "<%=path%>/money/allxf";
    }
    function lookAll(){
    	window.location.href = "<%=path%>/money/all";
    }
</script>
</body>
</html>