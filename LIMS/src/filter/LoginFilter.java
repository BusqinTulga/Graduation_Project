package filter;

import domain.User;
import javafx.scene.control.Alert;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //强制转换
        HttpServletRequest request = (HttpServletRequest) req;
        //获取资源请求路径
        String uri = request.getRequestURI();
        //判断是否包含 登陆后才可浏览 的相关路径
        if (uri.contains("/admin.jsp") || uri.contains("/cyxx.jsp") || uri.contains("/shsq.jsp") || uri.contains("/xgxz.jsp")) {
            //包含登录这些页面需要过滤
            HttpSession session = request.getSession();
            //此方法真牛逼 强制类型转换(User)
            User user = (User)session.getAttribute("user");
            
            if (user != null && user.getAuthoritiy() == 1) {
                chain.doFilter(req,resp);
            }
            else {
                request.getRequestDispatcher("/login.jsp").forward(request,resp);
            }
        }
        else {
            //不包含 放行
            chain.doFilter(req, resp);
        }
    }

    public void destroy() {
    }
}

//uri.contains("/css/") || uri.contains("/image/") ||