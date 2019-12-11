package jdbc;

import java.sql.*;

public class JDBC_select {
    public static void main(String[] args) {
        Connection con = null;
        Statement  sta = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learning_db?serverTimezone=GMT%2B8","root","tuliga123");
            sta = con.createStatement();
            String sql = "select * from people";
            rs = sta.executeQuery(sql);
            while (rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString("name");
                int age = rs.getInt("age");
                System.out.println(id+"         "+name+"        "+age);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if(rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
