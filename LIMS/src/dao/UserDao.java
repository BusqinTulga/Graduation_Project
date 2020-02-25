package dao;

import domain.User;
import java.util.List;

//用户操作的DAO
public interface UserDao {

    //查询所有成员信息
    public List<User> findAll();

    //根据id删除成员
    void deleteUser(int parseInt);

    void addUser(User user);
}
