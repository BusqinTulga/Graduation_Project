package servlet;

import domain.User;
import service.implement.UserServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

//成员申请
@WebServlet("/addUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //获取参数
        //Map<String, String[]> parameterMap = request.getParameterMap();
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        //封装对象
        User user = new User();
        user.setName(name);
        user.setGender(gender);
        //调用service保存
        UserServiceImplement service = new UserServiceImplement();
        service.addUser(user);
        //提示信息

        //转发到.jsp
        response.sendRedirect("jrwm.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
