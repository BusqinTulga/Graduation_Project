package servlet;

import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

//登录
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //设置编码
        req.setCharacterEncoding("utf-8");

        //获取请求参数列表
        Map<String, String[]> map = req.getParameterMap();

        //封装user对象（使用了spring的BeanUtils.populate()方法封装map）
        User loginUser = new User();
        try {
            BeanUtils.populate(loginUser, map);
        } catch (IllegalAccessException e) {
            System.out.println("try { BeanUtils.populate(loginUser, map); }");
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            System.out.println("try { BeanUtils.populate(loginUser, map); }");
            e.printStackTrace();
        }

        //调用UserService的方法 查询
        UserServiceImplement service = new UserServiceImplement();
        User user = service.login(loginUser);

        //判断user的值
        if (user == null) {
            //登录失败
            req.setAttribute("login_message","用户名或密码错误！");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
        else {
            //登陆成功

            //登录次数+1
            //调用UserService的方法 修改
            service.addLoginTimes(loginUser);

            //提前将用户数据存入session
            HttpSession session = req.getSession();
            session.setAttribute("user",user);

            //验证用户类型
            Integer authoritiy = user.getAuthoritiy();
            if (authoritiy == 1) {
                //管理员 重定向到admin.jsp
                resp.sendRedirect("/admin.jsp");
            }
            else {
                //普通用户 重定向回index.jsp
                resp.sendRedirect("index.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
