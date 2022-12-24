<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="domain.User"
         import="other.cart_op"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>孕婴</title>
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
        <li class="61">

            <img src="../image/product/61.png"/><br/>
            <button id="sub61" onclick="sub_button('61')">-</button>
            <input type="text" value="0" id="num61">
            <button id="add61"  onclick="add_button('61')">+</button>
        </li>
            <button onclick="updateInfo61();" id="cart_61">加入购物车</button>

            <script type="text/javascript">
                function updateInfo61(){
                    alert("61添加成功！");
                    let m = Number(document.getElementById("num61").value);
                    while(m--){<%new cart_op().UserLog_build(61,username);%>}
                    }
            </script>


        <li class="62">

            <img src="../image/product/62.png"/><br/>
            <button id="sub62" onclick="sub_button('62')">-</button>
            <input type="text" value="0" id="num62">
            <button id="add62"  onclick="add_button('62')">+</button>
        </li>
            <button onclick="updateInfo62();" id="cart_62">加入购物车</button>

    </ul>
</div>
<script type="text/javascript">
    function updateInfo61(){
        alert("61添加成功！");
        let m = Number(document.getElementById("num61").value);
        while(m--){<%new cart_op().UserLog_build(61,username);
        System.out.println("61号商品添加成功");%>}
    }
</script>
<script>
    function updateInfo62(){
        // alert("62添加成功！");
        let n = Number(document.getElementById("num62").value);
        while(n--){<%new cart_op().UserLog_build(62,username);
            System.out.println("62号商品添加成功");%>}
    }
</script>
</body>
</html>
