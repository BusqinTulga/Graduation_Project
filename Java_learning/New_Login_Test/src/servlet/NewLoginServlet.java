package servlet;

import dao.UserDao;
import domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/newLoginServlet")
public class NewLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //获取请求参数
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String checkcode = request.getParameter("checkcode");
        //先获取生成的验证码
        HttpSession session = request.getSession();
        String checkcode_session = (String) session.getAttribute("checkcode_session");
        //删除session中存储的验证码
        session.removeAttribute("checkcode_session");
        //先判断验证码是否正确
        //忽略大小写比较
        if(checkcode_session != null && checkcode_session.equalsIgnoreCase(checkcode)){
            //验证码正确
            //判断用户名和密码是否一致
            //封装user对象
            User loginUser = new User();
            loginUser.setName(name);
            loginUser.setPassword(password);
            //调用UserDao的login方法
            UserDao dao = new UserDao();
            User user = dao.login(loginUser);
            if(user == null){
                //登录失败
                //存储提示信息到request
                request.setAttribute("login_error","用户名或密码错误!");
                //转发到登录页面
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }else{
                //登录成功
                //存储信息，用户信息
                session.setAttribute("user",name);
                //重定向到success.jsp
                response.sendRedirect(request.getContextPath()+"/success.jsp");
            }
        }else{
            //验证码不一致
            //存储提示信息到request
            request.setAttribute("cc_error","验证码错误!");
            //转发到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
