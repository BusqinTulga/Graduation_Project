package jdbc;

import com.mysql.cj.jdbc.JdbcConnection;
import util.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBC_test2 {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement presta1 = null;
        PreparedStatement presta2 = null;

        try {
            //获取连接
            con = JDBCUtils.getConnection();
            //定义sql
            String sql1 = "update money set money = money - ? where id = ?";
            String sql2 = "update money set money = money + ? where id = ?";
            //获取执行sql对象
            presta1 = con.prepareStatement(sql1);
            presta2 = con.prepareStatement(sql2);
            //设置?的参数
            presta1.setInt(1,500);
            presta1.setInt(2,2);
            presta2.setInt(1,500);
            presta2.setInt(2,3);
            //执行sql
            presta1.executeUpdate();
            presta2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            //释放资源
            JDBCUtils.close(presta1,con);
            JDBCUtils.close(presta2,null);
        }

    }
}
