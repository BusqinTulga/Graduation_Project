package test;

import dao.implement.UserDaoImplement;
import domain.User;
import org.junit.Test;

public class LoginUserDaoTest {
    @Test
    public void testLogin() {
        User user = new User();
        user.setName("admin");
        user.setPassword("admin");

        UserDaoImplement userDaoImplement = new UserDaoImplement();
        userDaoImplement.login(user);

        System.out.println(user);
    }
}
