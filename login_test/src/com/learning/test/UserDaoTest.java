package com.learning.test;

import com.learning.dao.UserDao;
import com.learning.domain.User;
import org.junit.Test;

public class UserDaoTest {
    @Test
    public void testLogin() {
        User loginuser = new User();
        loginuser.setName("图力嘎");
        loginuser.setPassword("tuliga123");

        UserDao dao = new UserDao();
        User user = dao.login(loginuser);

        System.out.println(user);
    }
}
