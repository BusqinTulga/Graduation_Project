package servlet;

import service.implement.UserServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//留言上传
@WebServlet("/leaveMessageServlet")
public class LeaveMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取请求参数
        String message = request.getParameter("message");

        //调用service的方法 修改
        UserServiceImplement service = new UserServiceImplement();
        service.leaveMessage(message);

        //提示信息
        //设置编码 为统一resp和jsp的编码
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print("<script>alert('您已成功留言！');window.location.href='/index.jsp';</script>");
        writer.close();

        //重定向到.jsp
        response.sendRedirect("/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
