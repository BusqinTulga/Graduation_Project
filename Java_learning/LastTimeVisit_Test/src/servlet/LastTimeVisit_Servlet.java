package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/lastTimeVisit_Servlet")
public class LastTimeVisit_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应的消息体的数据格式以及编码
        response.setContentType("text/html;charset=utf-8");
        //获取所有cookie
        Cookie[] cookies = request.getCookies();
        boolean flag = false;

        //遍历cookie数组
        if(cookies != null || cookies.length > 0) {
            for (Cookie cookie : cookies) {
                //获取cookie的名称
                String name = cookie.getName();
                //判断名称是否是lasttime
                if ("lasttime".equals(name)) {
                    //有该cookie，不是第一次访问
                    flag = true;
                    //设置cookie的值
                    //获取当前时间的字符串，重新设置cookie的值，重新发送
                    Date date = new Date();
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年mm月dd日 hh:mm:ss");
                    String string_date = simpleDateFormat.format(date);
                    //URL编码
                    string_date = URLEncoder.encode(string_date,"utf-8");
                    //设置cookie存活时间
                    cookie.setMaxAge(60 * 60 * 24 * 30);    //一个月
                    response.addCookie(cookie);

                    //响应数据
                    //获取cookie的value，时间
                    String value = cookie.getValue();
                    //URL解码
                    value = URLDecoder.decode(value,"utf-8");
                    response.getWriter().write("欢迎回来，您的上次访问时间为："+value);

                    break;
                }
            }
        }

        //遍历cookie数组
        if (cookies == null || cookies.length == 0 || flag == false) {
            //没有该cookie，第一次访问
            //设置cookie的value，时间
            //获取当前时间的字符串，重新设置cookie的值，重新发送
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年mm月dd日hh:mm:ss");
            String string_date = simpleDateFormat.format(date);
            //URL编码
            string_date = URLEncoder.encode(string_date,"utf-8");
            Cookie cookie = new Cookie("lasttime",string_date);
            //设置cookie存活时间
            cookie.setMaxAge(60 * 60 * 24 * 30);    //一个月
            response.addCookie(cookie);
            response.getWriter().write("欢迎您，首次访问！");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
