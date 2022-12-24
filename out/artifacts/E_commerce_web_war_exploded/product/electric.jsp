<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="domain.User"
         import="other.cart_op"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>电器</title>
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
        <%--        <li class="81">--%>

        <%--            <img src="../image/product/81.png"/><br/>--%>
        <%--            <button id="sub81" onclick="sub_button('81')">-</button>--%>
        <%--            <input type="text" value="0" id="num81">--%>
        <%--            <button id="add81"  onclick="add_button('81')">+</button>--%>
        <%--&lt;%&ndash;            <a class="add_cart1" href="#" onclick="updateInfo('81');">加入购物车</a>&ndash;%&gt;--%>
        <%--            <button onclick="updateInfo('81');">加入购物车</button>--%>

        <%--        </li>--%>
        <%--        <script>--%>
        <%--            function updateInfo(id){--%>
        <%--                //x是添加的购物车数量--%>
        <%--                let x = document.getElementById(id);--%>
        <%--                while(x--){--%>
        <%--                    <%--%>
        <%--                    //先获取username和id--%>
        <%--                    int id = 81;--%>

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


        <%--        <li class="82">--%>
        <%--            <img src="../image/product/82.png" /><br/>--%>
        <%--            <button class="sub" onclick="sub_button('82')">-</button>--%>
        <%--            <input type="text" value="0" id="num82">--%>
        <%--            <button class="add" onclick="add_button('82')">+</button>--%>
        <%--        </li>--%>
    </ul>
    <ul>
        <li class="81">

            <img src="../image/product/81.png"/><br/>
            <button id="sub81" onclick="sub_button('81')">-</button>
            <input type="text" value="0" id="num81">
            <button id="add81"  onclick="add_button('81')">+</button>
        </li>
        <button onclick="updateInfo81();" id="cart_81">加入购物车</button>

        <script type="text/javascript">
            function updateInfo81(){
                // alert("81添加成功！");
                let m = Number(document.getElementById("num81").value);
                while(m--){<%new cart_op().UserLog_build(81,username);%>}
            }
        </script>


        <li class="82">

            <img src="../image/product/82.png"/><br/>
            <button id="sub82" onclick="sub_button('82')">-</button>
            <input type="text" value="0" id="num82">
            <button id="add82"  onclick="add_button('82')">+</button>
        </li>
        <button onclick="updateInfo82();" id="cart_82">加入购物车</button>

    </ul>
</div>
<script type="text/javascript">
    function updateInfo81(){
        alert("81添加成功！");
        let m = Number(document.getElementById("num81").value);
        while(m--){<%new cart_op().UserLog_build(81,username);
        System.out.println("81号商品添加成功");%>}
    }
</script>
<script>
    function updateInfo82(){
        alert("82添加成功！");
        let n = Number(document.getElementById("num82").value);
        while(n--){<%new cart_op().UserLog_build(82,username);
            System.out.println("82号商品添加成功");%>}
    }
</script>

</body>
</html>
