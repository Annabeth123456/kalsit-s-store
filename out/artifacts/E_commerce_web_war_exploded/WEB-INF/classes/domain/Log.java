package domain;

public class Log {
    private String username;

    private int id;

    private String flag;

    private int b_num;


    public Log() {
    }


    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getBrowseId() {
        return this.id;
    }

    public void setBrowseId(int id) {
        this.id = id;
    }

    public String getWhetherBought() {
        return this.flag;
    }

    public void setWhetherBought(String flag) {
        this.flag = flag;
    }

    public int getBoughtNum() {
        return this.b_num;
    }

    public void setBoughtNum(int b_num) {
        this.b_num=b_num;
    }



}