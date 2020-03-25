package servlet;

import domain.Message;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

//查看留言
@WebServlet("/findMessageServlet")
public class FindMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码
        request.setCharacterEncoding("utf-8");

        //调用service的方法 查询
        UserServiceImplement service = new UserServiceImplement();
        List<Message> messages = service.findMessage();

        System.out.println(messages);

        //存入session
        HttpSession session = request.getSession();
        session.setAttribute("message",messages);

        //转发到.jsp
        request.getRequestDispatcher("/ckly.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
