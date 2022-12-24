<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="domain.User"
         import="other.cart_op"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>美食</title>
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
        <li class="21">

            <img src="../image/product/21.png"/><br/>
            <button id="sub21" onclick="sub_button('21')">-</button>
            <input type="text" value="0" id="num21">
            <button id="add21"  onclick="add_button('21')">+</button>
        </li>
        <button onclick="updateInfo21();" id="cart_21">加入购物车</button>

        <script type="text/javascript">
            function updateInfo21(){
                // alert("21添加成功！");
                let m = Number(document.getElementById("num21").value);
                while(m--){<%new cart_op().UserLog_build(21,username);%>}
            }
        </script>


        <li class="22">

            <img src="../image/product/22.png"/><br/>
            <button id="sub22" onclick="sub_button('22')">-</button>
            <input type="text" value="0" id="num22">
            <button id="add22"  onclick="add_button('22')">+</button>
        </li>
        <button onclick="updateInfo22();" id="cart_22">加入购物车</button>

    </ul>
</div>
<script type="text/javascript">
    function updateInfo21(){
        alert("21添加成功！");
        let m = Number(document.getElementById("num21").value);
        while(m--){<%new cart_op().UserLog_build(21,username);
        System.out.println("21号商品添加成功");%>}
    }
</script>
<script>
    function updateInfo22(){
        alert("22添加成功！");
        let n = Number(document.getElementById("num22").value);
        while(n--){<%new cart_op().UserLog_build(22,username);
            System.out.println("22号商品添加成功");%>}
    }
</script>

</body>
</html>
