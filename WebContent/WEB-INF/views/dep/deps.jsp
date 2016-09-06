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

    $(function () {

        var row = $("#list").datagrid({
            onRowContextMenu: function (e, rowindex, rowData) { //datagrid中的每一行都绑定右键菜单
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
            document.getElementById("eid").value = row.eid;
            $("#ename").textbox('setValue', row.ename);
            $("#mid").textbox('setValue', row.mid);
            $("#ebirth").textbox("setValue", row.ebirth);
            $("#enumber").textbox("setValue", row.enumber);
            $("#ecertid").textbox('setValue', row.ecertid);
            $("#ecity").textbox("setValue", row.ecity);
            $("#eanton").textbox('setValue', row.eanton);
            $("#edu").textbox("setValue", row.edu);
            $("#eaddr").textbox('setValue', row.eaddr);
            $("#basepay").textbox("setValue", row.basepay);
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
        if ($("#editWin").form("validate")) {
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
    }

    function closes() {
        $("#addWin").window("close");
    }
    function doAdd() {
        if ($("#addWin").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post("dep/add", $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWin").window("close");
                                $("#list").datagrid("reload");
                                $("#addForm").form("clear");
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
    
    function daochu(){ 
    	window.location.href='<%=path %>/dep/daochu';
    	$.messager.alert('提示', '导出成功', 'info');
    }

</script>
</head>
<body>
<table id="list" class="easyui-datagrid"
       data-options=" 
		toolbar:'#tb',
		url:'<%=path%>/dep/queryAll', 
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
        <th data-options="field:'ename',width:100"  align="center">员工姓名</th>
        <th data-options="field:'esex',width:100" align="center">员工性别</th>
        <th data-options="field:'departments',width:100" formatter="depardname" align="center">部门名称</th>
        <th data-options="field:'ebirth',width:150" align="center">员工生日</th>
        <th data-options="field:'enumber',width:100" align="center">员工号码</th>
        <th data-options="field:'ecertid',width:130" align="center"> 身份证号</th>
        <th data-options="field:'ecity',width:100" align="center">员工籍贯</th>
        <th data-options="field:'eanton',width:100" align="center">民族</th>
        <th data-options="field:'edu',width:100" align="center">学历</th>
        <th data-options="field:'eaddr',width:100" align="center">家庭住址</th>
        <th data-options="field:'etry',width:150" align="center">招聘时间</th>
        <th data-options="field:'basepay',width:100" align="center">基本工资</th>
        <th data-options="field:'dstatuss',width:100" formatter="statuname" align="center">员工状态</th>
    </tr>

    </thead>
</table>


<div id="tb" style="padding: 5px;">
    <div style="float: left;">
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-add'" onclick="addPro();">添加</a>
        <!-- 链接按钮控件 -->
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-remove'" onclick="removeCP();">移除</a>
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit'" onclick="edit();">修改</a>
        <a href="javascript:;" class="easyui-linkbutton"
           data-options="iconCls:'icon-search'" onclick="queryById1();">查看该员工工作经历</a>
           <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-redo'" onclick="daochu();">导出数据</a>
    </div>
    <p style="clear: both;"></p>
</div>

<div id="editWin" class="easyui-window" title="修改员工"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 400px; height: 500px; padding:10px 60px 20px 60px">
    <form id="editForm" enctype="multipart/form-data">
        <input type="hidden" id="eid" name="dep.eid"/>
        <table style="margin: auto">
            <tr>
                <td>员工姓名:</td>
                <td><input class="easyui-textbox" id="ename" name="dep.ename" style="width: 150px;"
                           data-options="required:true,validType:'length[1,6]',novalidate:true"/></td>
            </tr>
            <tr>
                <td><br/>员工性别:</td>
                <td><br/>
                    <label>男</label>
                    <input type="radio" id="esex" name="dep.esex" value="男" checked="checked"/>
                    <label>女</label>
                    <input type="radio" id="esex" name="dep.esex" value="女"/>
                </td>
            </tr>
            <tr>
                <td>选择部门:</td>
                <td><br/>
                    <input class="easyui-combobox" data-options="required:true,novalidate:true" style="width:150px;" id="depar1"
                           name="dep.mid"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>员工生日:</td>
                <td><input class="easyui-datebox" value="10/11/2012" style="width: 150px;" id="ebirth" name="dep.ebirth"
                           style="width:200px"></td>
            </tr>
            <tr>
                <td><br/>员工号码:</td>
                <td><br/><input class="easyui-textbox" id="enumber" style="width: 150px;" name="dep.enumber"
                                data-options="required:true,validType:'length[11,11]',novalidate:true"
                                style="width:200px"></td>
            </tr>
            <tr>
                <td><br/>身份证号:</td>
                <td><br/><input class="easyui-textbox" id="ecertid" style="width: 150px;" name="dep.ecertid"
                                data-options="required:true,validType:'length[16,18]',novalidate:true"></td>
            </tr>
            <tr>
                <td><br/>员工籍贯:</td>
                <td><br/><input class="easyui-textbox" id="ecity" style="width: 150px;" name="dep.ecity"
                                data-options="required:true,validType:'length[4,10]',novalidate:true"></td>
            </tr>
            <tr>
                <td><br/>民族:</td>
                <td><br/>
                    <select class="easyui-combobox" id="eanton" style="width: 150px;" name="dep.eanton" data-options="required:true,novalidate:true">
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
                <td><br/>学历:</td>
                <td><br/>
                    <select class="easyui-combobox" id="edu" style="width: 150px;" name="dep.edu"
                            data-options="required:true,novalidate:true">
                        <option value="本科">本科</option>
                        <option value="硕士">硕士</option>
                        <option value="专科">专科</option>
                        <option value="其它">其它</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><br/>家庭住址:</td>
                <td><br/><input class="easyui-textbox" id="eaddr" style="width: 150px;height: 55px;" name="dep.eaddr"
                                data-options="multiline:true,required:true,novalidate:true"></td>
            </tr>
            
            <tr>
                <td><br/>基本工资:</td>
                <td><br/><input class="easyui-textbox easyui-numberbox" id="basepay" style="width: 150px;" name="dep.basepay"
                                data-options="required:true,validType:'length[3,10]',novalidate:true"
                                style="width:200px"></td>
            </tr>
            <tr>
                <td>选择状态:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true,novalidate:true" style="width: 150px;" id="updateestatus"
                           name="dep.dstatuss.dsid"><br/><br/>
                </td>
            </tr>
        </table>
        <div data-options="region:'south',border:false" style="text-align:right;padding:10px 0 0;">
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="doEdit();"
               style="width:80px;height:20px;">添加</a>
            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
               onclick="closeedit();" style="width:80px;height:20px;">取消</a>
        </div>
    </form>
</div>

<div id="addWin" class="easyui-window" title="添加员工"
     data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 400px; height: 500px; padding:10px 60px 20px 60px">
    <form id="addForm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>员工姓名:</td>
                <td><input class="easyui-textbox" id="ename" style="width: 150px;" name="dep.ename"
                           data-options="required:true,validType:'length[2,6]',novalidate:true"/></td>
            </tr>
            <tr>
                <td><br/>员工性别:</td>
                <td><br/>
                    <label>男</label>
                    <input type="radio" id="planType" id="esex" name="dep.esex" value="男" checked="checked"/>
                    <label>女</label>
                    <input type="radio" id="planType1" id="esex" name="dep.esex" value="女"/>
                </td>
            </tr>
            <tr>
                <td>选择部门:</td>
                <td>
                    <br/><input class="easyui-combobox" data-options="required:true" style="width: 150px;" id="adddepar"
                                name="dep.mid"/><br/><br/>
                </td>
            </tr>
            <tr>
                <td>员工生日:</td>
                <td><input class="easyui-datebox" value="10/11/2012" style="width: 150px;" id="ebirth" name="dep.ebirth"
                           style="width:150px;"/></td>
            </tr>
            <tr>
                <td><br/>员工手机:</td>
                <td><br/><input class="easyui-textbox easyui-numberbox" id="enumber" style="width: 150px;" name="dep.enumber"
                                data-options="required:true,validType:'length[11,11]',novalidate:true"
                                style="width:150px"></td>
            </tr>
            <tr>
                <td><br/>身份证号:</td>
                <td><br/><input class="easyui-textbox" name="dep.ecertid" style="width: 150px;" style="width:150px"
                                data-options="required:true,validType:'length[16,18]',novalidate:true"/></td>
            </tr>
            <tr>
                <td><br/>员工籍贯:</td>
                <td><br/><input class="easyui-textbox" name="dep.ecity" style="width: 150px;" style="width:150px"
                                data-options="required:true,validType:'length[4,10]',novalidate:true"/></td>
            </tr>
            <tr>
                <td><br/>民族:</td>
                <td>
                    <br/>
                    <select class="easyui-combobox" style="width: 150px" name="dep.eanton" data-options="required:true">
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
                <td><br/>学历:</td>
                <td>
                    <br/>
                    <select class="easyui-combobox" name="dep.edu" style="width: 150px;" data-options="required:true">
                        <option value="本科">本科</option>
                        <option value="硕士">硕士</option>
                        <option value="专科">专科</option>
                        <option value="其它">其它</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><br/>家庭住址:</td>
                <td><br/><input class="easyui-textbox" data-options="multiline:true" name="dep.eaddr"
                                style="width: 150px;height: 55px;"/></td>
            </tr>
               
            <tr>
                <td><br/>基本工资:</td>
                <td><br/><input class="easyui-textbox easyui-numberbox" style="width: 150px;" name="dep.basepay"
                                data-options="required:true,validType:'length[3,10]',novalidate:true"></td>
            </tr>
            <tr>
                <td>选择职位:</td>
                <td><br>
                    <input class="easyui-combobox" data-options="required:true" style="width: 150px;" id="addestatus"
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