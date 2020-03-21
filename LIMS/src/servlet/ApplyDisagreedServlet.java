package servlet;

import service.implement.UserServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//拒绝申请
@WebServlet("/applyDisagreedServlet")
public class ApplyDisagreedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取申请人id
        String a_id = request.getParameter("a_id");

        //调用UserService的方法 删除
        UserServiceImplement service = new UserServiceImplement();
        service.applyDisagreed(a_id);

        //重定向回userListServlet
        response.sendRedirect("/applyUserByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
