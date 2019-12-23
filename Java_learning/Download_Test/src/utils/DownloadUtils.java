package utils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class DownloadUtils {
    public static String setFileDownloadHeader(HttpServletRequest request, String filename) throws UnsupportedEncodingException {
        //获取user-agent请求头
        final String agent = request.getHeader("USER-AGENT");
        if (agent.contains("MSIE"))
        {
            // IE浏览器
            filename = URLEncoder.encode(filename, "utf-8");
            filename = filename.replace("+", " ");
        }
        else if (agent.contains("Firefox"))
        {
            // 火狐浏览器
            filename = new String(filename.getBytes(), "ISO8859-1");
        }
        else
        {
            // 其它浏览器
            filename = URLEncoder.encode(filename, "utf-8");
        }
        return filename;
    }
}
