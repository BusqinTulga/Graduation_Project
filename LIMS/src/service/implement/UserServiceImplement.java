package service.implement;

import dao.UserDao;
import dao.implement.UserDaoImplement;
import domain.User;
import service.UserService;
import java.util.List;

public class UserServiceImplement implements UserService {

    private UserDao dao = new UserDaoImplement();

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
}
