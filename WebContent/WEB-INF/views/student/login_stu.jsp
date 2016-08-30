<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript">
        function init() {
            var year = $("year");
            var month = $("month");
            var day = $("day");
            //var mvalue=$("month").value;//提到月份的值
            /////显示年////
            for (var i = 1990; i <= 2016; i++) {
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
    <title>学生意向报名</title>
    <script src="<%=path %>/scriptaculous/lib/prototype.js" type="text/javascript"></script>
    <script src="<%=path %>/scriptaculous/src/effects.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path %>/login_stu_css/validation.js"></script>
    <script type="text/javascript">
    </script>
    <link title="style" rel="stylesheet" href="<%=path %>/login_stu_css/style.css" type="text/css"/>
    <link title="style2" rel="alternate stylesheet" href="<%=path %>/login_stu_css/style2.css" type="text/css"/>
    <link title="style3" rel="alternate stylesheet" href="<%=path %>/login_stu_css/style3.css" type="text/css"/>
</head>
<body onload="init()">


<div class="form_content">
    <form id="test" action="<%=path %>/stu/yxadd" method="post">
        <fieldset>
            <legend>个人信息</legend>
            <div class="form-row">
                <div class="field-label"><label for="field1">姓名</label>:</div>
                <div class="field-widget"><input type="text" id="field1" name="studentyx.intenname" class="required"
                                                 title="Enter your name"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field2">民族</label>:</div>
                <div class="field-widget"><input type="text" id="field2" name="studentyx.intenmz" class="required"
                                                 title="Enter your name"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label>性别</label>:</div>
                <div class="field-widget">
                    <input type="radio" checked="checked" name="studentyx.intensex" value="男"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="studentyx.intensex" value="女"/>女
                </div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field3">籍贯</label>:</div>
                <div class="field-widget"><input type="text" id="field3" name="studentyx.intenjg" class="required"
                                                 title="Enter your name"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field4">毕业学校</label>:</div>
                <div class="field-widget"><input type="text" id="field4" name="studentyx.intensch" class="required"
                                                 title="Enter your name"/></div>
            </div>


            <div class="form-row">
                <div class="field-label"><label for="field5">年龄</label>:</div>
                <div class="field-widget"><input type="text" id="field5" name="studentyx.intenage" class="required"
                                                 title="Enter your name"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field6">家长姓名</label>:</div>
                <div class="field-widget"><input type="text" id="field6" name="studentyx.intenfat" class="required"
                                                 title="Enter your name"/></div>
            </div>

            <div class="form-row">
                <div class="field-label"><label>出生年月</label>:</div>
                <div class="field-widget">
                    <select id="year" name="year"></select>年 <select id="month" name="month"
                                                                     onchange="changeDay()"></select>月<select name="day"
                                                                                                              id="day"></select>日
                </div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field7">学生电话</label>:</div>
                <div class="field-widget"><input type="text" name="studentyx.intentel" id="field7" class="required"
                                                 title="Enter a password greater than 6 characters"/></div>
            </div>


            <div class="form-row">
                <div class="field-label"><label for="field8">家长电话</label>:</div>
                <div class="field-widget">
                    <input type="text" name="studentyx.intenfatel" id="field8" class="required"
                           title="Enter your name"/>
                </div>
            </div>

            <div class="form-row">
                <div class="field-label"><label for="field9">家庭住址</label>:</div>
                <div class="field-widget">
                    <input type="text" name="studentyx.intenaddr" id="field9" class="required" title="Enter your name"/>
                </div>
            </div>


            <!-- <div class="form-row-select">
                <fieldset>
                    <legend class="optional">爱好</legend>
                    <label class="left">
                        <input type="checkbox" class="radio_input" name="field11" id="field11-male" value="1" />唱歌 <br />
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>跳舞<br />
                    </label>
                    <label class="left">
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>看书<br />
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>打游戏<br />
                    </label>
                    <label class="left">
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>打球<br />
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>健身<br />
                    </label>
                    <label class="left">
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>听音乐<br />
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>看电影<br />
                    </label>
                    <label class="left">
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>睡觉<br />
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>吃零食<br />
                    </label>
                    <label class="left">
                        <input type="checkbox" class="radio_input" name="field11" id="field11-male" value="1" />敲代码 <br />
                        <input type="checkbox" class="radio_input" name="field11" id="field11-female" value="2"/>其他<br />
                    </label> 
                </fieldset> 
            </div> -->
            <div class="form-row">
                <div class="field-label"><label for="field10">就读疑问</label>:</div>
                <div class="field-widget"><textarea id="field10" name="studentyx.intenpeo" class="required"></textarea>
                </div>
            </div>

        </fieldset>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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