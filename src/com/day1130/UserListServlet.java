package com.day1130;

import com.igeet.day1124.dao.UserDao;
import com.igeet.day1124.entity.User;
import com.igeet.day1124.utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserListServlet",urlPatterns = "/users")
public class UserListServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

    private void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        UserDao dao = new UserDao();
        try{
            List<User> userList = dao.selectAll();
            request.setAttribute("users",userList);
            request.getRequestDispatcher("/testJSTL/testForEach.jsp");
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            JDBCUtils.close();
        }
    }
}
