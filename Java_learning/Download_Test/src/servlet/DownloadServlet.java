package servlet;

import utils.DownloadUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/downloadServlet")
public class DownloadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.请求参数（文件名称）
        String filename = request.getParameter("filename");
        //2.使用字节输入流加载文件进内存
        //2.1找到文件服务器路径
        ServletContext servletContext = this.getServletContext();
        String realPath = servletContext.getRealPath("/source/" + filename);
        //2.2用字节流关联
        FileInputStream fileInputStream = new FileInputStream(realPath);
        //3.设置response的响应头
        //3.1设置响应头类型：content_type
        String mimeType = servletContext.getMimeType(filename);//获取文件的mime类型
        response.setHeader("content_type",mimeType);
        //4.解决中文文件名问题 ———— 使用工具类方法编码文件名
        filename = DownloadUtils.setFileDownloadHeader(request,filename);
        //3.2设置响应头打开方式：content-disposition
        response.setHeader("content-disposition","attachment;filename="+filename);
        //5.将输入流的数据写出到输出流中
        ServletOutputStream servletOutputStream = response.getOutputStream();
        byte[] buff = new byte[1024 * 8];
        int len = 0;
        while ((len = fileInputStream.read(buff)) != -1) {
            servletOutputStream.write(buff,0,len);
        }
        fileInputStream.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
