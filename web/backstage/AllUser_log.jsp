<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="Dao.UserDao"
         import="Dao.ProductDao"
         import="Dao.LogDao"
         import="domain.User"
         import="domain.Product"
         import="domain.Log"
         import="domain.Product"
         import="servlet.LoginServlet"
         import="servlet.LoginServlet"
%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="../client/log_reg.css">
<link rel="stylesheet" href="backstage.css">

<html>
<head>
    <title>所有用户浏览/购买查询</title>
</head>
<body>
<%--<%=request.getAttribute("username")%>--%>
<%
    ArrayList<Log> log_list = new ArrayList<Log>();
    log_list = new LogDao().showLog();
%>
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

<table>
    <tr>
        <th>用户名</th>
        <th>商品id</th>
        <th>是否购买</th>
        <th>购买数量</th>
    </tr>

    <%
        for(int i = 0; i<log_list.size();i++){
    %>
    <tr>
        <td><%=log_list.get(i).getUsername()%></td>
        <td><%=log_list.get(i).getBrowseId()%></td>
        <td><%=log_list.get(i).getWhetherBought()%></td>
        <td><%=log_list.get(i).getBoughtNum()%></td>
    </tr>
    <%}%>
    </table>

</body>
</html>
