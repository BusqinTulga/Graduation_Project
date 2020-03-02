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

        //获取请求参数
        Map<String, String[]> map = req.getParameterMap();
        //封装user对象
        User loginUser = new User();
        try {
            BeanUtils.populate(loginUser, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用service
        UserServiceImplement service = new UserServiceImplement();
        User user = service.login(loginUser);

        //判断user
        if (user == null) {
            //登录失败
            req.getRequestDispatcher("/failServlet").forward(req, resp);
        }

        //到此用户必定能登录
        //提前将用户数据存入session
        HttpSession session = req.getSession();
        session.setAttribute("user",user);

        //验证权限
        Integer authoritiy = user.getAuthoritiy();
        if (authoritiy == 1) {
            resp.sendRedirect("/admin.jsp");
        }
        else {
            //重定向回主页
            resp.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
