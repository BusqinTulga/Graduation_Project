package jdbc;

import util.JDBCUtils_old;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBC_test3 {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement presta1 = null;
        PreparedStatement presta2 = null;

        try {
            //获取连接
            con = JDBCUtils_old.getConnection();
            //开启事务
            con.setAutoCommit(false);
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
            //制造错误，测试事务回滚
            int a = 3/0;
            presta2.executeUpdate();
            //提交事务
            con.commit();
        } catch (Exception e) {
            //事务回滚
            try {
                if(con != null)
                    con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
        finally {
            //释放资源
            JDBCUtils_old.close(presta1,con);
            JDBCUtils_old.close(presta2,null);
        }

    }
}
