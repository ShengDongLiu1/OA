<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>意向学生管理</title>
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
	<table id="list" class="easyui-datagrid" toolbar="#tb"
		data-options="
		url:'<%=path%>/stu/yx-queryAllyx', 
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
				<th data-options="field:'intenname',width:80" align="center">名称</th>
				<th data-options="field:'intensch',width:100" align="center">就读学校</th>
				<th data-options="field:'intensex',width:50" align="center">性别</th>
       			<th data-options="field:'intenage',width:50" align="center">年龄</th>
				<th data-options="field:'intenbir',width:100" align="center">出生年月</th>
				<th data-options="field:'intenmz',width:60" align="center">民族</th>
				<th data-options="field:'intenjg',width:100" align="center">籍贯</th>
				<th data-options="field:'intentel',width:100" align="center">学生号码</th>
				<th data-options="field:'intenfat',width:80" align="center">家长姓名</th>
				<th data-options="field:'intenfatel',width:100" align="center">学生家长号码</th>
				<th data-options="field:'intenaddr',width:100" align="center">家庭住址</th>
				<th data-options="field:'intenpeo',width:150" align="center">就读疑问</th>
			</tr>
		</thead>
	</table>
	<!-- 菜单 -->
	<div id="tb" style="padding: 2px;">
		<a href="javascript:(0);" class="easyui-linkbutton"
			onclick="addStu();" data-options="iconCls:'icon-add'">添加到预定学生</a>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addOpen();">添加意向学生</a>
	</div>


	<div id="addWin" class="easyui-window" title="添加到预向学生"
	     data-options="iconCls:'icon-edit', closable:true, closed:true"
	     style="width: 300px; height: 300px; padding: 5px;">
	    <form id="stu" enctype="multipart/form-data">
	    	<input type="hidden" name="studentyx.intenid" id="sid" />
			<input type="hidden" name="studentyx.intenname" id="name"/>
			<input type="hidden" name="studentyx.intensch" id="sch"/>
			<input type="hidden" name="studentyx.intensex" id="sex"/>
			<input type="hidden" name="studentyx.intenage" id="age"/>
			<input type="hidden" name="studentyx.intenjg" id="jg"/>
			<input type="hidden" name="studentyx.intenmz" id="mz"/>
			<input type="hidden" name="studentyx.intenbir" id="bir"/>
			<input type="hidden" name="studentyx.intenfat" id="fat"/>
			<input type="hidden" name="studentyx.intentel" id="tel"/>
			<input type="hidden" name="studentyx.intenfatel" id="fatel"/>
			<input type="hidden" name="studentyx.intenaddr" id="addr"/>
			<input type="hidden" name="studentyx.intenpeo" id="peo"/>
	    	<input type="hidden" name="student.status.zid" id="zid" />
	        <table>
	            <tr>
	                <td>选择班级:</td>
	                <td><br/>
	                    <input class="easyui-combobox" data-options="required:true" id="cid" name="student.classes.classid"/><br/><br/>
	                </td>
	            </tr>
	            <tr>
	                <td>选择宿舍:</td>
	                <td><br>
	                    <input class="easyui-combobox" data-options="required:true" id="hid"
	                           name="student.hourse.hourid"/><br/><br/>
	                </td>
	            </tr>
	        </table>
	        <div data-options="region:'south',border:false" style="text-align:right;padding:30px 30px 0;">
	            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="addS();"
	               style="width:80px;height:20px;">添加</a>
	            <a href="javascript:(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWin').dialog('close')"
	               style="width:80px;height:20px;">取消</a>
	        </div>
	    </form>
	</div>

	<div id="addWindow" class="easyui-window" title="添加"
		data-options="closed:true,iconCls:'icon-add'" style="padding: 10px;" >
		<div style="padding:10px 60px 20px 60px">
        <form id="ff" class="easyui-form"  method="post" data-options="novalidate:true">
            <table>
             <tr>
                <td>学生姓名:</td>
                <td><input class="easyui-textbox" name="studentyx.intenname" required="true" style="width: 150px;"
                           data-options="validType:'length[2,6]'"/></td>
            </tr>
               	<tr>
                    <td>毕业学校:</td>
                    <td><input class="easyui-textbox"  name="studentyx.intensch" data-options="required:true,validType:'length[4,10]'"/>
                    </td>
                </tr>
                <tr>
                    <td>学生性别:</td>
                    <td>
                        <label>男</label>
                        <input type="radio"  name="studentyx.intensex" value="男" checked="checked"/>
                        <label>女</label>
                        <input type="radio"  name="studentyx.intensex" value="女"/>
                    </td>
                </tr>
                <tr>
                <td>民族:</td>
                <td>
                    <select class="easyui-combobox"  style="width: 150px;" name="studentyx.intenmz" data-options="required:true">
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
                    <td><input class="easyui-textbox" name="studentyx.intenjg" data-options="required:true,validType:'length[2,10]'"/></td>
                </tr>
                <tr>
                    <td>出生年月:</td>
                    <td><input class="easyui-datebox" value="1990-01-01" id="intenbir" name="studentyx.intenbir"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>家长姓名:</td>
                    <td><input class="easyui-textbox" name="studentyx.intenfat" data-options="required:true,validType:'length[2,6]'"/></td>
                </tr>
                <tr>
                    <td>学生号码:</td>
                    <td><input class="easyui-numberbox easyui-textbox" name="studentyx.intentel" data-options="required:true,validType:'length[11,11]'"/></td>
                </tr>
                <tr>
                    <td>学生家长号码:</td>
                    <td><input class="easyui-textbox easyui-numberbox" name="studentyx.intenfatel" data-options="required:true,validType:'length[11,11]'"/></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox" name="studentyx.intenaddr" data-options="required:true,validType:'length[2,10]'"/></td>
                </tr>
                <tr>
                    <td>就读疑问:</td>
                    <td><input class="easyui-textbox" name="studentyx.intenpeo" style="width: 200px; height: 100px;"
                                 data-options="multiline:true,required:true"/></td>
                </tr>
            </table>
				<div data-options="region:'south',border:false"
					style="text-align: right; padding: 5px 0 0;">
					<a href="javascript:(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'" onclick="add();"
						style="width: 80px">添加</a> <a href="javascript:(0);"
						class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="$('#addWindow').dialog('close')" style="width: 80px">取消</a>
           	 </div>
        </form>
    </div>
    </div>

	<script type="text/javascript">
		$(function() {
			setPagination("list");
		});
		// 显示数据
		function setPagination(tableId) {
			var p = $("#" + tableId).datagrid("getPager"); // 获取由tableId指定的datagrid控件的分页组件
			$(p).pagination({
				pageList : [20, 30, 40],
				beforePageText : "第",
				afterPageText : "页    共{pages}页",
				displayMsg : "当前显示{from} - {to} 条记录    共{total}条记录",
				onBeforeRefresh : function() {
					$(this).pagination("loading");
					$(this).pagination("loaded");
				}
			});
		}
		
		// 打开添加窗口
		function addStu() {
	        var row = $("#list").datagrid("getSelected");
	        if(row){
	            $("#addWin").window("open");
	            $("#cid").combobox({
	                url: "<%=path%>/stu/classes",
	                method: 'get',
	                valueField: 'id',
	                textField: 'name',
	                panelHeight: 'auto',
	                onLoadSuccess: function () { //数据加载完毕事件
	                    var data = $('#cid').combobox('getData');
	                    if (data.length > 0) {
	                        $("#cid").combobox('select', data[0].id);
	                    }
	                }
	            });
	            $("#hid").combobox({
	                url: "<%=path%>/stu/hourse",
	                method: 'get',
	                valueField: 'id',
	                textField: 'name',
	                panelHeight: 'auto',
	                onLoadSuccess: function () { //数据加载完毕事件
	                    var data = $('#hid').combobox('getData');
	                    if (data.length > 0) {
	                        $("#hid").combobox('select', data[0].id);
	                    }
	                }
	            });
	            document.getElementById("zid").value = 9;
	            document.getElementById("sid").value = row.intenid;
	            document.getElementById("name").value = row.intenname;
	            document.getElementById("sch").value = row.intensch;
	            document.getElementById("sex").value = row.intensex;
	            document.getElementById("age").value = row.intenage;
	            document.getElementById("jg").value = row.intenjg;
	            document.getElementById("mz").value = row.intenmz;
	            document.getElementById("bir").value = row.intenbir;
	            document.getElementById("fat").value = row.intenfat;
	            document.getElementById("tel").value = row.intentel;
	            document.getElementById("fatel").value = row.intenfatel;
	            document.getElementById("addr").value = row.intenaddr;
	            document.getElementById("peo").value = row.intenpeo;
		    } else {
			        $.messager.alert('提示', '请选中学生', 'info');// messager消息控件
		    }
		}
		// 添加(提交後臺)
		function addS() {
			if ($("#stu").form("validate")) {
				$.get('stu/deleteyx', $("#stu").serialize(), function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info",
								function() {
									$("#addWin").window("close");
									$("#list").datagrid("reload");
									$("#stu").form("clear");
								});
					} else {
						$.messger.alert("提示", data.msg, "info");
					}
				}, "JSON");
			}
			$("#list").datagrid('reload');
		}
		// 打开添加窗口
		function addOpen() {
			$("#addWindow").window("open");
		}
		// 添加(提交後臺)
		function add() {
	    	toValidate("ff");
			if (validateForm("ff")) {
				$.get('stu/yx-add', $("#ff").serialize(),
				function(data) {
					if (data.result.result == 'success') {
						$.messager.alert("提示", data.result.msg, "info",
								function() {
									$("#addWindow").window("close");
									$("#list").datagrid("reload");
									$("#ff").form("clear");
								});
					} else {
						$.messger.alert("提示", data.msg, "info");
					}
				}, "JSON");
			}
		}
	</script>
</body>
</html>