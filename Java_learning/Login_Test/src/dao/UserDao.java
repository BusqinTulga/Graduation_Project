package dao;

import domain.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

//操作数据库中User表的类
public class UserDao {
    //声明JDBCTemplate对象共用
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    //登录方法
    public User login(User loginUser) {
        //编写sql
        String sql = "select * from user where name = ? and password = ?";
        User user = null;
        try {
            //调用query方法
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), loginUser.getName(), loginUser.getPassword());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return user;
    }
}