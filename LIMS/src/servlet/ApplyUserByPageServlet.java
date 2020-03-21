package servlet;

import domain.Application;
import domain.Page;
import domain.User;
import service.implement.UserServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//查看申请表（分页）
@WebServlet("/applyUserByPageServlet")
public class ApplyUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取参数
        //获取当前页码
        String _currentPage = request.getParameter("currentPage");
        //获取每页显示的条数
        String _rows = request.getParameter("rows");
        //未设置参数时 自动设置为...
        if (_currentPage == null || _currentPage.equals("")) {
            _currentPage = "1";
        }
        if (_rows == null || _rows.equals("")) {
            _rows = "1";
        }

        //调用service的方法 分页
        UserServiceImplement service = new UserServiceImplement();
        Page<Application> page = service.findApplyUserByPage(_currentPage, _rows);

        //存入request域
        request.setAttribute("page",page);

        //转发到.jsp
        request.getRequestDispatcher("/shsq.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
