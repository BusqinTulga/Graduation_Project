package jdbc;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC_test {
    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        //获取连接
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learning_db?serverTimezone=GMT%2B8","root","tuliga123");
        //定义sql
        String sql = "update people set sex_id = 2 where id = 2";
        //获取执行sql的对象
        Statement sta =con.createStatement();
        int a = sta.executeUpdate(sql);
        System.out.println(a);
        //释放资源
        sta.close();
        con.close();
    }
}