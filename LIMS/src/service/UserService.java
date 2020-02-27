package service;

import domain.User;
import java.util.List;

//用户管理 接口
public interface UserService {

    //登录
    User login(User loginUser);

    //查询所有用户信息
    List<User> findAll();

    //根据id删除成员
    void deleteUser(String id);

    //保存
    void addUser(User user);
}
