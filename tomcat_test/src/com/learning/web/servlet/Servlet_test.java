package com.learning.web.servlet;

import javax.servlet.*;
import java.io.IOException;

public class Servlet_test implements Servlet {
    //初始化方法
    //在Servlet创建时执行，只会执行一次
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        System.out.println("init~~~");
    }
    //获取ServletConfig对象
    //ServletConfig是Servlet的配置对象
    @Override
    public ServletConfig getServletConfig() {
        return null;
    }
    //提供服务的方法
    //每一次Servlet被访问时执行，会执行多次
    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        System.out.println("service~~~");
    }
    //获取Servlet的信息，版本、作者...
    @Override
    public String getServletInfo() {
        return null;
    }
    //销毁方法
    //在服务器正常关闭时（Servlet被销毁时）执行，只会执行一次
    @Override
    public void destroy() {
        System.out.println("distroy~~~");
    }
}
