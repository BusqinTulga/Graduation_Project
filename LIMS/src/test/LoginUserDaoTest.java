package test;

import dao.LoginUserDao;
import domain.User;
import org.junit.Test;

public class LoginUserDaoTest {
    @Test
    public void testLogin() {
        User loginuser = new User();
        loginuser.setName("tuliga");
        loginuser.setPassword("tuliga123");

        LoginUserDao dao = new LoginUserDao();
        User user = dao.login(loginuser);

        System.out.println(user);
    }
}
