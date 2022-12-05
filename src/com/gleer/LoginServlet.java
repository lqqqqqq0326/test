package com.gleer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;

/**
 * 请求转发和响应重定向的区别
 * 1.请求转发：将当前请求延续下去的；
 * 响应重定向：会产生新的请求；
 * 2.请求转发：携带请求数据；
 * 响应重定向：无法携带请求数据；
 * 3.请求转发：地址栏未发生变化，显示的是请求地址；
 * 响应重定向：地址栏发生变化，显示的是目标地址；
 * 4.请求转发：只能转发至本项目中的页面；
 * 响应重定向：重定向至任何页面；
 * 5.请求转发：一般建议需要携带数据时使用；
 * 响应重定向：一般建议执行增删改的业务时使用，避免表单重复提交；
 * 6.请求转发：request.getRequestDispatcher("success.jsp").forward(request,response);
 * 响应重定向：response.sendRedirect("success.jsp");
 */
@WebServlet(name = "LoginServlet" , urlPatterns = "/login" )
public class LoginServlet extends HttpServlet {

    public LoginServlet(){
        System.out.println("构造器  LoginServlet()");
    }

    /**
     * doPost 处理方式
     * @param request  请求
     * @param response 响应
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet doPost");

        //request 对请求中文友好处理
        request.setCharacterEncoding("utf-8");
        //response 对请求中文友好处理
        response.setContentType("text/html;charset=utf8");

        //1.接收请求（获得请求参数）
        /*
            方式一：此处的key是与表单中input的name一致
            <input type="text" name="username" placeholder="请输入姓名"/>

            方式二：此处的key是与url?key=value&...中的key一致
            /login?username=张三&password=111&address=安徽&address=江苏
         */
        //getParameter收集一个值
        String username = request.getParameter("username");
        System.out.println(username);
        String password = request.getParameter("password");
        //getParameterValues收集一组name相同的值
        String[] address = request.getParameterValues("address");
        System.out.println(username+" = "+password+" = "+ Arrays.toString(address));

        //收集请求中所有的请求参数  Map<input的name,input中输入的值>
       /* Map<String, String[]> parameterMap = request.getParameterMap();
        Set<String> keys = parameterMap.keySet();
        keys.forEach(key-> System.out.println("==========="+Arrays.toString(parameterMap.get(key))));*/

        //获得响应的输出流
//        PrintWriter out = response.getWriter();

        //2.处理请求
        if(username!=null && !username.equals("") && password!=null && !password.equals("")){
            //3.响应成功
            System.out.println("登陆成功");
//            out.write("<h1 style='color:green'>登陆成功</h1>");

            //设置"请求属性"
//            request.setAttribute("msg","你好！！登陆成功");

            //请求转发至成功页面success.jsp
//            request.getRequestDispatcher("success.jsp").forward(request,response);

            //响应重定向至成功页面success.jsp
            response.sendRedirect("success.jsp");
        }else{
            //3.响应失败
            System.out.println("登陆失败");
//            out.write("<h1 style='color:red'>登陆失败</h1>");

            //请求转发至成功页面error.jsp / FirstServlet
//            request.getRequestDispatcher("error.jsp").forward(request,response);

            //FirstServlet doPost
            //request.getRequestDispatcher("first").forward(request,response);

            //FirstServlet doGet
            response.sendRedirect("first");
        }
//        out.flush();
//        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet doGet");
        this.doPost(request,response);
    }
}
