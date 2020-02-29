package dao.implement;

import dao.UserDao;
import domain.Application;
import domain.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;
import java.util.List;

public class UserDaoImplement implements UserDao {

    //使用jdbc操作数据库
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
        //执行sql
        template.update(sql, id);
    }

    //申请表提交到数据库
    @Override
    public void addUser(Application application) {
        //定义sql
        String sql = "insert into application values(null,null,?,?,null,null,null,null,null)";
        //执行sql
        template.update(sql, application.getName(), application.getGender());
    }

    //查询申请的信息
    @Override
    public List<Application> applyUser() {
        //定义sql
        String sql = "select * from application";
        //执行sql
        List<Application> applications = template.query(sql, new BeanPropertyRowMapper<Application>(Application.class));
        return applications;
    }

    //拒绝申请
    @Override
    public void applyDisagreed(int id) {
        //定义sql
        String sql = "delete from application where id = ?";
        //执行sql
        template.update(sql, id);
    }
}
