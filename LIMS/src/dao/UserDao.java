package dao;

import domain.User;
import java.util.List;

//用户操作的DAO
public interface UserDao {

    //登录
    User login(User loginUser);

    //查询所有成员信息
    List<User> findAll();

    //根据id删除成员
    void deleteUser(int parseInt);

    //保存
    void addUser(User user);
}
