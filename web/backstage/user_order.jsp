<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*"%>
<%@ page import="Dao.UserDao"
         import="Dao.LogDao"
         import="domain.User"
         import="domain.Log"
         import  ="other.mail_send"
         import ="java.sql.SQLException"
         import ="javax.mail.*"
%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="../client/log_reg.css">
<link rel="stylesheet" href="backstage.css">
<html>
<head>
    <title>我的记录</title>
</head>
<body>
<%--<p>尊贵的<%=((User)obj).getName()%></p>--%>
<%
    Object obj=session.getAttribute("user");
    String username = ((User)obj).getUsername();
    String email = ((User)obj).getEmail();
    ArrayList<Log> user_log = new ArrayList<>();
    try {
        user_log = new LogDao().findUserLog(username);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
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
<%--<h1>用户<%=request.getAttribute("username")%>的购买/浏览记录如下：</h1>--%>
<%--<h1>用户<%=username%>的购买/浏览记录如下：</h1>--%>
<table>
    <tr>
        <td>浏览的商品id</td>
        <td>是否购买</td>
        <td>购买的数量</td>
    </tr>
    <%
        for(int i = 0; i<user_log.size();i++){
    %>
        <tr>
            <td><%=user_log.get(i).getBrowseId()%></td>
            <td><%=user_log.get(i).getWhetherBought()%></td>
            <td><%=user_log.get(i).getBoughtNum()%></td>
        </tr>

<%}%>
            <button onclick="sendEmail();">提交付款并发送电子邮件进行确认</button>
<%--            <a href="mail_send" onclick="send();">确认付款并发送电子邮件</a>--%>
    <script type="javascript">
        function sendEmail(){
            // alert("确认成功！您可以通过电子邮件确定订单信息！");

            <%
            System.out.println("email :"+ email);
            try {new mail_send().mail(email);
    } catch (Exception e) {
        throw new RuntimeException(e);}
    %>
            }
    </script>


    </table>

</body>
</html>
