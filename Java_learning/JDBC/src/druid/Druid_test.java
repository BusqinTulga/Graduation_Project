package druid;

import util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Druid_test {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement presta = null;
        try {
            //1.获取连接
            con = JDBCUtils.getConnection();
            //2.获取sql
            String sql = "update people set sex_id = 1 where id = 2";
            //3.获取presta对象
            presta = con.prepareStatement(sql);
            //4.执行sql
            int a = presta.executeUpdate();
            System.out.println(a);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //5.释放资源
        finally {
            JDBCUtils.close(presta, con);
        }
    }
}
