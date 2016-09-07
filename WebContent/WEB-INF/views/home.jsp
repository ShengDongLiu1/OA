<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宏图办公系统</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" class="north" style="height:72px">

    <img class="main_logo" style="width:270px;height:70px" src="<%=path %>/images/T_image/logo.gif"/>

    <div class="north wel_msg">
        欢迎您:&nbsp;&nbsp;<b>${sessionScope.user.dep.getEname()    }</b>&nbsp;&nbsp;
        <a href="javascript:void(0);" id="update" onclick="update();">刷新打开的页面</a>&nbsp;&nbsp;
        <a href="<%=path %>/login">安全退出</a>
    </div>
</div>
<div data-options="region:'west',split:true,title:'功能菜单'" class="west">
    <div class="easyui-accordion" data-options="border:false">
        <%
            /*
            1-任课教师
            2-辅导老师
            3-班主任
            4-招生老师
            5-教务主任
            6-后勤主任
            7-助理
            8-意向学生
            9-预定学生
            10-正式学员
            11-超级管理员
            12-财务主任
            */
        %>
        <div title="日常办公" data-options="iconCls:'icon-edit'" class="site_menu">
            <p><a href="javascript:void(0);" src="<%=path %>/user/getSet" class="site-navi-tab">修改密码</a></p>
                    
            <c:choose>
                <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 7}">
                    <p><a href="javascript:void(0);" src="<%=path %>/duty/all" class="site-navi-tab">巡查</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/msg/all" class="site-navi-tab">发布公告</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/work/all" class="site-navi-tab">办公用品</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/apply/all" class="site-navi-tab">申购审批</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/receiue/all" class="site-navi-tab">申领审批</a></p>
                </c:when>
                <c:when test="${sessionScope.user.statuss.getZid() eq 6}">
                    <p><a href="javascript:void(0);" src="<%=path %>/work/all" class="site-navi-tab">办公用品</a></p>
                	<p><a href="javascript:void(0);" src="<%=path %>/apply/all" class="site-navi-tab">物品购买</a></p>
                	<p><a href="javascript:void(0);" src="<%=path %>/apply/all" class="site-navi-tab">物品发放</a></p>
                </c:when>
                <c:otherwise>
           			<p><a href="javascript:void(0);" src="<%=path %>/receiue/all" class="site-navi-tab">物品申领</a></p>
                	<p><a href="javascript:void(0);" src="<%=path %>/apply/all" class="site-navi-tab">物品申购</a></p>
                </c:otherwise>
            </c:choose>
        </div>
        <div title="招生管理" data-options="iconCls:'icon-edit'" class="site_menu">
            <c:choose>
                <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 4 || sessionScope.user.statuss.getZid() eq 7}">
                    <p><a href="javascript:void(0);" src="<%=path %>/stu/yx-allyx" class="site-navi-tab">意向学生</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/stu/all" class="site-navi-tab">预定学生</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/stu/all" class="site-navi-tab">正式学生</a></p>
                </c:when>
                <c:otherwise>
                    <span>权限不足!</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div title="教务管理" data-options="iconCls:'icon-edit'" class="site_menu">
            <c:choose>
                <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 1}">
                    <p><a href="javascript:void(0);" src="<%=path %>/course/all" class="site-navi-tab">课程</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/fankui/all" class="site-navi-tab">教员反馈</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/courseplan/all" class="site-navi-tab">课程进度</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/student/all" class="site-navi-tab">学生成绩</a></p>
                </c:when>
                <c:when test="${sessionScope.user.statuss.getZid() eq 2}">
                    <p><a href="javascript:void(0);" src="<%=path %>/fankui/all" class="site-navi-tab">教员反馈</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/student/all" class="site-navi-tab">学生成绩</a></p>
                </c:when>
                <c:when test="${sessionScope.user.statuss.getZid() eq 4}">
                    <p><a href="javascript:void(0);" src="<%=path %>/fankui/all" class="site-navi-tab">教员反馈</a></p>
                </c:when>
                <c:otherwise>
                    <span>权限不足!</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div title="学生管理" data-options="iconCls:'icon-edit'" class="site_menu">
            <c:choose>
                <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 3 || sessionScope.user.statuss.getZid() eq 7}">
                    <p><a href="javascript:void(0);" src="<%=path %>/classes/all" class="site-navi-tab">班级</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/hourse/all" class="site-navi-tab">宿舍</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/stu/all" class="site-navi-tab">查看学员</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/says/all" class="site-navi-tab">谈心记录</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/rawpun/all" class="site-navi-tab">奖惩情况</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/items/all" class="site-navi-tab">项目</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/getjob/all" class="site-navi-tab">就业情况</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/computer/all" class="site-navi-tab">电脑领用</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/stutotal/all" class="site-navi-tab">学生总结</a></p>
                </c:when>
                <c:when test="${sessionScope.user.statuss.getZid() eq 6}">
                    <p><a href="javascript:void(0);" src="<%=path %>/computer/all" class="site-navi-tab">电脑领用</a></p>
                </c:when>
                <c:otherwise>
                    <span>权限不足!</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div title="财务管理" data-options="iconCls:'icon-edit'" class="site_menu">
            <c:choose>
                <c:when test="${sessionScope.user.statuss.getZid() eq 11 || sessionScope.user.statuss.getZid() eq 7}">
                    <p><a href="javascript:void(0);" src="<%=path %>/money/all" class="site-navi-tab">收取学费</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/income/all" class="site-navi-tab">查看收入</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/expend/all" class="site-navi-tab">查看支出</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/pays/all" class="site-navi-tab">工资发放</a></p>
                </c:when>
                <c:otherwise>
                    <span>权限不足!</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div title="系统管理" data-options="iconCls:'icon-edit'" class="site_menu">
            <c:choose>
                <c:when test="${sessionScope.user.statuss.getZid() eq 7 || sessionScope.user.statuss.getZid() eq 11}">
                    <p><a href="javascript:void(0);" src="<%=path %>/department/all" class="site-navi-tab">部门</a></p>
                    <p><a href="javascript:void(0);" src="<%=path %>/dep/all" class="site-navi-tab">员工</a></p>
                </c:when>
                <c:otherwise>
                    <span>权限不足!</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<div id="mainPanle" data-options="region:'center',border:true">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,border:false">
        <div title="主页">
            <!-- -------------------------------主页内容------------------------------------------------------------------------------------- -->
            <!-- 考勤 -->
            <div style="height:20px;width:100%;"></div>
            <div style="width:300px;float:left;margin-left:50px;">
                <div style="height:25px;"></div>
                <!-- 日历 -->
                <div>
                    <div class="easyui-calendar" style="width:300px;height:350px;"></div>
                </div>
            </div>
          <!--   <div style="width:15%;height:100%;float:left;;margin-left:50px;">
                <div style="height:30%;"></div>
                <div style="width:100%;height:30%">
                    <input type="button" id="cd" style="width:100%; height:100%;border-radius:50%;color:white;background-color:#B4CDE6;
					border:0px;font-size:40px;" value="打&nbsp;卡" onclick='work()'/>
                </div>
            </div> -->
            
            <!-- 公告管理 -->
            <div class="easyui-navpanel" style="float:left;margin-left:15%;">
                <div id="content" class="easyui-panel" title="公告" style="width:450px;height:450px;"
                     data-options="iconCls:'icon-man',headerCls:'bt'"><br/>
                    <c:forEach items="${requestScope.Msgs }" var="MsgsList">
                        <div style="margin-left: 15px;float: left; "><span style=" font-size: 13px;">公告内容：</span></div>
                        <div style="margin-left: 25px;float: left;">
                            <p style="word-break:break-all;width:380px;">${MsgsList.getMsgcon() }</p>
                        </div>
                        <p style="clear:both;"></p>
                        <div style="margin-left: 15px;float: left; "><span style=" font-size: 13px;">发布时间：</span></div>
                        <div style="margin-left: 5px;float: left; ">
							<c:out value="${MsgsList.getMsgks() }"></c:out>
                        </div>
                        <p style="clear:both;"></p><br/>
                        <hr/>
                    </c:forEach>
                </div>
            </div>
            <!-- end -->

        </div>
    </div>
</div>
<script type="text/javascript">

    function work() {
        $.post('<%=path%>/workcheck/add', {'workcheck.status': '签到'},
                function (data) {
                    if (data.result.result == 'success') {
                        $.messager.alert("提示", data.result.msg, "info");
                    } else {
                        alert(data.result.msg)
                    }
                }, "JSON");
    }

</script>
<div data-options="region:'south',border:false" align="center">
    宏图软件办公OA系统V1.0&nbsp;&nbsp;技术支持:15春班OA项目4组
</div>

<div id="mm" class="easyui-menu">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseother">关闭其他</div>
    <div id="mm-tabcloseall">关闭全部</div>
</div>

<script type="text/javascript">
    function update() {
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        if (url != undefined && currTab.panel('options').title != homeTabTitle) {
            $('#tabs').tabs('update', {
                tab: currTab,
                options: {
                    content: createFrame(url)
                }
            })
        }
    }
</script>
</body>
</html>