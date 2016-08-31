<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>宏图办公系统</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
    <style type="text/css">
        <!--
        * {
            overflow: hidden;
            font-size: 9pt;
        }

        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-image: url(images/bg.gif);
            background-repeat: repeat-x;
        }

        -->
    </style>
</head>

<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="561" style="background:url(<%=path %>/T_image/lbg.gif)">
                        <table width="940" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="238" style="background:url(<%=path %>/T_image/login01.gif)">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="190">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="208" height="190"
                                                style="background:url(<%=path %>/T_image/login02.jpg)">&nbsp;</td>
                                            <td width="518" style="background:url(<%=path %>/T_image/login03.jpg)">
                                                <form id="sf" action="<%=path %>/user/query" method="post">
                                                    <table width="320" border="0" align="center" cellpadding="0"
                                                           cellspacing="0">
                                                        <tr>
                                                            <td width="40" height="50"><img
                                                                    src="<%=path %>/T_image/user.gif" width="30"
                                                                    height="30"></td>
                                                            <td width="38" height="50">用户</td>
                                                            <td width="242" height="50"><input type="text"
                                                                                               name="user.uname"
                                                                                               id="username"
                                                                                               style="width:164px; height:32px; line-height:34px; background:url(<%=path %>/images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; font-family:Verdana, Geneva, sans-serif;">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="50"><img src="<%=path %>/T_image/password.gif"
                                                                                 width="28" height="32"></td>
                                                            <td height="50">密码</td>
                                                            <td height="50"><input type="password" name="user.pwd" id="password"
                                                                                   style="width:164px; height:32px; line-height:34px; background:url(<%=path %>/images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; ">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="50"><img src="<%=path %>/T_image/login06.gif"
                                                                                 width="28" height="32"></td>
                                                            <td height="50">验证码</td>
                                                            <td height="50"><input type="text" name="checkCode" id="code"
                                                                                   style="width:164px; height:32px; line-height:34px; background:url(<%=path %>/images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; ">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td>
                                                                &nbsp;&nbsp;&nbsp;
                                                                <!--若要点击图片刷新，重新得到一个验证码，要在后面加上个随机数，这样保证每次提交过去的都是不一样的path，防止因为缓存而使图片不刷新-->
                                                                <img src="<%=path %>/yzm/createImageAction"
                                                                     onclick="this.src='<%=path %>/yzm/createImageAction.action?'+ Math.random()"
                                                                     title="点击图片刷新验证码"/><br>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="40">&nbsp;</td>
                                                            <td height="40">&nbsp;</td>
                                                            <td height="60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <input type="button" id="submit" value="登陆系统"
                                                                       style="background-image:url('<%=path %>/T_image/login.gif');border:0px;">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </form>
                                            </td>
                                            <td width="214" style="background:url(<%=path %>/T_image/login04.jpg)">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="133" style="background:url(<%=path %>/T_image/login05.jpg)">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">
	$(function () {
		$("#submit").click(function () {
			var username = $("#username");
			var password = $("#password");
			var code = $("#code");
			if(username.val() == ""){
				username.focus();
				return false;
			}
			if(password.val() == ""){
				password.focus();
				return false;
			}
			if(code.val() == "" || code.val() == null){
				code.focus();
				return false;
			}
			 $.post('<%=path%>/user/query', $("#sf").serialize(),
	                    function (data) {
	                        if (data.result.result == 'success') {
	                        	window.location.href = "<%=path %>/index";
	                        } else {
	                        	alert(data.result.msg)
	                        }
	                    }, "JSON");
		});
	});
</script>
</body>
</html>
