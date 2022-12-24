<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="Dao.UserDao"
         import="Dao.ProductDao"
         import="domain.User"
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
    <title>商品信息后台查询</title>
</head>
<body>
    <%
        ArrayList<Product> pro_list = new ArrayList<Product>();
        pro_list = new ProductDao().showProducts();
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
            <td>商品id</td>
            <td>价格</td>
            <td>状态</td>
            <td>销售数量</td>
        </tr>

        <%
            for(int i = 0;i<pro_list.size();i++){
        %>
        <tr>
            <td><%=pro_list.get(i).getId()%></td>
            <td><%=pro_list.get(i).getPrice()%></td>
            <td><%=pro_list.get(i).getStatus()%></td>
            <td><%=pro_list.get(i).getProductSoldNum()%></td>
        </tr>

        <% }%>
    </table>



<%--<p>${pro_list}</p>--%>






</body>
</html>
