<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .left {
            margin: 0 auto;
            width: 300px;
        }
    </style>
</head>
<body>
<div class="left">
    <form action="<%=path %>" method="post">
        提交成功！！！<br/>
        十秒后跳转到登入页面......<br/>
        <%-- <%response.setHeader("Refresh", "10;URL="+path); %> --%>
        <a href="<%=path %>">跳转</a>
    </form>
</div>
</body>
</html>