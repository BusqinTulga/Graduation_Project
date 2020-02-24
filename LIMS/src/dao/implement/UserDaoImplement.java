package dao.implement;

import dao.LoginUserDao;
import dao.UserDao;
import domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import javax.sql.DataSource;
import java.util.List;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class UserDaoImplement implements UserDao {

    //使用jdbc操作数据库
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    //查询所有成员信息
    @Override
    public List<User> findAll() {
        //定义sql
        String sql = "select * from user";
        //执行sql
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;
    }

    //根据id删除成员
    @Override
    public void deleteUser(int id) {
        //定义sql
        String sql = "delete from user where id = ?";
        //执行sql8
        template.update(sql, id);
    }
}
