package test;

import dao.implement.UserDaoImplement;
import domain.Application;
import org.junit.Test;

public class ApplyUserDaoTest {
    @Test
    public void testApply() {
        Application application = new Application();
        application.setName("haha");
        UserDaoImplement userDaoImplement = new UserDaoImplement();
        userDaoImplement.applyUser();
        System.out.println(application);
    }
}
