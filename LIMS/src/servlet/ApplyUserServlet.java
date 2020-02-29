package servlet;

import domain.Application;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/applyUserServlet")
public class ApplyUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用service进行查询
        UserServiceImplement service = new UserServiceImplement();
        List<Application> applications = service.applyUser();
        //将list存入request
        request.setAttribute("application", applications);
        //转发到.jsp
        request.getRequestDispatcher("/shsq.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
