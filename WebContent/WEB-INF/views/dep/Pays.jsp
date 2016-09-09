<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工资管理</title>
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
		pageSize:20,fit:true">
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
	    <a href="javascript:(0);" class="easyui-linkbutton" onclick="xzbm();" data-options="iconCls:'icon-add'">批量添加</a>
		<a href="#" class="easyui-linkbutton" onclick="QueryAll();" data-options="iconCls:'icon-search'">查找所有</a>
	</div>
	<div style="margin-top: 2px;margin-left:10px;">
		员工部门:<input class="easyui-combobox" name="ygbm" value="请选择部门" id="ygbm" style="width:100px;margin-left:10px;">
		<a href="#" class="easyui-linkbutton" onclick="BmQuery();" data-options="iconCls:'icon-search'">按部门查找</a>
		<!-- 员工姓名查找  -->
		员工姓名:<input class="easyui-textbox" name="ygxm" id="ygxm" style="width:100px;margin-left:10px;">
		<a href="#" class="easyui-linkbutton" onclick="NameQuery();" data-options="iconCls:'icon-search'">按姓名查找</a>
	</div>
	<div style="margin-top: 2px;margin-left:10px;">
		开始时间:<input class="easyui-datebox" name="kssj" id="kssj" style="width:150px;margin-left:10px;">
		结束时间:<input class="easyui-datebox" name="jssj" id="jssj" style="width:150px;margin-left:10px;">
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
                    <td>员工部门</td>
                    <td>
                        <input class="easyui-combobox" id="add_bm" value="请选择部门"/>
                    </td>
                </tr>
                <tr>
                    <td>员工姓名</td>
                    <td>
                        <input class="easyui-combobox" name="pays.dep.eid" value="请先选择部门" id="add_pempid"/>
                    </td>
                </tr>
                <tr>
                    <td>基本工资:</td>
                    <td><input class="easyui-textbox" name="pays.payssta" id="jbgz" data-options="required:true,readonly:true,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>奖励金额:</td>
                    <td><input class="easyui-validatebox easyui-numberbox" name="pays.paysa" data-options="required:true,precision:2,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>惩罚金额:</td>
                    <td><input class="easyui-validatebox easyui-numberbox" name="pays.paysb" data-options="required:true,precision:2,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>补贴工资:</td>
                    <td><input class="easyui-validatebox easyui-numberbox" name="pays.paysc" data-options="required:true,precision:2,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>发放时间:</td>
                    <td><input class="easyui-datebox" name="pays.paytime" data-options="required:true,novalidate:true"/></td>
                </tr>
                <tr>
                    <td>奖罚原因和备注:</td>
                    <td><input class="easyui-textbox" name="pays.payspro" style="width: 200px; height: 80px;" data-options="multiline:true"/></td>
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
<!-- 选择员工 -->
<div id="selectMulti" class="easyui-window" data-options="closed:true,iconCls:'icon-add'" title="批量选择员工">
		<table id="yg" class="easyui-datagrid" style="width:870px;" data-options="
				toolbar:'#ass',
				url:'<%=path %>/dep/queryAll', 
				method:'get', 
				rownumbers: true,
				singleSelect: false,
				autoRowHeight: true,
				pagination:true,
				border:false,
				pageSize:10"
	   			 >
        <thead>
	        <tr>
		        <th data-options="field:'eid',checkbox:true" align="center">员工编号</th>
		        <th data-options="field:'ename',width:200"  align="center">员工姓名</th>
		        <th data-options="field:'esex',width:200" align="center">员工性别</th>
		        <th data-options="field:'departments',width:200" formatter="depardname" align="center">所属部门</th>
	         	<th data-options="field:'basepay',width:200" align="center">基本工资</th>
	        </tr>
        </thead>
    </table>
</div>
<div id="ass" style="padding: 2px;">
    <div style="margin-top: 2px;margin-left:10px;">
    	<a href="javascript:(0);" class="easyui-linkbutton" onclick="addPl();" data-options="iconCls:'icon-ok'">确认选择</a>&nbsp;|&nbsp;
		员工部门:<input class="easyui-combobox" name="czbmyg" value="请选择部门" id="czbmyg" style="width:100px;margin-left:10px;">
		<a href="#" class="easyui-linkbutton" onclick="czbmygQuery();" data-options="iconCls:'icon-search'">按部门查找</a>
		<!-- 员工姓名查找  -->&nbsp;|&nbsp;
		员工姓名:<input class="easyui-textbox" name="czygxm" id="czygxm" style="width:100px;margin-left:10px;">
		<a href="#" class="easyui-linkbutton" onclick="namequery();" data-options="iconCls:'icon-search'">按姓名查找</a>
		&nbsp;|&nbsp;<a href="#" class="easyui-linkbutton" onclick="queryall();" data-options="iconCls:'icon-search'">查找所有</a>
	</div>
</div>

<script type="text/javascript">
	function depardname(value) {
	    return value.dname;
	}
	
 	function trim(str) { //删除左右两端的空格
	        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
	
    $(function () {
    	 // 下拉框选择控件，下拉框的内容是动态查询数据库信息  
        $('#ygbm').combobox({  
                url:"pays/xzBm",   
                editable:false, //不可编辑状态  
                cache: false,
                panelHeight: 'auto',  
                valueField: 'id',
                textField: 'name', 
        });

        setPagination("list");
    });
   
    function namequery(){
    	var czygxm= $('#czygxm').val();
    	if(trim(czygxm)==''){
    		alert("您的输入为空，无法查找");
    		return;
    	}else{
    		$('#yg').datagrid('load', {   
    			czygxm:czygxm
    		}); 
    	}
    }
    
    function queryall(){
   		$('#yg').datagrid('load',{
   		});
    }
    
    function czbmygQuery(){
    	var czbmyg= $('#czbmyg').combobox('getValue');
    	if(czbmyg=='请选择部门'){
    		alert(czbmyg)
    	}else{
    		$('#yg').datagrid('load', {   
    			czbmyg:czbmyg
    		}); 
    	}
    }
    
    function xzbm(){
    	$('#czbmyg').combobox({  
            url:"pays/xzBm",   
            editable:false, //不可编辑状态  
            cache: false,
            panelHeight: 'auto',  
            valueField: 'id',
            textField: 'name', 
    	});
    	var top = $("#selectMulti").offset().top + 50;
    	var left = $("#selectMulti").offset().left + 100;
    	$('#selectMulti').dialog('open').window('resize',{top: top,left:left});
    }
    
    function BmQuery(){
    	var ygbm= $('#ygbm').combobox('getValue');
    	if(ygbm=='请选择部门'){
    		alert(ygbm)
    	}else{
    		$('#list').datagrid('load', {   
    			bm:ygbm
    		}); 
    	}
    }
    
    function NameQuery(){
    	var ygxm = document.getElementsByName("ygxm")[0].value;
    	if(trim(ygxm)==''){
    		alert("请输入员工姓名！")
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
    	window.location.href = "<%=path %>/pays/all";
    }
    
    function addPl() {
        var eid = [];
        var ename = [];
        var gz=[];
        var rows = $("#yg").datagrid("getSelections");
        if (rows == null || rows == "") {
            $.messager.alert('提示', '请至少选中一个需要发放工资的员工！', 'info');// messager消息控件
        } else {
            for (var i = 0; i < rows.length; i++) {
                eid[i] = rows[i].eid;
                ename[i] = rows[i].ename;
                gz[i] = rows[i].basepay;
            }
            window.location.href = "<%=path%>/pays/pL?id=" + eid + "&name=" + ename+"&gz="+gz;
        }
    }

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
        var row = $("#list").datagrid("getSelected");
    	 // 下拉框选择控件，下拉框的内容是动态查询数据库信息  
        $('#add_bm').combobox({  
                url:"pays/xzBm",   
                editable:false, //不可编辑状态  
                cache: false,
                panelHeight: 'auto',  
                valueField: 'id',
                textField: 'name', 
         		onHidePanel: function(){
              		$("#add_pempid").combobox("setValue",'');//清空员工姓名
              		var id = $('#add_bm').combobox('getValue');          
		            $.ajax({ 
		              type: "POST",
		              url:'pays/tjls?did='+id,
		              cache: false,  
		              dataType : "json",  
		              success: function(data){  
		             	 $("#add_pempid").combobox("loadData",data);  
		              }
                  	});    
               }
        });


    	$('#add_pempid').combobox({
   			editable : false, //不可编辑状态  
   			cache : false,
            valueField: 'id',
            textField: 'name',
            panelHeight: 'auto',

   			onHidePanel : function() {
   				$("#jbgz").textbox("setValue", '');//清空 
   				var id = $('#add_pempid').combobox('getValue');
   				$.ajax({
   					type : "POST",
   					url : 'jbgz?eid='+id,
   					cache : false,
   					dataType : "json",
   					success : function(data) {
   						$("#jbgz").textbox("setValue", data[0].name);
   						}
   					});
    			}
    		});
    	 
        $("#addWindow").window("open");
    }
    // 關閉
    function editClose() {
        $("#addWindow").window("close");
        $("#ff").form("clear");
    }
    // 添加(提交後臺)
    function add() {
    	var xzbm= $('#add_bm').combobox('getValue');
    	var xzyg= $('#add_pempid').combobox('getValue');
    	if(xzbm=='请选择部门'){
    		alert(xzbm)
    		return;
    	}else if(xzyg == '请先选择部门' || xzyg == ''){
    		alert("请选择员工")
    		return;
    	}
    	
        if ($("#addWindow").form("validate")) {
            $.post('pays/add', $("#ff").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWindow").window("close");
                                $("#list").datagrid("reload");
                                $("#ff").form("clear");
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