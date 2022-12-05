package com.day1129.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ScopeServlet" , urlPatterns = "/scope")
public class ScopeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        this.doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
//请求域传值
        request.setAttribute("name", "李四");
//获得会话
        HttpSession session = request.getSession();
        session.setAttribute("name", "张三");
//获得上下文
        ServletContext sc = request.getServletContext();
        sc.setAttribute("name" , "王二");
//跳转页面
        request.getRequestDispatcher("scope.jsp").forward(request, response);
    }
}
