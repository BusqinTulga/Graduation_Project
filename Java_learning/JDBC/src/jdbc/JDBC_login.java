package jdbc;

import util.JDBCUtils_old;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBC_login {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入用户名：");
        String name = sc.nextLine();
        System.out.println("请输入密码：");
        String password = sc.nextLine();
        boolean flag = new JDBC_login().login(name,password);
        if(flag)
            System.out.println("登录成功!");
        else
            System.out.println("用户名或密码错误!");
    }
    public boolean login(String name, String password) {
        if(name == null || password == null)
            return false;
        Connection con = null;
        Statement sta = null;
        ResultSet rs = null;
        try {
            con = JDBCUtils_old.getConnection();
            sta = con.createStatement();
            String sql = "select * from people where name = '"+name+"' and password = '"+password+"'";
            rs = sta.executeQuery(sql);
                return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCUtils_old.close(rs,sta,con);
        }
        return false;
    }
}