package servlet;

import domain.Application;
import org.apache.commons.beanutils.BeanUtils;
import service.implement.UserServiceImplement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

//成员申请
@WebServlet("/addUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取请求参数列表
        Map<String, String[]> parameterMap = request.getParameterMap();

        //封装对象（使用了spring的BeanUtils.populate()方法封装map）
        Application application = new Application();
        try {
            BeanUtils.populate(application, parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //调用UserService的方法 添加
        UserServiceImplement service = new UserServiceImplement();
        service.addUser(application);

        //提示信息
        //设置编码 为统一resp和jsp的编码
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print("<script>alert('已提交申请，请敬候佳音！');window.location.href='/index.jsp';</script>");
        writer.close();

        //转发到.jsp
        response.sendRedirect("/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
