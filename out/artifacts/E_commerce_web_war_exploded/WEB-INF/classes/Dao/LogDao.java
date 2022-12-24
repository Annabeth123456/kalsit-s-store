package Dao;

import domain.Log;
import domain.Product;

import java.sql.*;
import java.util.ArrayList;
public class LogDao {
    public LogDao(){
    }

    //获得连接
    public static Connection getConnection() {

        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/web_db";//修改为自己的数据库
        String user = "web_db";//修改未自己数据库的用户名密码
        String password = "EE6Pj38Y86cTkr4Z";//修改未自己数据库的名密码
        Connection connection = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //初始化日志内容(添加）
    public boolean addLog(String username,int id,String flag,int b_num) {
        System.out.println("已完成对应日志内容初始化");

        Connection conn = getConnection();
        PreparedStatement pstm = null;
        String sql = "insert into log(username,id,flag,b_num) values(?,?,?,?)";

        //addUser函数类型为布尔，设定结果res初始值为false，后续再设定为true，并最终返回res
        boolean res = false;
        try {
            pstm = conn.prepareStatement(sql);

            pstm.setString(1, username);
            pstm.setInt(2, id);
            pstm.setString(3, flag);
            pstm.setInt(4, b_num);

            res = (pstm.executeUpdate() == 1);
            //executeUpdate() 用于执行 INSERT、UPDATE 、 DELETE 语句或不返回任何内容的 SQL 语句
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    //根据某一用户对于某一商品是否有记录
    public Log findUser_Product(String username,int id){

        String sql = "select * from log where username=? and id=?";
        Connection conn = getConnection();
        PreparedStatement pstm = null;

        ResultSet rs = null;
        Log log = new Log();
        try{
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setInt(2, id);
            rs = pstm.executeQuery();
            //executeQuery用于产生单个结果集的语句，例如 SELECT 语句。
            //如果执行存储过程将产生大于 1 的更新计数，或生成多个结果集，则使用 execute 方法执行存储过程。

            if (rs.next()) {//判断是否有数据返回

                log.setUsername(rs.getString("username"));
                log.setBrowseId(rs.getInt("id"));

                log.setWhetherBought(rs.getString("flag"));
                log.setBoughtNum(rs.getInt("b_num"));

                //System.out.println("username: "+rs.getString("username")+" password: "+rs.getString("password")+" email: "+rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return log;
    }


    //查找全部日志
    public ArrayList<Log> showLog() throws SQLException {
        //System.out.println("已完成用户"+username+"日志的查找操作");
        System.out.println("已完成日志的查找操作");
        //String sql = "select * from log where username=?";
        //String sql="select * from user where username=?";
        String sql = "select * from log";

        Connection conn = getConnection();
        Statement stmt = getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        //ArrayList<E> objectName =new ArrayList<>();　 // 初始化
        ArrayList<Log> log_list = new ArrayList<>();

        try{
            while(rs.next()){
                Log log = new Log();
                //Log是类，log是实例化的对象，也是arraylist的一个项
                log.setUsername(rs.getString("username"));
                log.setBrowseId(rs.getInt("id"));
                log.setWhetherBought(rs.getString("flag"));
                log.setBoughtNum(rs.getInt("b_num"));

                System.out.println("用户名:"+rs.getString("username")+"\t商品id:"+rs.getInt("id")+"\t购买状态:"+rs.getString("flag")+"\t购买数量:"+rs.getInt("b_num"));

                //把这个对象添加到log_list中
                log_list.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return log_list;
    }

    //根据用户名查找日志浏览和购买记录
    public ArrayList<Log> findUserLog(String username) throws SQLException {
        System.out.println("已完成用户"+username+"日志的查找操作");
        String sql = "select * from log where username=?";

        Connection conn = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        rs = pstm.executeQuery();
        ArrayList<Log> log_list = new ArrayList<>();

        try{
            while(rs.next()){
                Log log = new Log();
                //Log是类，log是实例化的对象，也是arraylist的一个项
                log.setUsername(rs.getString("username"));
                log.setBrowseId(rs.getInt("id"));
                log.setWhetherBought(rs.getString("flag"));
                log.setBoughtNum(rs.getInt("b_num"));

                System.out.println("用户名:"+rs.getString("username")+"\t浏览商品id:"+rs.getInt("id")+"\t购买状态:"+rs.getString("flag")+"\t购买数量:"+rs.getInt("b_num"));

                //把这个对象添加到log_list中
                log_list.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                pstm.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return log_list;
    }


    //根据username和商品id更新商品信息（是否买和买的数量）
    public boolean updateLog(String username,int id){

        //id用于查询
        //修改status和p_num
        System.out.println("已完成用户"+username+"对于商品编号为"+id+"的更新操作");

        Connection conn = getConnection();
        PreparedStatement pstm = null;

        //不用分类，只要要执行这个函数一定要把flag=1， 0是初始值
        String sql = "update log set flag='1', b_num=b_num+1 where username=? and id=?";

        //addUser函数类型为布尔，设定结果res初始值为false，后续再设定为true，并最终返回res
        boolean res = false;
        try {
            pstm = conn.prepareStatement(sql);
            //预编译接口，代替上述问号
            pstm.setString(1, username);
            pstm.setInt(2, id);

            res = (pstm.executeUpdate() == 1);
            //executeUpdate() 用于执行 INSERT、UPDATE 、 DELETE 语句或不返回任何内容的 SQL 语句
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }



    public static void main(String[] args) throws SQLException {
        //测试方法
        //先new一个dao类，再调动相应函数并传参

        //System.out.println(new UserDao().findUser("John"));
        //new ProductDao().addProduct(100, "10000","0",0);
        //new LogDao().addLog("Alice",12,"0",0);

        //System.out.println(new LogDao().showLog());
        //System.out.println(new LogDao().findUserLog("John"));

//        //测试一下更新
//        System.out.println(new LogDao().showLog());
//        new LogDao().updateLog("John",11);

        //new ProductDao().updateProduct(11);
//        ArrayList<Log> log_list = new ArrayList<>();
//        log_list = new LogDao().showLog();
//        new LogDao().updateLog("John",62);
        Log exist = new LogDao().findUser_Product("John",61);
        if(exist.getUsername()==null){
            //是空的
            new LogDao().addLog("John",61, "0", 0);
            System.out.println("该用户未浏览过该商品，已完成浏览日志初始化操作");
        }
        new LogDao().updateLog("John",61);
        System.out.println("已完成该商品购买一件更新操作");
    }

}
