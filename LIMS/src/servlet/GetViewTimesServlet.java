package servlet;

import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/getViewTimesServlet")
public class GetViewTimesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用UserService的方法 查询
        UserServiceImplement service = new UserServiceImplement();
        int viewTimes = service.getViewTimes();

        //存入session
        HttpSession session = request.getSession();
        session.setAttribute("view_times",viewTimes);
        response.sendRedirect("/admin.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
