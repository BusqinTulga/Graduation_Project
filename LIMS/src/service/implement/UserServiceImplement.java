package service.implement;

import dao.UserDao;
import dao.implement.UserDaoImplement;
import domain.Application;
import domain.Page;
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

    //登录次数+1
    @Override
    public void addLoginTimes(User loginUser) {
        dao.addLoginTimes(loginUser);
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
    public void addUser(Application application) {
        dao.addUser(application);
    }

    //查询申请的信息
    @Override
    public List<Application> applyUser() {
        return dao.applyUser();
    }

    //拒绝申请
    @Override
    public void applyDisagreed(String a_id) {
        dao.applyDisagreed(Integer.parseInt(a_id));
    }

    //同意申请
    @Override
    public void applyAgreedInsert(String a_id) {
        dao.applyAgreedInsert(Integer.parseInt(a_id));
    }
    @Override
    public void applyAgreedDelete(String a_id) {
        dao.applyAgreedDelete(Integer.parseInt(a_id));
    }

    //访问量+1
    @Override
    public void addViewTimes() {
        dao.addViewTimes();
    }

    //查询访问量
    @Override
    public int getViewTimes() {
        return dao.getViewTimes();
    }

    //添加最后登录时间
    @Override
    public void addLastTimeLogin(int id) {
        dao.addLastTimeLogin(id);
    }

    //分页
    @Override
    public Page<Application> findApplyUserByPage(String _currentPage, String _rows) {

        //类型转换
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        //创建空的Page对象
        Page<Application> Page = new Page<Application>();
        //设置参数
        Page.setCurrentPage(currentPage);
        Page.setRows(rows);

        //调用dao 查询总记录数
        int totalCount = dao.findTotalCount();
        Page.setTotalCount(totalCount);

        //调用dao 查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<Application> list = dao.findByPage(start, rows);
        Page.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows) == 0 ? totalCount / rows : (totalCount / rows) + 1;
        Page.setTotalPage(totalPage);
        return Page;
    }
}