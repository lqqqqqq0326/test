package com.igeet.day1124.serviet;

import com.igeet.day1124.entity.User;
import com.igeet.day1124.service.UserService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

//@MultipartConfig  开启当前Servlet支持文件上传功能
@MultipartConfig
@WebServlet(name = "UserServlet" , urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //对请求做中文友好处理
//        request.setCharacterEncoding("UTF-8");

        UserService userService = new UserService();

        //获取会话对象
        HttpSession session = request.getSession();

        //获取请求参数，判断执行的操作
        String code = request.getParameter("code");
        if(code!=null&&!code.equals("")){
            switch (code){
                case "login":     //登陆
                    //1.获取注册表单中的请求参数
                    String name = request.getParameter("name");
                    String pwd = request.getParameter("pwd");
                    System.out.println(name+" = "+pwd);
                    if(name!=null && !name.equals("") && pwd!=null && !pwd.equals("")){
                        User user = userService.login(name, pwd);
                        if(user!=null){
                            String state = user.getState();
                            switch (state){
                                case "0":
                                    request.setAttribute("msg","当前账户未审核，请耐心等待");
                                    request.getRequestDispatcher("userLogin.jsp").forward(request,response);
                                    break;
                                case "1": //账户审核通过
                                    //选择免登陆后，添加Cookie
                                    String timeLength = request.getParameter("timeLength");
                                    if(timeLength!=null && !timeLength.equals("0")){
                                        //设置Cookie的有效时间
                                        int days = Integer.parseInt(timeLength);

                                        //1.创建Cookie对象  URLEncoder编码
                                        Cookie nameCookie = new Cookie("nameCookie", URLEncoder.encode(name,"utf8"));
                                        Cookie pwdCookie = new Cookie("pwdCookie",pwd);

                                        //2.设置Cookie的有效期
                                        nameCookie.setMaxAge(days*24*60*60);
                                        pwdCookie.setMaxAge(days*24*60*60);

                                        //3.将Cookie添加至响应中，响应至客户端浏览器
                                        response.addCookie(nameCookie);
                                        response.addCookie(pwdCookie);
                                    }

                                    //获取上下文对象
                                    ServletContext sc = this.getServletContext();

                                    //获得上下文初始化参数
                                    String abc = sc.getInitParameter("abc");
                                    System.out.println("abc = "+abc);
                                    //获取当前项目的部署相对路径  /
                                    System.out.println(sc.getContextPath());
                                    //获取当前项目的发布路径 E:\100\5.JavaWeb\code\javaee\out\artifacts\javaee_war_exploded\
                                    System.out.println(sc.getRealPath("/"));


                                    //将登陆成功者的信息存储至请求域中  "不合理"
//                                    request.setAttribute("user",user);
                                    //将登陆成功者的信息存储至会话作用域中
                                    session.setAttribute("u",user);
                                    //设置最大非活动时间
                                    session.setMaxInactiveInterval(60*60*2); //2h


                                    request.getRequestDispatcher("success.jsp").forward(request,response);
                                    break;
                                case "2":
                                    request.setAttribute("msg","当前账户审核失败，请重新申请");
                                    request.getRequestDispatcher("userLogin.jsp").forward(request,response);
                                    break;
                            }
                        }else{
                            request.setAttribute("msg","姓名和密码不匹配");
                            request.getRequestDispatcher("userLogin.jsp").forward(request,response);
                        }
                    }else{
                        request.setAttribute("msg","姓名或密码不能为空");
                        request.getRequestDispatcher("userLogin.jsp").forward(request,response);
                    }

                    break;
                case "register":  //注册
                    //1.获取注册表单中的请求参数
                    name = request.getParameter("name");
                    pwd = request.getParameter("pwd");
                    String gender = request.getParameter("gender");
                    String email = request.getParameter("email");
                    String birthdayStr = request.getParameter("birthday");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date birthday = null;
                    try {
                        birthday = sdf.parse(birthdayStr);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    User user = new User(name,pwd,gender,birthday,email);

                    //获取表单中上传的文件信息（先获取普通域，再获取文件上传的信息）
                    Part part = request.getPart("photo");
                    if(part!=null){
                        String oldName = part.getHeader("content-disposition");
                        //oldName = form-data; name="photo"; filename="test1.png"
                        System.out.println("oldName = "+oldName);

                        //实际有上传图片
                        if(oldName!=null && oldName.lastIndexOf(".")>0){
                            //制作新的名字 = 随机数 + 原图片的后缀名 .png
                            String newName = UUID.randomUUID()+oldName.substring(oldName.lastIndexOf("."),oldName.length()-1);

                            //给用户设置头像信息
                            user.setPhoto("/pic/"+newName);
                            //写出上传的图片，至图片服务器路径
                            part.write("D://lesson//pic//"+newName);
                        }
                    }

                    //2.执行注册的业务逻辑
                    boolean flag = userService.register(user);
                    //3.根据注册的结果，进行页面跳转
                    if(flag){
                        //4.注册成功
                        //传递请求属性，将注册成功的用户姓名回显至登陆界面
                        request.setAttribute("name",request.getParameter("name"));
                        request.getRequestDispatcher("userLogin.jsp").forward(request,response);

                        //避免重复提交表单
                        response.sendRedirect("userLogin.jsp");
                    }else{
                        request.setAttribute("msg","注册失败");
                        request.getRequestDispatcher("userRegister.jsp").forward(request,response);
                    }
                    break;
                case "logout": //登出
                    //立即销毁会话
                    session.invalidate();
                    request.setAttribute("msg","已登出");
                    request.getRequestDispatcher("userLogin.jsp").forward(request,response);
                    break;
            }
        }else{
            request.setAttribute("msg","操作不正确");
            request.getRequestDispatcher("userRegister.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}

