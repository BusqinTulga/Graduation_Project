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
    //登录次数+1
    @Override
    public void addLoginTimes(User loginUser) {
        //定义sql
        String sql = "update user set login_times = login_times+1 where name = ? and password = ?";
        //执行sql
        template.update(sql, loginUser.getName(), loginUser.getPassword());
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
        String sql = "insert into application values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //执行sql
        template.update(
                sql, application.getNumber(), application.getName(), application.getGender(), application.getBirthday(),
                application.getProvince(),application.getCity(),application.getDistrict(),application.getCollage(),
                application.getClasses(), application.getPhone_number(), application.getEmail(),
                application.getSelf_description(), application.getReason()
        );
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
    public void applyDisagreed(int a_id) {
        //定义sql
        String sql = "delete from application where a_id = ?";
        //执行sql
        template.update(sql, a_id);

    }

    //同意申请
    //从application表添加到user表
    @Override
    public void applyAgreedInsert(int a_id) {
        //定义添加sql
        String sql = "insert into " +
                "user(number, name, gender, birthday, province, city, district, collage, classes, phone_number, email, self_description, reason) " +
                "select " +
                "number, name, gender, birthday, province, city, district, collage, classes, phone_number, email, self_description, reason " +
                "from application where a_id = ?";
        //执行添加sql
        template.update(sql, a_id);
    }
    //从application表删除
    @Override
    public void applyAgreedDelete(int a_id) {
        //定义删除sql
        String sql = "delete from application where a_id = ?";
        //执行删除sql
        template.update(sql, a_id);
    }

    //访问量+1
    @Override
    public void addViewTimes() {
        //定义sql
        String sql = "update admin set view_times = view_times + 1";
        //执行sql
        template.update(sql);
    }

    //查询访问量
    @Override
    public int getViewTimes() {
        //定义sql
        String sql = "select view_times from admin";
        //执行sql
        Integer view_times = template.queryForObject(sql, Integer.class);
        return view_times;
    }

    //添加最后登录时间
    @Override
    public void addLastTimeLogin(int id) {
        //定义sql
        String sql = "update user set last_time_login = now() where id = ?";
        //执行sql
        template.update(sql, id);
    }

    //查询总记录数
    @Override
    public int findTotalCount() {
        //定义sql
        String sql = "select count(*) from Application";
        //执行sql
        Integer integer = template.queryForObject(sql, Integer.class);
        return integer;
    }

    //分页查询每页记录
    @Override
    public List<Application> findByPage(int start, int rows) {
        //定义sql
        String sql = "select * from Application limit ? , ?";
        //执行sql
        List<Application> list = template.query(sql, new BeanPropertyRowMapper<Application>(Application.class), start, rows);
        return list;
    }
}
