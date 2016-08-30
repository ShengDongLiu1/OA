<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath(); %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/mobile.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<head>
<style type="text/css">
	.textS{
		width: 500px;
		margin-left: 20px;
		float: left;
		width: 550px;
		height: 45px;
		margin-top: 15px;
	}
	.zl{
		width: 100px;
		float: left;
	}
</style>
<script type="text/javascript">
	//打开修改员工工作信息
	function edit() {
		var jeid=document.getElementsByName("jobs.dep.eid")[0].value;
		var jcompany=document.getElementsByName("jobs.jstart")[0].value;
		var jedu=document.getElementsByName("jobs.jedu")[0].value;
		var jpeople=document.getElementsByName("jobs.jpeople")[0].value;
		var jtel=document.getElementsByName("jobs.jtel")[0].value;
		var kssj=document.getElementsByName("jobs.jend")[0].value;
		var jssj=document.getElementsByName("jobs.jcompany")[0].value;
		document.getElementById("gsid").value = jeid;
		$("#gsmc").textbox("setValue",jcompany);
		$("#gszw").textbox('setValue', jedu);
		$("#kssj").datetimebox('setValue', kssj);
		$("#jssj").datetimebox('setValue', jssj);
		$("#zmr").textbox("setValue", jpeople);
		$("#zmrdh").textbox('setValue', jtel);
		$("#editWin").window("open");
	}
	
	function closeEdit(){
		$("#editWin").window("close");
		$("#editForm").form("clear");
	}
	function doEdit() {
		if ($("#editWin").form("validate")) {
			$.post("jobs/update", $("#editForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
			function(data) {
				if (data.result.result == 'success') {
					$.messager.alert("提示", data.result.msg, "info", function() {
						$("#editWin").window("close");
						window.location.reload();
					});
				} else {
					$.messger.alert("提示", data.result.msg + " 请稍候再试", "info");
				}
			});
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工工作经历</title>
</head>
<body>
	<div id="p2" class="easyui-navpanel">
		<div id="content" class="easyui-panel" style="width:811px;height:630px;" 
	   	 data-options="headerCls:'bt'">
			<header>
				<div class="m-toolbar">
					<div class="m-left" style="margin-left: 60px;">
						<a href="<%=path %>/dep/all" class="easyui-linkbutton m-back" data-options="plain:true,outline:true,back:true">返回列表</a>
					</div>
					<div><h2>员工工作经历</h2></div>
				</div>
			</header>
			<div style="padding:10px;margin-left: 50px;margin-top: 50px; ">
				<s:hidden name="jobs.dep.eid"></s:hidden>
				<s:hidden name="jobs.jstart"></s:hidden>
				<s:hidden name="jobs.jedu"></s:hidden>
				<s:hidden name="jobs.jend"></s:hidden>
				<s:hidden name="jobs.jcompany"></s:hidden>
				<s:hidden name="jobs.jpeople"></s:hidden>
				<s:hidden name="jobs.jtel"></s:hidden>
				<div class="zl"><h3>员工姓名:</h3></div><div class="textS"><s:property value="jobs.dep.ename"/></div><br/><br/>
				<div class="zl"><h3>公司名称:</h3></div><div class="textS"><s:property value="jobs.jstart"/></div><br/><br/>
				<div class="zl"><h3>公司职位:</h3></div><div class="textS"><s:property value="jobs.jedu"/></div><br/><br/>
				<div class="zl"><h3>开始时间:</h3></div><div class="textS"><s:property value="jobs.jend"/></div><br/><br/>
				<div class="zl"><h3>结束时间:</h3></div><div class="textS"><s:property value="jobs.jcompany"/></div><br/><br/>
				<div class="zl"><h3>证明人:</h3></div><div class="textS"><s:property value="jobs.jpeople"/></div><br/><br/>
				<div class="zl"><h3>证明人电话:</h3></div><div class="textS"><s:property value="jobs.jtel"/></div><br/><br/>
				<div style="float: right;margin-right: 50px;"><a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="edit();">修改信息</a></div>
			</div>
		 </div>
	</div>
	<div id="editWin" class="easyui-window" title="修改员工工作信息"  data-options="iconCls:'icon-edit', closable:true, closed:true"  style="width: 400px; height: 550px; padding: 5px;">
		<form id="editForm" enctype="multipart/form-data">
			<s:hidden id="gsid" name="jobs.eid"></s:hidden>
			<div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
				<div>公司名称:</div><br/>
				<input class="easyui-textbox" id="gsmc" data-options="required:true" name="jobs.jstart" style="width:300px;height:25px">
			</div>
			<div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
				<div>公司职位:</div><br/>
				<input class="easyui-textbox" id="gszw" data-options="required:true"name="jobs.jedu" style="width:300px;height:25px">
			</div>
			<div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
				<div>开始时间:</div><br/>
				<input class="easyui-datetimebox" id="kssj" data-options="required:true" name="jobs.jend" style="width:300px;height:25px">
			</div>
			<div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
				<div>结束时间:</div><br/>
				<input class="easyui-datetimebox" id="jssj" data-options="required:true" name="jobs.jcompany" style="width:300px;height:25px">
			</div>
			<div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
				<div>证明人:</div><br/>
				<input class="easyui-textbox" id="zmr" data-options="required:true" name="jobs.jpeople" style="width:300px;height:25px">
			</div>
			<div style="margin-bottom:20px;margin-left: 40px;margin-top: 10px;">
				<div>证明人电话:</div><br/>
				<input class="easyui-textbox" id="zmrdh" data-options="required:true" name="jobs.jtel" style="width:300px;height:25px">
			</div>
			<div style="margin-left: 170px;float: left;">
				<a href="javascript:;" onclick="closeEdit();"  class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="height:32px;float: left;">取消修改</a>
			</div>
			<div style="margin-left: 20px;float: left;">
				<a href="javascript:;" onclick="doEdit();"  class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="height:32px;">确认修改</a>
			</div>
		</form>
	</div>
</body>
</html>