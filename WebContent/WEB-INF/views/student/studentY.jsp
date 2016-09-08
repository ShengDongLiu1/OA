<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生记录管理</title>
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
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/stu/queryAllY', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:20,fit:true">
    <thead>
    <tr>
        <th data-options="field:'intenid',checkbox:true,width:100" align="center">编号</th>
        <th data-options="field:'intenname',width:100" align="center">名称</th>
        <th data-options="field:'intensch',width:100" align="center">毕业学校</th>
        <th data-options="field:'intensex',width:50" align="center">性别</th>
        <th data-options="field:'intenage',width:50" align="center">年龄</th>
        <th data-options="field:'intentel',width:100" align="center">学生号码</th>
        <th data-options="field:'intenfat',width:100" align="center">家长姓名</th>
        <th data-options="field:'intenfatel',width:100" align="center">学生家长号码</th>
        <th data-options="field:'intenaddr',width:100" align="center">家庭住址</th>
        <th data-options="field:'classes',width:100" formatter="forClasses" align="center">所在班级</th>
        <th data-options="field:'hourse',width:100" formatter="forHourse" align="center">所在宿舍</th>
        <th data-options="field:'intendate',width:100">入学时间</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;">
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="addClas();">添加</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="editOpen();" data-options="iconCls:'icon-edit'">编辑</a>
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="expurgate();"
       data-options="iconCls:'icon-remove'">删除</a>
      <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="addLook();">查看学生详情</a>
   <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-redo'" onclick="daochu();">导出数据</a>
   <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="updateZ();">转为正式学生</a>
	<br/>
   	<input class="easyui-textbox" id="tiaoname" size="10px" />
    <a href="javascript:(0);" class="easyui-linkbutton" onclick="queryByDepName();" data-options="iconCls:'icon-search'">按学生姓名查询</a>
    <input class="easyui-combobox" data-options="required:true"
				style="width: 150px;" id="classid" name="student.classes.classid" /> <a
				href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryByClassName();">按照班级查询</a>
	<a href="javascript:;" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="queryall();">查询全部</a>			
				
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
  			<input name="student.status.zid" value="9" type="hidden"/>
            <table>
             <tr>
                <td>学生姓名:</td>
                <td><input class="easyui-textbox" name="student.intenname" style="width: 150px;"
                           data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
            </tr>
               	<tr>
                    <td>毕业学校:</td>
                    <td><input class="easyui-textbox"  name="student.intensch" data-options="required:true,validType:'length[4,10]',novalidate:true"/>
                    </td>
                </tr>
                <tr>
                    <td>学生性别:</td>
                    <td>
                        <label>男</label>
                        <input type="radio"  name="student.intensex" value="男" checked="checked"/>
                        <label>女</label>
                        <input type="radio"  name="student.intensex" value="女"/>
                    </td>
                </tr>
                <tr>
                <td>民族:</td>
                <td>
                    <select class="easyui-combobox"  style="width: 150px;" name="student.intenmz" data-options="required:true,novalidate:true">
                        <option value="汉族">汉族</option>
                        <option value="蒙古族">蒙古族</option>
                        <option value="彝族">彝族</option>
                        <option value="侗族">侗族</option>
                        <option value="哈萨克族">哈萨克族</option>
                        <option value="畲族">畲族</option>
                        <option value="纳西族">纳西族</option>
                        <option value="仫佬族">仫佬族</option>
                        <option value="仡佬族">仡佬族</option>
                        <option value="怒族">怒族</option>
                        <option value="保安族">保安族</option>
                        <option value="鄂伦春族">鄂伦春族</option>
                        <option value="回族">回族</option>
                        <option value="壮族">壮族</option>
                        <option value="瑶族">瑶族</option>
                        <option value="傣族">傣族</option>
                        <option value="高山族">高山族</option>
                        <option value="景颇族">景颇族</option>
                        <option value="羌族">羌族</option>
                        <option value="锡伯族">锡伯族</option>
                        <option value="乌孜别克族">乌孜别克族</option>
                        <option value="裕固族">裕固族</option>
                        <option value="赫哲族">赫哲族</option>
                        <option value="藏族">藏族</option>
                        <option value="布依族">布依族</option>
                        <option value="白族">白族</option>
                        <option value="黎族">黎族</option>
                        <option value="拉祜族">拉祜族</option>
                        <option value="柯尔克孜族">柯尔克孜族</option>
                        <option value="布朗族">布朗族</option>
                        <option value="阿昌族">阿昌族</option>
                        <option value="俄罗斯族">俄罗斯族</option>
                        <option value="京族">京族</option>
                        <option value="门巴族">门巴族</option>
                        <option value="维吾尔族">维吾尔族</option>
                        <option value="朝鲜族">朝鲜族</option>
                        <option value="土家族">土家族</option>
                        <option value="傈僳族">傈僳族</option>
                        <option value="水族">水族</option>
                        <option value="土族">土族</option>
                        <option value="撒拉族">撒拉族</option>
                        <option value="普米族">普米族</option>
                        <option value="鄂温克族">鄂温克族</option>
                        <option value="塔塔尔族">塔塔尔族</option>
                        <option value="珞巴族">珞巴族</option>
                        <option value="苗族">苗族</option>
                        <option value="满族">满族</option>
                        <option value="哈尼族">哈尼族</option>
                        <option value="佤族">佤族</option>
                        <option value="东乡族">东乡族</option>
                        <option value="达斡尔族">达斡尔族</option>
                        <option value="毛南族">毛南族</option>
                        <option value="塔吉克族">塔吉克族</option>
                        <option value="德昂族">德昂族</option>
                        <option value="独龙族">独龙族</option>
                        <option value="基诺族">基诺族</option>
                    </select>
                </td>
            </tr>
                <tr>
                    <td>籍贯:</td>
                    <td><input class="easyui-textbox" name="student.intenjg" data-options="required:true,validType:'length[2,10]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>出生年月:</td>
                    <td><input class="easyui-datebox" value="1990-01-01" id="intenbir" name="student.intenbir"
                               data-options="required:true,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>家长姓名:</td>
                    <td><input class="easyui-textbox" name="student.intenfat" data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>学生号码:</td>
                    <td><input class="easyui-textbox" name="student.intentel" data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>学生家长号码:</td>
                    <td><input class="easyui-textbox" name="student.intenfatel" data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox" name="student.intenaddr" data-options="required:true,validType:'length[2,10]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>就读疑问:</td>
                    <td><input class="easyui-textbox" name="student.intenpeo" style="width: 200px; height: 80px;"
                     data-options="multiline:true,required:true,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>选择班级:</td>
                    <td><input class="easyui-combobox" data-options="required:true,novalidate:true" id="addclass"
                               name="student.classes.classid"/></td>
                </tr>
                <tr>
                    <td>选择宿舍:</td>
                    <td><input class="easyui-combobox" data-options="required:true,novalidate:true" id="addhoure"
                               name="student.hourse.hourid"/></td>
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
  			<input  id="id" name="student.intenid" type="hidden"/>
            <table>
                <tr>
	                <td>学生名称:</td>
	                <td><input class="easyui-textbox" id="ename" name="student.intenname" style="width: 150px;"
	                           data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
           		 </tr>
                <tr>
                    <td>就读学校:</td>
                    <td><input class="easyui-textbox" id="sch" name="student.intensch" data-options="required:true,validType:'length[4,10]',novalidate:true"/>
                    </td>
                </tr>
                
                <tr>
                    <td>学生性别:</td>
                    <td>
                        <label>男</label>
                        <input type="radio" id="sex" name="student.intensex" value="男" checked="checked"/>
                        <label>女</label>
                        <input type="radio" id="sex" name="student.intensex" value="女"/>
                    </td>
                </tr>
                <tr>
                <td>民族:</td>
                <td><br/>
                    <select class="easyui-combobox" id="mz" style="width: 150px;" name="student.intenmz" data-options="required:true">
                        <option value="汉族">汉族</option>
                        <option value="蒙古族">蒙古族</option>
                        <option value="彝族">彝族</option>
                        <option value="侗族">侗族</option>
                        <option value="哈萨克族">哈萨克族</option>
                        <option value="畲族">畲族</option>
                        <option value="纳西族">纳西族</option>
                        <option value="仫佬族">仫佬族</option>
                        <option value="仡佬族">仡佬族</option>
                        <option value="怒族">怒族</option>
                        <option value="保安族">保安族</option>
                        <option value="鄂伦春族">鄂伦春族</option>
                        <option value="回族">回族</option>
                        <option value="壮族">壮族</option>
                        <option value="瑶族">瑶族</option>
                        <option value="傣族">傣族</option>
                        <option value="高山族">高山族</option>
                        <option value="景颇族">景颇族</option>
                        <option value="羌族">羌族</option>
                        <option value="锡伯族">锡伯族</option>
                        <option value="乌孜别克族">乌孜别克族</option>
                        <option value="裕固族">裕固族</option>
                        <option value="赫哲族">赫哲族</option>
                        <option value="藏族">藏族</option>
                        <option value="布依族">布依族</option>
                        <option value="白族">白族</option>
                        <option value="黎族">黎族</option>
                        <option value="拉祜族">拉祜族</option>
                        <option value="柯尔克孜族">柯尔克孜族</option>
                        <option value="布朗族">布朗族</option>
                        <option value="阿昌族">阿昌族</option>
                        <option value="俄罗斯族">俄罗斯族</option>
                        <option value="京族">京族</option>
                        <option value="门巴族">门巴族</option>
                        <option value="维吾尔族">维吾尔族</option>
                        <option value="朝鲜族">朝鲜族</option>
                        <option value="土家族">土家族</option>
                        <option value="傈僳族">傈僳族</option>
                        <option value="水族">水族</option>
                        <option value="土族">土族</option>
                        <option value="撒拉族">撒拉族</option>
                        <option value="普米族">普米族</option>
                        <option value="鄂温克族">鄂温克族</option>
                        <option value="塔塔尔族">塔塔尔族</option>
                        <option value="珞巴族">珞巴族</option>
                        <option value="苗族">苗族</option>
                        <option value="满族">满族</option>
                        <option value="哈尼族">哈尼族</option>
                        <option value="佤族">佤族</option>
                        <option value="东乡族">东乡族</option>
                        <option value="达斡尔族">达斡尔族</option>
                        <option value="毛南族">毛南族</option>
                        <option value="塔吉克族">塔吉克族</option>
                        <option value="德昂族">德昂族</option>
                        <option value="独龙族">独龙族</option>
                        <option value="基诺族">基诺族</option>
                    </select>
                </td>
            </tr>
                <tr>
                    <td>籍贯:</td>
                    <td><input class="easyui-textbox" id="jg" name="student.intenjg" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>出生年月:</td>
                    <td><input class="easyui-datebox" value="1/1/1990" id="bir" name="student.intenbir"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>家长姓名:</td>
                    <td><input class="easyui-textbox" id="fat" name="student.intenfat" data-options="required:true,validType:'length[2,6]',novalidate:true"/>
                    </td>
                </tr>
                <tr>
                    <td>学生号码:</td>
                    <td><input class="easyui-textbox" id="tel" name="student.intentel" data-options="required:true,validType:'length[11,11]',novalidate:true"/>
                    </td>
                </tr>
                <tr>
                    <td>学生家长号码:</td>
                    <td><input class="easyui-textbox" id="fatel" name="student.intenfatel"
                               data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox" id="addr" name="student.intenaddr" data-options="required:true,validType:'length[2,10]',novalidate:true"/>
                    </td>
                </tr>
                <tr>
                    <td>就读疑问:</td>
                      <td><input class="easyui-textbox" id="peo" name="student.intenpeo" style="width: 200px; height: 80px;" data-options="multiline:true,required:true"/>
                </tr>
                <tr>
                    <td>学生班级:</td>
                    <td><input class="easyui-combobox" data-options="required:true" id="clas" name="student.classes.classid"/>
                    </td>
                </tr>
                <tr>
                    <td>学生宿舍:</td>
                    <td><input class="easyui-combobox" data-options="required:true" id="hous" name="student.hourse.hourid"/>
                    </td>
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
<input  class="easyui-textbox" type="hidden" id="hours"> 
<script type="text/javascript">

    function forClasses(value) {
        return value.classname;
    }
    function forHourse(value) {
        return value.hourname;
    }
    //打开添加班级和宿舍窗口
    function addClas() {
        $("#addWindow").window("open");
        $("#addclass").combobox({
            url: "<%=path%>/stu/classes",
            method: 'post',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addclass').combobox('getData');
                if (data.length > 0) {
                    $("#addclass").combobox('select', data[0].id);
                }
            }
        });
        $("#addhoure").combobox({
            url: "<%=path%>/stu/hourse",
            method: 'post',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#addhoure').combobox('getData');
                if (data.length > 0) {
                    $("#addhoure").combobox('select', data[0].id);
                }
            }
        });
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
    // 打开添加窗口
    function addOpen() {
        $("#addWindow").window("open");
    }
    // 添加(提交後臺)
    function add() {
    	toValidate("ff");
    	if (validateForm("ff")){
            $.get('stu/add', $("#ff").serialize(),
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
                    }, "JSON");
        }
    }
    // 打开编辑窗口
    function editOpen() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
        	document.getElementById("id").value = row.intenid;
            $("#ename").textbox("setValue", row.intenname);
            $("#sch").textbox("setValue", row.intensch);
            $("#age").textbox("setValue", row.intenage);
            $("#mz").textbox("setValue", row.intenmz);
            $("#jg").textbox("setValue", row.intenjg);
            $("#bir").textbox("setValue", row.intenbir);
            $("#fat").textbox("setValue", row.intenfat);
            $("#tel").textbox("setValue", row.intentel);
            $("#fatel").textbox("setValue", row.intenfatel);
            $("#addr").textbox("setValue", row.intenaddr);
            $("#peo").textbox("setValue", row.intenpeo);
            $("#clas").combobox({
                url: '<%=path%>/stu/classes',
                method: 'post',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto'
            });
            $("#clas").combobox("setValue", row.classes.classname);
            $("#clas").combobox('select', row.classes.classid);
            $("#hous").combobox({
                url: '<%=path%>/stu/hourse',
                method: 'post',
                valueField: 'id',
                textField: 'name',
                panelHeight: 'auto'
            });
            $("#hous").combobox("setValue", row.hourse.hourname);
            $("#hous").combobox('select', row.hourse.hourid);
            var house = $("#hous").combobox("getValue");
           	$("#hours").textbox('setValue',house);
            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
    	toValidate("editForm");
    	if (validateForm("editForm")){
    		var hous = $("#hours").textbox("getValue");
    		$.get('stu/hourses',{'hourseid':hous},"json");
            $.post('stu/update', $("#editForm").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#editWindow").window("close");
                                $("#list").datagrid("reload");
                            });
                        } else {
                            $.messager.alert("提示", data.result.msg, "info");
                        }
                    }, "JSON");
        }
    }
    function updateZ() {
        var row = $("#list").datagrid("getSelected"); // 获取datagrid中被选中的行
        if (row) {
            $.post('updateZ',{'student.intenid':row.intenid},
                 function (data) {
                     if (data.result.result == 'success') {
                         $.messager.alert("提示", data.result.msg, "info", function () {
                             $("#editWindow").window("close");
                             $("#list").datagrid("reload");
                         });
                     } else {
                         $.messager.alert("提示", data.result.msg, "info");
                     }
                 }, "JSON");
      	  } else {
	            $.messager.alert('提示', '请选中需要添加的学生', 'info');// messager消息控件
	        }
        }
    
    //删除
    function expurgate() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            $.messager.confirm("提示", "确认要删除这个学生记录吗？", function (r) {
                if (r) {
                    $.post("stu/delete", {'student.intenid': row.intenid}, function (data) {
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
    }
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }
    
    
    function daochu(){ 
    	window.location.href='<%=path %>/stu/daochu';
    	$.messager.alert('提示', '导出成功', 'info');
    }
    
	function queryByDepName() {
        //按条件进行查询数据，首先我们得到数据的值
        tiaoname=$('#tiaoname').val()
        $('#list').datagrid('load',{  
        	tiaoname:tiaoname
        });
	}
	function queryByClassName() {
        classid=$('#classid').combobox("getValue");
        $('#list').datagrid('load',{  
        	classid:classid
        });
	}
	
	function queryall(){
		$('#list').datagrid('load',{
		});
	}
	$(function(){
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
	});
	
	
    //选择查看详情
    function addLook() {
        var row = $("#list").datagrid("getSelected");
        if (row) {
            window.location.href = "<%=path%>/stu/queryStuY?student.intenid=" + row.intenid;
        } else {
            $.messager.alert('提示', '请选中需要查看的学生!', 'info');// messager消息控件
        }
    }
	
</script>
</body>
</html>