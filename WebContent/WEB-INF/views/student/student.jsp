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
		url:'<%=path %>/stu/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10,fit:true">
    <thead>
    <tr>
        <th data-options="field:'intenid',checkbox:true,width:100" align="center">编号</th>
        <th data-options="field:'intenname',width:100" align="center">名称</th>
        <th data-options="field:'intensch',width:100" align="center">就读学校</th>
        <th data-options="field:'intensex',width:100" align="center">性别</th>
        <th data-options="field:'intenage',width:50" align="center">年龄</th>
        <th data-options="field:'intenbir',width:100" align="center">出生年月</th>
        <th data-options="field:'intenmz',width:100" align="center">民族</th>
        <th data-options="field:'intenjg',width:100" align="center">籍贯</th>
        <th data-options="field:'intentel',width:100" align="center">学生记录号码</th>
        <th data-options="field:'intenfat',width:100" align="center">家长姓名</th>
        <th data-options="field:'intenfatel',width:100" align="center">学生记录家长号码</th>
        <th data-options="field:'intenaddr',width:100" align="center">家庭住址</th>
        <th data-options="field:'intenstatus',width:100" align="center">学生记录状态</th>
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
</div>
<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table>
             <tr>
                <td>学生记录名称:</td>
                <td><input class="easyui-textbox" name="student.intenname" style="width: 150px;"
                           data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
            </tr>
               	<tr>
                    <td>就读学校:</td>
                    <td><input class="easyui-textbox"  name="student.intensch" data-options="required:true,validType:'length[4,10]',novalidate:true"/>
                    </td>
                </tr>
                <tr>
                    <td>学生记录性别:</td>
                    <td>
                        <label>男</label>
                        <input type="radio"  name="student.intensex" value="男" checked="checked"/>
                        <label>女</label>
                        <input type="radio"  name="student.intensex" value="女"/>
                    </td>
                </tr>
           		<tr>
	                <td>学生记录年龄:</td>
	                <td><input class="easyui-textbox" style="width: 150px;" name="student.intenage"
                                data-options="required:true,validType:'length[1,3]',novalidate:true"
                                style="width:200px"></td>
           		 </tr>
                <tr>
                <td>民族:</td>
                <td>
                    <select class="easyui-combobox"  style="width: 150px;" name="student.intenmz" data-options="required:true">
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
                    <td><input class="easyui-datebox" value="1/1/1990" id="intenbir" name="student.intenbir"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>家长姓名:</td>
                    <td><input class="easyui-textbox" name="student.intenfat" data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>学生记录号码:</td>
                    <td><input class="easyui-textbox" name="student.intentel" data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>学生记录家长号码:</td>
                    <td><input class="easyui-textbox" name="student.intenfatel" data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox" name="student.intenaddr" data-options="required:true,validType:'length[2,10]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>就读疑问:</td>
                    <td><input class="easyui-textbox" name="student.intenpeo" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>选择班级:</td>
                    <td><input class="easyui-combobox" data-options="required:true" id="addclass"
                               name="student.classes.classid"/></td>
                </tr>
                <tr>
                    <td>选择宿舍:</td>
                    <td><input class="easyui-combobox" data-options="required:true" id="addhoure"
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
	                <td>学生记录名称:</td>
	                <td><input class="easyui-textbox" id="ename" name="student.intenname" style="width: 150px;"
	                           data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
           		 </tr>
                <tr>
                    <td>就读学校:</td>
                    <td><input class="easyui-textbox" id="sch" name="student.intensch" data-options="required:true,validType:'length[4,10]',novalidate:true"/>
                    </td>
                </tr>
                
                <tr>
                    <td>学生记录性别:</td>
                    <td>
                        <label>男</label>
                        <input type="radio" id="sex" name="student.intensex" value="男" checked="checked"/>
                        <label>女</label>
                        <input type="radio" id="sex" name="student.intensex" value="女"/>
                    </td>
                </tr>
                <tr>
	                <td>学生记录年龄:</td>
	                <td><input class="easyui-textbox" id="age" style="width: 150px;" name="student.intenage"
                                data-options="required:true,validType:'length[1,3]',novalidate:true"
                                style="width:200px"></td>
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
                    <td>学生记录号码:</td>
                    <td><input class="easyui-textbox" id="tel" name="student.intentel" data-options="required:true,validType:'length[11,11]',novalidate:true"/>
                    </td>
                </tr>
                <tr>
                    <td>学生记录家长号码:</td>
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
                    <td><input class="easyui-textbox" id="peo" name="student.intenpeo" data-options="required:true"/>
                    </td>
                </tr>
                <!-- <tr>
                    <td>学生记录状态:</td>
                    <td><input class="easyui-textbox" id="status" name="student.intenstatus" /></td>
                </tr> -->
                <tr>
                    <td>学生记录班级:</td>
                    <td><input class="easyui-combobox" data-options="required:true" id="clas" name="student.classes.classid"/>
                    </td>
                </tr>
                <tr>
                    <td>学生记录宿舍:</td>
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
                            $.messger.alert("提示", data.msg, "info");
                        }
                    }, "JSON");
        }
        $("#list").datagrid('reload');
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
            $("#editWindow").window("open");
        } else {
            $.messager.alert('提示', '请选中需要修改的列', 'info');// messager消息控件
        }
    }
    // 编辑提交
    function edit() {
    	toValidate("editForm");
    	if (validateForm("editForm")){
            $.get('stu/update', $("#editForm").serialize(),
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
        $("#list").datagrid('reload');
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
        $("#list").datagrid('reload');
    }
    // 关闭窗口
    function Winclose(c) {
        $("#" + c).window("close");
    }
</script>
</body>
</html>