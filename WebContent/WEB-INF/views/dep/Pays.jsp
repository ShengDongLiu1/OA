<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工资管理</title>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/demo.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 表格 -->
<table id="list" class="easyui-datagrid" toolbar="#tb" data-options="
		url:'<%=path %>/pays/queryAll', 
		method:'get', 
		rownumbers:true,
		singleSelect:true,
		autoRowHeight: true,
		pagination:true,
		border:false,
		pageSize:10">
    <thead>
    <tr>
        <th data-options="field:'paysid',checkbox:true,width:100" align="center">工资编码</th>
        <th data-options="field:'dep',width:70" formatter="formatterDepName" align="center">员工姓名</th>
        <th data-options="field:'payssta',width:70" align="center">基本工资</th>
        <th data-options="field:'paysc',width:70" align="center">补贴工资</th>
        <th data-options="field:'paysa',width:70" align="center">奖励金额</th>
        <th data-options="field:'paysb',width:70" align="center">惩罚金额</th>
        <th data-options="field:'paysd',width:100" align="center">结余工资</th>
        <th data-options="field:'paytime',width:200" align="center">发放时间</th>
        <th data-options="field:'payspro',width:400" align="center">奖罚原因和备注</th>
    </tr>
    </thead>
</table>
<!-- 菜单 -->
<div id="tb" style="padding: 2px;height:auto;margin-top: 5px;">
	<div style="margin-bottom:5px;">
	    <a href="javascript:(0);" class="easyui-linkbutton" onclick="addOpen();" data-options="iconCls:'icon-add'">添加</a>
	    <a href="javascript:(0);" class="easyui-linkbutton" onclick="choice();" data-options="iconCls:'icon-add'">批量添加</a>
		<a href="#" class="easyui-linkbutton" onclick="QueryAll();" data-options="iconCls:'icon-search'">查找所有</a>
	</div>
	<div style="margin-top: 2px;margin-left:10px;">
		员工姓名:<input class="easyui-combobox" name="ygxm" id="ygxm" style="width:150px;margin-left:10px;">
		<a href="#" class="easyui-linkbutton" onclick="NameQuery();" data-options="iconCls:'icon-search'">按员工姓名查找</a>
	</div>
	<div style="margin-top: 2px;margin-left:10px;">
		开始时间:<input class="easyui-datetimebox" name="kssj" id="kssj" style="width:150px;margin-left:10px;">
		结束时间:<input class="easyui-datetimebox" name="jssj" id="jssj" style="width:150px;margin-left:10px;">
		<a href="#" class="easyui-linkbutton" onclick="DateQuery();" data-options="iconCls:'icon-search'">按时间查找</a>
	</div>
</div>

<!-- 添加窗口 -->
<div style="margin:20px 0;"></div>
<div id="addWindow" class="easyui-window" title="添加" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>员工姓名</td>
                    <td>
                        <input class="easyui-combobox" data-options="required:true" name="pays.dep.eid"
                               id="add_pempid"/>
                    </td>
                </tr>
                <tr>
                    <td>奖励金额:</td>
                    <td><input class="easyui-textbox" name="pays.paysa" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>惩罚金额:</td>
                    <td><input class="easyui-textbox" name="pays.paysb" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>基本工资:</td>
                    <td><input class="easyui-textbox" name="pays.payssta" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>补贴工资:</td>
                    <td><input class="easyui-textbox" name="pays.paysc" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>发放时间:</td>
                    <td><input class="easyui-datetimebox" name="pays.paytime" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>奖罚原因和备注:</td>
                    <td><input class="easyui-textbox" name="pays.payspro" data-options="required:true"/></td>
                </tr>
            </table>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="add();"
                   style="width:80px">添加</a>
                <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
                   onclick="editClose();" style="width:80px">取消</a>
            </div>
        </form>
    </div>
</div>

<!-- 批量选择 -->

<div style="margin:20px 0;"></div>
<div id="choiceWindow" class="easyui-window" title="批量选择员工" data-options="closed:true,iconCls:'icon-add'"
     style="padding:10px;">
    <form id="choice" enctype="multipart/form-data">
        <table id="dg" class="easyui-datagrid" data-options="toolbar:'#pl',rownumbers:true"
               style="width:300px;height:200px">
            <thead></thead>
        </table>
    </form>
</div>
<div style="padding:10px;">
    <a href="javascript:;" class="easyui-linkbutton" id="pl" data-options="iconCls:'icon-help'"
       onclick="addPl();">添加员工</a><br/><br/>
</div>

<script type="text/javascript">
    $(function () {
    	$("#ygxm").combobox({
            url: "pays/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#ygxm').combobox('getData');
                if (data.length > 0) {
                    $("#ygxm").combobox('select', data[0].id);
                }
            }
        });
        setPagination("list");
    });

    function NameQuery(){
    	var ygxm= $('#ygxm').combobox('getValue');
    	if(ygxm==''){
    		alert("请选择员工！")
    	}else{
    		$('#list').datagrid('load', {   
    			xm:ygxm
    		}); 
    	}
    }
    
    function DateQuery(){
    	var kssj= $('#kssj').datetimebox('getValue');
    	var jssj= $('#jssj').datetimebox('getValue');
    	if(kssj==''){
    		alert("请输入开始时间")
    	}else if(jssj == ''){
    		alert("请输入结束时间")
    	}else{
    		$('#list').datagrid('load', {   
    			ks:kssj,
    			js:jssj
    		});  
    	}
    }
    
    function QueryAll(){
    	$('#list').datagrid('load', {   
			ks:'',
			js:''
		});
    }
    
    function addPl() {
        var eid = [];
        var ename = [];
        var rows = $("#dg").datagrid("getSelections");
        if (rows == null || rows == "") {
            $.messager.alert('提示', '请至少选中一个需要发放工资的员工！', 'info');// messager消息控件
        } else {
            for (var i = 0; i < rows.length; i++) {
                eid[i] = rows[i].id;
                ename[i] = rows[i].name;
            }
            window.location.href = "<%=path%>/pays/pL?id=" + eid + "&name=" + ename;
        }
    }

    function choice() {
        $('#dg').datagrid({
            url: "<%=path %>/pays/tjls",
            method: 'get',
            rownumbers: true,
            singleSelect: (this.value == 1),
            autoRowHeight: true,
            border: false,
            columns: [[
                {field: 'id', title: '员工编码', width: 100, align: 'center', checkbox: true},
                {field: 'name', title: '员工姓名', width: 100, align: 'center'},
            ]]
        });
        $("#choiceWindow").window("open");
    }

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
        $("#add_pempid").combobox({
            url: "pays/tjls",
            method: 'get',
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',
            onLoadSuccess: function () { //数据加载完毕事件
                var data = $('#add_pempid').combobox('getData');
                if (data.length > 0) {
                    $("#add_pempid").combobox('select', data[0].id);
                }
            }
        });
        $("#addWindow").window("open");
    }
    // 關閉
    function editClose() {
        $("#editWindow").window("close");
        $("#addWindow").window("close");
    }
    // 添加(提交後臺)
    function add() {
        if ($("#addWindow").form("validate")) {
            $.post('pays/add', $("#ff").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWindow").window("close");
                                $("#list").datagrid("reload");
                                $("#").form("clear");
                            });
                        } else {
                            $.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
                        }
                    }, "JSON");
        }
    }

    function formatterDepName(value) {
        return value.ename;
    }
</script>
</body>
</html>