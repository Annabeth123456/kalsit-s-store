<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="domain.User"
         import="jsp_helper.cart_op"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>服装</title>
    <link rel="stylesheet" href="product.css">
    <script src="product_cart.js"></script>
</head>
<body>
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
<div class="main">
    <ul>
        <%--        <li class="61">--%>

        <%--            <img src="../image/product/61.png"/><br/>--%>
        <%--            <button id="sub61" onclick="sub_button('61')">-</button>--%>
        <%--            <input type="text" value="0" id="num61">--%>
        <%--            <button id="add61"  onclick="add_button('61')">+</button>--%>
        <%--&lt;%&ndash;            <a class="add_cart1" href="#" onclick="updateInfo('61');">加入购物车</a>&ndash;%&gt;--%>
        <%--            <button onclick="updateInfo('61');">加入购物车</button>--%>

        <%--        </li>--%>
        <%--        <script>--%>
        <%--            function updateInfo(id){--%>
        <%--                //x是添加的购物车数量--%>
        <%--                let x = document.getElementById(id);--%>
        <%--                while(x--){--%>
        <%--                    <%--%>
        <%--                    //先获取username和id--%>
        <%--                    int id = 61;--%>

        <%--                    Object obj = session.getAttribute("user");--%>
        <%--                    String username = ((User)obj).getUsername();--%>

        <%--                    //如果没买过该物品，则自动创建空的浏览log--%>
        <%--                    boolean res = new LogDao().addLog(username,id,"0",0);--%>
        <%--                    if(!res){--%>
        <%--                        //如果不存在，则初始化一个--%>
        <%--                        new LogDao().addLog(username,id,"0",0);--%>
        <%--                        System.out.println(username+"的浏览日志初始化添加成功");--%>
        <%--                    }--%>
        <%--                    new LogDao().updateLog(username,id);--%>
        <%--                    System.out.println(username+"的购买日志添加成功");--%>
        <%--                    %>--%>

        <%--                }--%>
        <%--                alert("添加成功！");--%>
        <%--            }--%>
        <%--        </script>--%>


        <%--        <li class="62">--%>
        <%--            <img src="../image/product/62.png" /><br/>--%>
        <%--            <button class="sub" onclick="sub_button('62')">-</button>--%>
        <%--            <input type="text" value="0" id="num62">--%>
        <%--            <button class="add" onclick="add_button('62')">+</button>--%>
        <%--        </li>--%>
    </ul>
    <ul>
        <li class="71">

            <img src="../image/product/71.png"/><br/>
            <button id="sub71" onclick="sub_button('71')">-</button>
            <input type="text" value="0" id="num71">
            <button id="add71"  onclick="add_button('71')">+</button>
            <button onclick="updateInfo71();" id="cart_71">加入购物车</button>

        </li>
        <li class="72">
            <img src="../image/product/72.png"/><br/>
            <button id="sub72" onclick="sub_button('72')">-</button>
            <input type="text" value="0" id="num72">
            <button id="add72"  onclick="add_button('72')">+</button>
            <button onclick="updateInfo72();" id="cart_72">加入购物车</button>
        </li>
    </ul>
</div>
<script>
    <%
    Object obj = session.getAttribute("user");
    String username = ((User)obj).getUsername();
    %>
    function updateInfo71(){
        let x = document.getElementById("num71").value;
        while(x--){<%new cart_op().UserLog_build(71,username);%>}
        alert("添加成功！");}

    function updateInfo72(){
        let x = document.getElementById("num72").value;
        while(x--){<%new cart_op().UserLog_build(72,username);%>}
        alert("添加成功！");}
</script>
</body>
</html>
