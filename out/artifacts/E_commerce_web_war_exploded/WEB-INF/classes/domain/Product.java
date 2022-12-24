package domain;

public class Product {
    private int id;
    private String price;
    private String status;
    private int p_num;

    public Product(){
    }

    public int getId(){
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getPrice(){
        return this.price;
    }
    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus(){
        return this.status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public int getProductSoldNum(){
        return this.p_num;
    }
    public void setProductSoldNum(int p_num) {
        this.p_num = p_num;
    }








}
