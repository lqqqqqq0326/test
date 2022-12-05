package com.igeet.day1124.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalTime;

/**
 * LoginFilter 登陆过滤器 - 实现登陆访问控制
 */
@WebFilter(filterName = "f2" , urlPatterns = {"/blank.jsp","/first","/testJSP/*"} ,
        initParams = {@WebInitParam(name="begin",value = "14") , @WebInitParam(name="end",value = "15")})
public class LoginFilter implements Filter {

    private Integer begin;
    private Integer end;

    public LoginFilter() {
        System.out.println("LoginFilter 实例化");
    }

    public void destroy() {
        System.out.println("LoginFilter 销毁");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("LoginFilter doFilter...");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("u");

        //获取当前时间
        int hour = LocalTime.now().getHour();
        if (hour < begin || hour > end) {
            if (obj == null) {
                //未登陆，则不放行，跳转至登陆界面
                request.setAttribute("msg", "当前资源必须登陆后访问");
                request.getRequestDispatcher(request.getContextPath() + "/userLogin.jsp").forward(request, resp);
                return;
            }
        }

        //放行
        //过滤链  链接到下一个资源，下一个资源：可能是过滤器，也可能是目标资源
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        begin = Integer.parseInt(config.getInitParameter("begin"));
        end = Integer.parseInt(config.getInitParameter("end"));
        System.out.println("LoginFilter 初始化");
    }
}

