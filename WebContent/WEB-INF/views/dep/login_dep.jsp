<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/mobile.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<head>
    <script type="text/javascript">
        function init() {
            var year = $("year");
            var month = $("month");
            var day = $("day");
            //var mvalue=$("month").value;//提到月份的值
            /////显示年////
            for (var i = 1900; i <= 2016; i++) {
                var op = new Option(i, i);
                year.options.add(op);
            }
            ////显示月////////////
            for (var i = 1; i <= 12; i++) {
                var op = new Option(i, i);
                month.options.add(op);
            }
            for (var i = 1; i <= 31; i++) {
                var op = new Option(i, i);
                day.options.add(op);
            }
        }
        function changeDay() {
            var day = $("day");
            var mvalue = $("month").value;//提到月份的值
            var arr1 = new Array("4", "6", "9", "11");
            var arr2 = new Array("1", "3", "5", "7", "8", "10", "12");
            ////循环数组看是否用户选择的值，
            ///////30天
            for (var i = 0; i < arr1.length; i++) {
                if (mvalue == arr1[i]) {
                    day.options.length = 0;//清空值
                    for (var j = 1; j <= 30; j++) {
                        var op1 = new Option(j, j);
                        day.options.add(op1);
                    }
                }
            }
            ////////////31天///
            for (var i = 0; i < arr2.length; i++) {
                if (mvalue == arr2[i]) {
                    day.options.length = 0;//清空值
                    for (var j = 1; j <= 31; j++) {
                        var op1 = new Option(j, j);
                        day.options.add(op1);
                    }

                }
            }
            ///////////瑞年29天，平年28天
            if (mvalue == 2) {
                var yr = $("year").value;
                if (yr % 4 == 0 && yr0 != 0 || yr % 0 == 0) {
                    day.options.length = 0;//清空值
                    for (var j = 1; j <= 29; j++) {
                        var op1 = new Option(j, j);
                        day.options.add(op1);
                    }
                } else {
                    day.options.length = 0;//清空值
                    for (var j = 1; j <= 28; j++) {
                        var op1 = new Option(j, j);
                        day.options.add(op1);
                    }
                }
            }
        }
        function $(str) {
            return document.getElementByIdx_x(str);
        }
    </script>
    <title>员工资料</title>
    <script src="<%=path %>/js/scriptaculous/lib/prototype.js" type="text/javascript"></script>
    <script src="<%=path %>/js/scriptaculous/src/effects.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path %>/css/login_stu_css/validation.js"></script>
    <script type="text/javascript">
    </script>
    <link title="style" rel="stylesheet" href="<%=path %>/css/login_stu_css/style.css" type="text/css"/>
</head>
<body onload="init()">


<div class="form_content">
    <form id="test" action="<%=path %>/dep/add" method="post">
        <fieldset>
            <legend>员工信息</legend>
            <div class="form-row">
                <div class="field-label"><label for="field1">员工姓名</label>:</div>
                <div class="field-widget"><input type="text" id="field1" name="dep.ename" class="required"
                                                 title="填写您的姓名"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label>员工性别</label>:</div>
                <div class="field-widget">
                    <input type="radio" checked="checked" name="dep.esex" value="男"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="dep.esex" value="女"/>女
                </div>
            </div>

            <div class="form-row">
                <div class="field-label"><label>出生年月</label>:</div>
                <div class="field-widget">
                    <select id="year"></select>年 <select id="month" onchange="changeDay()"></select>月<select
                        id="day"></select>日
                </div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field3">电话号码</label>:</div>
                <div class="field-widget"><input type="text" id="field3" name="dep.enumber" class="required"
                                                 title="输入二代身份证"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field3">身份证号</label>:</div>
                <div class="field-widget"><input type="text" id="field3" name="dep.ecertid" class="required"
                                                 title="输入二代身份证"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field4">员工籍贯</label>:</div>
                <div class="field-widget"><input type="text" id="field4" name="dep.ecity" class="required"
                                                 title="填写您的籍贯"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field5">民族</label>:</div>
                <div class="field-widget"><input type="text" id="field5" name="dep.eanton" class="required"
                                                 title="填写您的种族"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field7">家庭住址</label>:</div>
                <div class="field-widget"><input type="text" name="dep.eaddr" id="field7" class="required"
                                                 title="填写您的住址"/></div>
            </div>

            <div class="form-row-select">
                <fieldset>
                    <legend class="optional">学历</legend>
                    <label class="left">
                        <input type="radio" class="radio_input" name="dep.edu" id="field11-male" value="高中"/>高中 <br/>
                    </label>
                    <label class="left">
                        <input type="radio" class="radio_input" name="dep.edu" id="field11-male" value="中专"/>中专 <br/>
                    </label>
                    <label class="left">
                        <input type="radio" class="radio_input" name="dep.edu" id="field11-male" value="大学"/>大学 <br/>
                    </label>
                    <label class="left">
                        <input type="radio" class="radio_input" name="dep.edu" id="field11-female" value="本科"/>本科<br/>
                    </label>
                    <label class="left">
                        <input type="radio" class="radio_input" name="dep.edu" id="field11-female" value="硕士"/>硕士<br/>
                    </label>
                    <label class="left">
                        <input type="radio" class="radio_input" name="dep.edu" id="field11-female" value="博士"/>博士<br/>
                    </label>
                </fieldset>
            </div>

            <div class="form-row">
                <fieldset>
                    <legend>工作经历</legend>
                    <div class="form-row">
                        <div class="field-label"><label for="field4">公司名称</label>:</div>
                        <div class="field-widget"><input type="text" id="field4" name="jobs.jstart" class="required"
                                                         title="填写公司名称"/></div>
                    </div>
                    <div class="form-row">
                        <div class="field-label"><label for="field5">公司职位</label>:</div>
                        <div class="field-widget"><input type="text" id="field5" name="jobs.jedu" class="required"
                                                         title="填写公司职位"/></div>
                    </div>

                    <div class="form-row">
                        <div class="field-label"><label for="field7">开始时间</label>:</div>
                        <div class="field-widget"><input class="easyui-datetimebox" type="text" name="jobs.jend"
                                                         id="field7" class="required" title="填写开始时间"/></div>
                    </div>
                    <div class="form-row">
                        <div class="field-label"><label for="field7">结束时间</label>:</div>
                        <div class="field-widget"><input class="easyui-datetimebox" type="text" name="jobs.jcompany"
                                                         id="field7" class="required" title="填写结束时间"/></div>
                    </div>
                    <div class="form-row">
                        <div class="field-label"><label for="field7">证明人</label>:</div>
                        <div class="field-widget"><input type="text" name="jobs.jpeople" id="field7" class="required"
                                                         title="填写证明人"/></div>
                    </div>
                    <div class="form-row">
                        <div class="field-label"><label for="field7">证明人电话</label>:</div>
                        <div class="field-widget"><input type="text" name="jobs.jtel" id="field7" class="required"
                                                         title="填写证明人电话"/></div>
                    </div>
                </fieldset>
            </div>

        </fieldset>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
        <input type="reset" type="button" value="重置"/>
        <input type="submit" class="submit" value="确认"/>
    </form>
</div>

<script type="text/javascript">
    function formCallback(result, form) {
        window.status = "valiation callback for form '" + form.id + "': result = " + result;
    }

    var valid = new Validation('test', {immediate: true, onFormValidate: formCallback});

</script>

</body>
</html>