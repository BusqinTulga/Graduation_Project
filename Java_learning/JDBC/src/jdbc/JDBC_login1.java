package jdbc;

import util.JDBCUtils_old;

import java.sql.*;
import java.util.Scanner;

public class JDBC_login1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入用户名：");
        String name = sc.nextLine();
        System.out.println("请输入密码：");
        String password = sc.nextLine();
        boolean flag = new JDBC_login1().login1(name,password);
        if(flag)
            System.out.println("登录成功!");
        else
            System.out.println("用户名或密码错误!");
    }

    public boolean login1(String name, String password) {
        if(name == null || password == null)
            return false;
        Connection con = null;
        PreparedStatement presta = null;
        ResultSet rs = null;
        try {
            con = JDBCUtils_old.getConnection();
            String sql = "select * from people where name = ? and password = ?";
            presta = con.prepareStatement(sql);
            presta.setString(1,name);
            presta.setString(2,password);
            rs = presta.executeQuery();
                return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCUtils_old.close(rs,presta,con);
        }
        return false;
    }
}