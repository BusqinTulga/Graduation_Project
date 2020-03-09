package filter;

import com.mysql.cj.Session;
import service.implement.UserServiceImplement;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class IndexFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        //强制类型转换
        HttpServletRequest request = (HttpServletRequest) req;
        //获取资源请求路径
        String uri = request.getRequestURI();
        //访问index.jsp时 如果
        if(uri.contains("/index.jsp")) {
            //转发到servlet
            
            //继续放行
            chain.doFilter(req, resp);
        }
        else {
            //继续放行
            chain.doFilter(req, resp);
        }
    }

    public void destroy() {
    }
}
