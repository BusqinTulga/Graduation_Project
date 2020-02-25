package service;

import domain.User;
import java.util.List;

//用户管理 接口
public interface UserService {

    //查询所有用户信息
    public List<User> findAll();

    //根据id删除成员
    void deleteUser(String id);

    //保存
    void addUser(User user);
}
