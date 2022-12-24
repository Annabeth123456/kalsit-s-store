package servlet;

//导入库
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//导入user相关
import Dao.LogDao;
import Dao.ProductDao;
import Dao.UserDao;
import domain.Log;
import domain.Product;
import domain.User;

@WebServlet("/LoginServlet")
//1、jsp页面 通过action提交到LoginServlet 类：
// <form action="LoginServlet " method="post" >

//2、创建LoginServlet类来处理jsp页面发出的请求
//@WebServlet("/LoginServlet")，可以不再web.xml中配置
//public class LoginServlet extends HttpServlet{

public class LoginServlet extends HttpServlet{


    private static final long serialVersionUID = 1L;

    //先创建post
    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        //接受表单信息
        //request.getParameter()方法是获取通过类似post，get等方式传入的数据，即获取客户端到服务端的数据，代表HTTP请求数据。
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //request.setAttribute()方法是将request.getParameter()方法获取的数据保存到request域中，即将获取的数据重新封装到一个域中。
        request.setAttribute("username", username);
        request.setAttribute("password", password);


        //服务器跳转，传递一些数据或者session信息(上一步中保存在request中的）
        //request.getRequestDispatcher("/client/show.jsp").forward(request,response);

        //登录操作，查找在数据库中查找username(findUser("username"))
            User user = new UserDao().findUser(username);
//            System.out.println("输入的密码是："+password);
//            System.out.println("数据库中对应的密码是："+user.getPassword());

            if(user.getUsername()!=null){
                //user总是非空，所以用不存在用户来判断
                //用户存在，则验证密码
                if(user.getPassword().equals(password)){
                    //如果数据库中的密码和传入的密码一致

                    System.out.println("登陆成功");
                    //将用户存入session中
                    request.getSession().setAttribute("user",user);


                    //先传所有product，更新商品售出信息
                    ArrayList<Product> pro_list = new ArrayList<>();
                    try {
                        pro_list = new ProductDao().showProducts();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    request.getSession().setAttribute("pro_list",pro_list);

                    //再传该用户相关日志，更新用户购买信息
                    ArrayList<Log> user_log = new ArrayList<>();
                    try {
                        user_log = new LogDao().findUserLog(user.getUsername());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    request.getSession().setAttribute("user_log",user_log);

                    //跳转到首页
                    response.sendRedirect("index.jsp");

                }else{
                    //密码错误
                    System.out.println("密码错误");
                    //request.setAttribute("loginError","密码错误");
                    //response.sendRedirect("/client/login_fail.jsp");
                    request.getRequestDispatcher("/client/login_fail.jsp").forward(request,response);

                }
            }else{
                //用户不存在
                System.out.println("用户不存在");
//                request.setAttribute("loginError","用户不存在");
                request.getRequestDispatcher("/client/login_fail.jsp").forward(request,response);


            }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
