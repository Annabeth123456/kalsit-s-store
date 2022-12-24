<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="log_reg.css">
</head>
<style>

</style>
<body>
<%--根目录：/E_commerce_web_war_exploded--%>
<% String path = request.getContextPath();%>
<div class="main">
    <div class="header">
        <img class="logo" src="../image/logo.png">
        <!-- <h1>这是header</h1> -->
        <div class="log_reg_header">
            <span class="sep"></span>
            <a href="#">用户协议   </a>
            <span class="sep"></span>
            <a href="#">隐私政策   </a>
            <span class="sep"></span>
            <a href="#">帮助中心   </a>
        </div>
    </div>


    <div class="container">
        <div class="box">
<%--            //${pageContext.request.contextPath}/login--%>
<%--    LoginServlet--%>
            <form action="<%=path%>/LoginServlet" method="post" id="form_login">
                <div class="d1">
                    <td>
                        <input type = "text" name="username" placeholder="用户名称"/><br/>
                    </td>
                </div>
                <div class="d2">
                    <td>
                        <input type="password" name="password" placeholder="密码"/><br/>
                    </td>
                </div>

                <div class="re_sure">

                    <a href="javascript:document:form_login.submit();">登录</a>
                    <!-- 设置提交函数进行事件提交
                    document.form1.submit(); -->
                </div>
            </form>

        </div>
    </div>

</div>
</body>
</html>

