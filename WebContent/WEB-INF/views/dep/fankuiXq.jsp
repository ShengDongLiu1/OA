<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
        .textS {
            width: 500px;
            margin-left: 40px;
        }

        #wordtext {
            display: inline-block;
            padding: 6px 12px;
            font-size: 12px;
            font-weight: 300;
            line-height: 1.4;
            color: #221919;
            background: #fff;
            border: 1px solid #a4a2a2;
            resize: none;

            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            -webkit-box-sizing: border-box;

            border-radius: 6px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;

            box-shadow: inset 0 1px rgba(34, 25, 25, .15), 0 1px rgba(255, 255, 255, .8);
            -moz-box-shadow: inset 0 1px rgba(34, 25, 25, .15), 0 1px rgba(255, 255, 255, .8);
            -webkit-box-shadow: inset 0 1px rgba(34, 25, 25, .15), 0 1px rgba(255, 255, 255, .8);

            -webkit-transition: all .08s ease-in-out;
            -moz-transition: all .08s ease-in-out;

            min-height: 90px;
        }

        #wordtext:focus {
            border-color: #006499;
            box-shadow: 0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
            -moz-box-shadow: 0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
            -webkit-box-shadow: 0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
        }

        #wordage {
            text-align: right;
            font-size: 14px;
            color: #5e5e5e;
            margin: 10px 0 0 0;
            margin-right: 50px;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>反馈详情</title>
</head>
<body>
<div class="easyui-navpanel">
    <div style="margin:20px 0 10px 0;"></div>
    <div id="content" class="easyui-panel" style="width:711px;height:620px;"
         data-options="headerCls:'bt'">
        <header>
            <div class="m-toolbar">
                <div class="m-left" style="margin-left: 60px;">
                    <a href="<%=path %>/fankui/all" class="easyui-linkbutton m-back"
                       data-options="plain:true,outline:true,back:true">返回列表</a>
                </div>
                <div style="width: 670px;"><h1>反馈详情</h1></div>
            </div>
        </header>
        <div style="padding:10px;margin-left: 50px;margin-top: 50px;">
            <s:hidden name="fankui.tbackid"></s:hidden>
            <s:hidden name="fankui.dep.eid"></s:hidden>
            <s:hidden name="fankui.title"></s:hidden>
            <s:hidden name="fankui.pro"></s:hidden>
            <s:hidden name="fankui.time"></s:hidden>
            <h3>反馈编号:</h3>
            <div class="textS"><s:property value="fankui.tbackid"/></div>
            <br/><br/>
            <h3>反馈标题:</h3>
            <div class="textS"><s:property value="fankui.title"/></div>
            <br/><br/>
            <h3>反馈问题:</h3>
            <div class="textS"><s:property value="fankui.pro"/></div>
            <br/><br/>
            <h3>反馈答案:</h3>
            <div class="textS"><s:property value="fankui.ans"/></div>
            <br/><br/>
            <h3>反馈时间:</h3>
            <div class="textS"><s:date name="fankui.time" format="yyyy-MM-dd HH:mm:ss"/></div>
        </div>
        <div style="margin-right: 100px; float:right;">
            <a href="javascript:;" onclick="addPro();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
               style="height:32px;">反馈回复</a>
        </div>
    </div>
</div>
<div id="addWin" class="easyui-window" title="反馈回复" data-options="iconCls:'icon-edit', closable:true, closed:true"
     style="width: 400px; height: 300px; padding: 5px;">
    <form id="addForm">
        <input type="hidden" id="tbackid" name="fankui.tbackid"/>
        <input type="hidden" id="title" name="fankui.title"/>
        <input type="hidden" id="pro" name="fankui.pro"/>
        <input type="hidden" id="eid" name="fankui.dep.eid"/>
        <input type="hidden" id="time" name="fankui.time"/>
        <div style="margin-bottom: 20px;margin-left: 40px;margin-top: 10px;">
            <div>回复问题:</div>
            <br/>
            <textarea id="wordtext" name="fankui.ans" style="width:300px;height:120px;"></textarea>
            <div id="wordage"></div>
        </div>
        <div style="margin-left: 170px;float: left;">
            <a href="javascript:;" onclick="closeAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
               style="height:32px;float: left;">取消提交</a>
        </div>
        <div style="margin-left: 20px;float: left;">
            <a href="javascript:;" onclick="doAdd();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
               style="height:32px;">提交问题</a>
        </div>
    </form>
</div>
<script type="text/javascript">
    //打开回复反馈
    function addPro() {
        var fid = document.getElementsByName("fankui.tbackid")[0].value;
        var title = document.getElementsByName("fankui.title")[0].value;
        var pro = document.getElementsByName("fankui.pro")[0].value;
        var eid = document.getElementsByName("fankui.dep.eid")[0].value;
        var time = document.getElementsByName("fankui.time")[0].value;
        document.getElementById("tbackid").value = fid;
        document.getElementById("title").value = title;
        document.getElementById("pro").value = pro;
        document.getElementById("eid").value = eid;
        document.getElementById("time").value = time;
        //文本框字数提示
        var limitNum = 300;
        var pattern = '还可以输入' + limitNum + '字';
        $('#wordage').html(pattern);
        $("#wordtext").keyup(function () {
            var remain = $(this).val().length;
            if (remain > 300) {
                pattern = "字数超过300个限制！请重新输入！";
            } else {
                var result = limitNum - remain;
                pattern = '还可以输入' + result + '字';
            }
            $("#wordage").html(pattern);
        });
        $("#addWin").window("open");
        $("#addWin").window("open");
    }

    function trim(str) { //删除左右两端的空格
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }

    function doAdd() {
        var wordtext = document.getElementsByName("fankui.ans")[0].value;
        if (trim(wordtext) == "") {
            alert("您输入的回复不能为空，请重新输入！")
            return;
        } else if (wordtext.length > 300) {
            alert("您输入的回复不得超过300字，请重新输入！")
            return;
        }

        if ($("#addForm").form("validate")) { // 验证整个表单里的所有validatabox是否通过验证
            $.post(
                    "<%=path%>/fankui/update",
                    $("#addForm").serialize(), // 直接把表单数据序列化成服务端可以接收的数据格式
                    function (data) {
                        if (data.result.result == 'success') {
                            $.messager.alert("提示", data.result.msg, "info", function () {
                                $("#addWin").window("close");
                                $("#addForm").form("clear");
                                window.location.reload();
                            });
                        } else {
                            $.messger.alert("提示", data.msg, "info");
                        }
                    }, 'json')
        }
    }

    function closeAdd() {
        $("#addWin").window("close");
        $("#addForm").form("clear");
    }
</script>
</body>
</html>