package servlet;

import domain.User;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//查询成员信息
@WebServlet("/userListServlet")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //调用UserService的方法 查询
        UserServiceImplement service = new UserServiceImplement();
        List<User> members = service.findAll();

        //将list存入request域
        request.setAttribute("member",members);

        //转发回cyxx.jsp
        request.getRequestDispatcher("/cyxx.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
