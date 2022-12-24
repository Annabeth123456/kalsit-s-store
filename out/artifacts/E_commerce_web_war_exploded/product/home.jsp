<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="domain.User"
         import="other.cart_op"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>家居</title>
    <link rel="stylesheet" href="product.css">
    <script src="product_cart.js"></script>
</head>
<body>
<%
    Object obj = session.getAttribute("user");
    String username = ((User)obj).getUsername();
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
<div class="main">
    <ul>
        <%--        <li class="41">--%>

        <%--            <img src="../image/product/41.png"/><br/>--%>
        <%--            <button id="sub41" onclick="sub_button('41')">-</button>--%>
        <%--            <input type="text" value="0" id="num41">--%>
        <%--            <button id="add41"  onclick="add_button('41')">+</button>--%>
        <%--&lt;%&ndash;            <a class="add_cart1" href="#" onclick="updateInfo('41');">加入购物车</a>&ndash;%&gt;--%>
        <%--            <button onclick="updateInfo('41');">加入购物车</button>--%>

        <%--        </li>--%>
        <%--        <script>--%>
        <%--            function updateInfo(id){--%>
        <%--                //x是添加的购物车数量--%>
        <%--                let x = document.getElementById(id);--%>
        <%--                while(x--){--%>
        <%--                    <%--%>
        <%--                    //先获取username和id--%>
        <%--                    int id = 41;--%>

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


        <%--        <li class="42">--%>
        <%--            <img src="../image/product/42.png" /><br/>--%>
        <%--            <button class="sub" onclick="sub_button('42')">-</button>--%>
        <%--            <input type="text" value="0" id="num42">--%>
        <%--            <button class="add" onclick="add_button('42')">+</button>--%>
        <%--        </li>--%>
    </ul>
    <ul>
        <li class="41">

            <img src="../image/product/41.png"/><br/>
            <button id="sub41" onclick="sub_button('41')">-</button>
            <input type="text" value="0" id="num41">
            <button id="add41"  onclick="add_button('41')">+</button>
        </li>
        <button onclick="updateInfo41();" id="cart_41">加入购物车</button>

        <script type="text/javascript">
            function updateInfo41(){
                // alert("41添加成功！");
                let m = Number(document.getElementById("num41").value);
                while(m--){<%new cart_op().UserLog_build(41,username);%>}
            }
        </script>


        <li class="42">

            <img src="../image/product/42.png"/><br/>
            <button id="sub42" onclick="sub_button('42')">-</button>
            <input type="text" value="0" id="num42">
            <button id="add42"  onclick="add_button('42')">+</button>
        </li>
        <button onclick="updateInfo42();" id="cart_42">加入购物车</button>

    </ul>
</div>
<script type="text/javascript">
    function updateInfo41(){
        alert("41添加成功！");
        let m = Number(document.getElementById("num41").value);
        while(m--){<%new cart_op().UserLog_build(41,username);
        System.out.println("41号商品添加成功");%>}
    }
</script>
<script>
    function updateInfo42(){
        alert("42添加成功！");
        let n = Number(document.getElementById("num42").value);
        while(n--){<%new cart_op().UserLog_build(42,username);
            System.out.println("42号商品添加成功");%>}
    }
</script>



</body>
</html>
