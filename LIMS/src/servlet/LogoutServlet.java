package servlet;

import domain.User;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//注销登录
@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取session
        HttpSession session = request.getSession();

        //如果session不为空
        if (session != null) {
            //强制类型转换
            User user = (User) session.getAttribute("user");
            if (user != null) {
                //添加最后登录时间
                //获取id
                int id = user.getId();

                //调用service的方法 添加
                UserServiceImplement service = new UserServiceImplement();
                service.addLastTimeLogin(id);

                //删除user
                session.removeAttribute("user");
            }
            else {
                //无事发生
            }
        }
        else {
            //无事发生
        }
            //重定向回index.jsp
            response.sendRedirect("/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
