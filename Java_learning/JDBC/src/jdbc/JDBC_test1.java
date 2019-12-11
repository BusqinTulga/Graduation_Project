package jdbc;

import domain.people;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JDBC_test1 {
    public static void main(String[] args) {
        List<people> list = new JDBC_test1().findAll();
        System.out.println(list);
    }
    public List findAll() {
        Connection con = null;
        Statement sta = null;
        ResultSet rs = null;
        List<people> list = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learning_db?serverTimezone=GMT%2B8","root","tuliga123");
            sta = con.createStatement();
            String sql = "select * from people";
            rs = sta.executeQuery(sql);
            people people = new people();
            list =new ArrayList<people>();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                people = new people();
                people.setId(id);
                people.setName(name);
                people.setAge(age);
                list.add(people);
            }
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
        return list;
    }
}
