package dao;

import domain.Application;
import domain.User;
import java.util.List;

//用户操作的DAO
public interface UserDao {

    //登录
    User login(User loginUser);
    //登录次数+1
    void addLoginTimes(User loginUser);

    //查询所有成员信息
    List<User> findAll();

    //根据id删除成员
    void deleteUser(int parseInt);

    //保存
    void addUser(Application application);

    //查询申请的信息
    List<Application> applyUser();

    //拒绝申请
    void applyDisagreed(int parseInt);

    //同意申请
    void applyAgreedInsert(int parseInt);
    void applyAgreedDelete(int parseInt);
}
