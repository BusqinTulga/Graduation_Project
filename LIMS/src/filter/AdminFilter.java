package filter;

import domain.User;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/*")
public class AdminFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        //强制类型转换
        HttpServletRequest request = (HttpServletRequest) req;

        //获取资源请求路径
        String uri = request.getRequestURI();

        //判断是否包含 登录后才可浏览 的相关路径
        if (uri.contains("/admin.jsp") || uri.contains("/cyxx.jsp") || uri.contains("/shsq.jsp") || uri.contains("/xgxz.jsp")) {
            //提前获取用户数据session
            HttpSession session = request.getSession();
            //强制类型转换(User)
            User user = (User)session.getAttribute("user");

            if (uri.contains("/xgxz.jsp")) {
                //判断user的值
                if (user != null) {
                    //放行
                    chain.doFilter(req,resp);
                }
                else {
                    //没有登录 不放行

                    //提示信息
                    //设置编码 为统一resp和jsp的编码
                    resp.setContentType("text/html; charset=UTF-8");
                    PrintWriter writer = resp.getWriter();
                    writer.print("<script>alert('请先登录！');window.location.href='/login.jsp';</script>");
                    writer.close();

                    //转发到login.jsp
                    request.getRequestDispatcher("/login.jsp").forward(request,resp);
                }
            }

            if (uri.contains("/admin.jsp") || uri.contains("/cyxx.jsp") || uri.contains("/shsq.jsp")) {
                //判断user和user.authority的值
                if (user != null && user.getAuthoritiy() == 1) {
                    //管理员 放行
                    chain.doFilter(req,resp);
                }
                else {
                    //不是管理员 不放行

                    //提示信息
                    //设置编码 为统一resp和jsp的编码
                    resp.setContentType("text/html; charset=UTF-8");
                    PrintWriter writer = resp.getWriter();
                    writer.print("<script>alert('管理员用户才可访问！');window.location.href='/login.jsp';</script>");
                    writer.close();

                    //转发到login.jsp
                    request.getRequestDispatcher("/login.jsp").forward(request,resp);
                }
            }
        }
        else {
            //不包含 登录后才可浏览 的相关路径 放行
            chain.doFilter(req, resp);
        }
    }

    public void destroy() {
    }
}