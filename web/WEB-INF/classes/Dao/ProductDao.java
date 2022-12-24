package Dao;

import domain.Log;
import domain.Product;
import domain.User;

import java.sql.*;
import java.util.ArrayList;

public class ProductDao {
    public ProductDao(){
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

    //添加商品(id,price,status,p_num)
    public boolean addProduct(int id, String price, String status,int p_num) {
        System.out.println("已完成商品"+id+"的添加操作");
        //建立数据库连接并初始化参数
        Connection conn = getConnection();
        //PreparedStatement的第一次执行消耗是很高的. 它的性能体现在后面的重复执行;
        // Statement适合只执行一次，预编译，可避免sql注入攻击
        PreparedStatement pstm = null;
        String sql = "insert into product(id,price,status,p_num) values(?,?,?,?)";

        //addUser函数类型为布尔，设定结果res初始值为false，后续再设定为true，并最终返回res
        boolean res = false;
        try {
            pstm = conn.prepareStatement(sql);
            //预编译接口，代替上述问号
            pstm.setInt(1, id);
            pstm.setString(2, price);
            pstm.setString(3, status);
            pstm.setInt(4, p_num);

            res = (pstm.executeUpdate() == 1);
            //executeUpdate() 用于执行 INSERT、UPDATE 、 DELETE 语句或不返回任何内容的 SQL 语句
        } catch (SQLException e) {
            if (!e.getMessage().contains("PRIMARY")) {
                e.printStackTrace();
            }
        } finally {
            try {
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    //根据商品id查找商品信息
    public Product findProduct(int id){
        System.out.println("已完成商品"+id+"的查找操作");
        String sql = "select * from product where id=?";
        Connection conn = getConnection();
        PreparedStatement pstm = null;

        ResultSet rs = null;
        Product product = new Product();
        try{
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            //executeQuery用于产生单个结果集的语句，例如 SELECT 语句。
            //如果执行存储过程将产生大于 1 的更新计数，或生成多个结果集，则使用 execute 方法执行存储过程。

            if (rs.next()) {//判断是否有数据返回

                product.setId(rs.getInt("id"));
                product.setPrice(rs.getString("price"));
                product.setStatus(rs.getString("status"));
                product.setProductSoldNum(rs.getInt("p_num"));

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
        return product;
    }

    //根据id更新商品信息（是否卖出和卖出的数量）
    public boolean updateProduct(int id){

        //id用于查询
        //修改status和p_num
        System.out.println("已完成商品"+id+"的更新操作");

        //建立数据库连接并初始化参数
        Connection conn = getConnection();
        PreparedStatement pstm = null;

        //不用分类，只要要执行这个函数一定要把status=1， 0是初始值
        //String sql = "insert into product(id,price,status,p_num) values(?,?,?,?)"
        String sql = "update product set status='1', p_num=p_num+1 where id=?";

        //addUser函数类型为布尔，设定结果res初始值为false，后续再设定为true，并最终返回res
        boolean res = false;
        try {
            pstm = conn.prepareStatement(sql);
            //预编译接口，代替上述问号
            pstm.setInt(1, id);

            res = (pstm.executeUpdate() == 1);
            //executeUpdate() 用于执行 INSERT、UPDATE 、 DELETE 语句或不返回任何内容的 SQL 语句
        } catch (SQLException e) {
            if (!e.getMessage().contains("PRIMARY")) {
                e.printStackTrace();
            }
        } finally {
            try {
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    //查找所有商品信息
    public ArrayList<Product> showProducts() throws SQLException {
        System.out.println("已完成全部商品信息的查找操作");
        String sql = "select * from product";

        Connection conn = getConnection();
        Statement stmt = getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        //ArrayList<E> objectName =new ArrayList<>();　 // 初始化
        ArrayList<Product> products = new ArrayList<>();

        try{
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setPrice(rs.getString("price"));
                product.setStatus(rs.getString("status"));
                product.setProductSoldNum(rs.getInt("p_num"));

                //System.out.println("商品id:"+rs.getInt("id")+"\t商品价格:"+rs.getString("price")+"\t购买状态:"+rs.getString("status")+"\t卖出数量:"+rs.getInt("p_num"));

                products.add(product);
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

        return products;
    }


    //根据商品id删除商品
    public boolean delProduct(int id){
        System.out.println("已完成商品id为"+id+"的删除操作");
        //建立数据库连接并初始化参数
        Connection conn = getConnection();
        PreparedStatement pstm = null;
        String sql = "delete from product where id=?";
        //String sql = "delete from user where username = ?";

        //addUser函数类型为布尔，设定结果res初始值为false，后续再设定为true，并最终返回res
        boolean res = false;
        try {
            pstm = conn.prepareStatement(sql);
            //预编译接口，代替上述问号
            pstm.setInt(1, id);
            //别忘记传参
            res = (pstm.executeUpdate() == 1);
            //executeUpdate() 用于执行 INSERT、UPDATE 、 DELETE 语句或不返回任何内容的 SQL 语句
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
        return res;
    }


    public static void main(String[] args) throws SQLException {
        //测试方法
        //先new一个dao类，再调动相应函数并传参

        //System.out.println(new UserDao().findUser("John"));
        //new ProductDao().addProduct(100, "10000","0",0);
        //new ProductDao().delProduct(100);
        new ProductDao().updateProduct(61);

//        Product product = new ProductDao().findProduct(51);
//        System.out.println("id名："+product.getId()+"价格："+product.getPrice()+"状态："+product.getStatus()+"卖出的数量："+product.getProductSoldNum());
        //new ProductDao().showProducts();
    }

}
