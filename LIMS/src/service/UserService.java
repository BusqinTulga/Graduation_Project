package service;

import domain.Application;
import domain.Page;
import domain.User;
import java.util.List;

//用户管理 接口
public interface UserService {

    //登录
    User login(User loginUser);
    //登录次数+1
    void addLoginTimes(User loginUser);

    //查询所有用户信息
    List<User> findAll();

    //根据id删除成员
    void deleteUser(String id);

    //保存
    void addUser(Application application);

    //查询申请的信息
    List<Application> applyUser();

    //拒绝申请
    void applyDisagreed(String a_id);

    //同意申请
    void applyAgreedInsert(String a_id);
    void applyAgreedDelete(String a_id);

    //访问量+1
    void addViewTimes();

    //查询访问量
    int getViewTimes();

    //添加最后登录时间
    void addLastTimeLogin(int id);

    //分页
    Page<Application> findApplyUserByPage(String _currentPage, String _rows);
}