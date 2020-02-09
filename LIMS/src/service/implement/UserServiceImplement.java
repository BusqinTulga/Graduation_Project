package service.implement;
import dao.FindAllUserDao;
import dao.implement.FindAllUserDaoImplement;
import domain.User;
import service.UserService;
import java.util.List;

public class UserServiceImplement implements UserService {
    private FindAllUserDao dao = new FindAllUserDaoImplement();
    @Override
    public List<User> findAll() {
        //用Dao查询
        return dao.findAll();
    }
}
