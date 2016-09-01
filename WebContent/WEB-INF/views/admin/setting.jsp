<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人设置</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body>
<div id="editWindow" class="easyui-window" title="更新密码" data-options="closed:false,iconCls:'icon-edit'"
     style="padding:10px;">
    <div style="padding:10px 30px 20px 30px">
        <form id="updateForm" method="post">
            <table class="input_big">
                <caption>修改账号密码</caption>
                <tr>
                    <td>新密码:</td>
                    <td><input type="password" name="newPwd" class="easyui-validatebox easyui-textbox"
                               data-options="required:true,validType:'length[6,20]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td>确认密码:</td>
                    <td><input type="password" name="conPwd" class="easyui-validatebox easyui-textbox"
                               data-options="required:true,validType:'length[6,20]',novalidate:true"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button type="button" onclick="updatePwd();">确认</button>
                    </td>
                </tr>
            </table>
        </form>
        <div id="errMsg"></div>
    </div>
</div>
<!------------------------------------------------------------------------------->
<script type="text/javascript">
    function updatePwd() {
        toValidate("updateForm");
        if (validateForm("updateForm")) {
            $.post('update_pwd',
                    $("#updateForm").serialize(),
                    function (data) {
                        if (data.result.result == "success") {
                            $.messager.alert("提示", data.result.msg, "info");
                            $("#updateForm").form("clear");
                            $('#editWindow').dialog('close');
                        } else {
                            $("#errMsg").html(data.result.msg);
                        }
                    }, "JSON"
            );
        }
    }
</script>
</body>
</html>