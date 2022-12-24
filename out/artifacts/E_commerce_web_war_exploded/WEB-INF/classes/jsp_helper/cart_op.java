package jsp_helper;

//导入user相关
import Dao.LogDao;
import Dao.ProductDao;
import Dao.UserDao;
import domain.Log;
import domain.Product;
import domain.User;
import sun.plugin.dom.core.Element;

public class cart_op {
    public cart_op(){
    }
    public void UserLog_build(int id,String username){
        //先更新商品售卖信息
        new ProductDao().updateProduct(id);

//        boolean exist = new LogDao().findUser_Product(username,id);
//        if(!exist){
//            new LogDao().addLog(username, id, "0", 0);
//            System.out.println("该用户未浏览过该商品，已完成浏览日志初始化操作");
//        }
//        new LogDao().updateLog(username, id);
//        System.out.println("已完成该商品购买一件更新操作");
        Log exist = new LogDao().findUser_Product(username,id);
        if(exist.getUsername()==null){
            //是空的
            new LogDao().addLog(username,id, "0", 0);
            //System.out.println("该用户未浏览过该商品，已完成浏览日志初始化操作");
        }
        new LogDao().updateLog(username,id);
        //System.out.println("已完成该商品购买一件更新操作");

    }
}
