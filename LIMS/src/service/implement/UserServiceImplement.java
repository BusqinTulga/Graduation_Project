package service.implement;

import dao.UserDao;
import dao.implement.UserDaoImplement;
import domain.User;
import service.UserService;
import java.util.List;

public class UserServiceImplement implements UserService {

    private UserDao dao = new UserDaoImplement();

    //登录
    @Override
    public User login(User loginUser) {
        return dao.login(loginUser);
    }

    //查询所有成员信息
    @Override
    public List<User> findAll() {
        //用Dao查询
        return dao.findAll();
    }

    //根据id删除成员
    @Override
    public void deleteUser(String id) {
        dao.deleteUser(Integer.parseInt(id));
    }

    //保存
    @Override
    public void addUser(User user) {
        dao.addUser(user);
    }
}
