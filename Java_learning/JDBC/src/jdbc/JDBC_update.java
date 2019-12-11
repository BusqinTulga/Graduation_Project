package jdbc;

import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

class JDBC_update {
    public static void main(String[] args) {
        Connection con = null;
        Statement sta = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learning_db?serverTimezone=GMT%2B8","root","tuliga123");
            sta = con.createStatement();
            String sql = "update people set sex_id = 2 where id = 2";
            int a = sta.executeUpdate(sql);
            System.out.println(a);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if(sta != null) {
                try {
                    sta.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
