package servlet;

import service.implement.UserServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//同意申请
@WebServlet("/applyAgreedServlet")
public class ApplyAgreedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取申请人id
        String a_id = request.getParameter("a_id");

        //调用UserService的方法 添加 删除
        UserServiceImplement service = new UserServiceImplement();
        //添加到user表
        service.applyAgreedInsert(a_id);
        //从application表删除
        service.applyAgreedDelete(a_id);

        //重定向回applyUserServlet
        response.sendRedirect("/applyUserServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
