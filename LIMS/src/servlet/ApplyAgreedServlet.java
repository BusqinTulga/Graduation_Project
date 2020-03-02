package servlet;

import service.implement.UserServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/applyAgreedServlet")
public class ApplyAgreedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取id
        String a_id = request.getParameter("a_id");
        //调用service
        UserServiceImplement service = new UserServiceImplement();
        //添加到user
        service.applyAgreedInsert(a_id);
        //从application删除
        service.applyAgreedDelete(a_id);
        //重定向到applyUserServlet
        response.sendRedirect("/applyUserServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
