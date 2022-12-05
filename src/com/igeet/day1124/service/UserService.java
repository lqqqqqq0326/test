package com.igeet.day1124.service;


import com.igeet.day1124.dao.UserDao;
import com.igeet.day1124.entity.User;
import com.igeet.day1124.utils.JDBCUtils;

import java.sql.SQLException;

/**
 * @version 1.0
 * @Description UserService - 用户业务逻辑层
 */
public class UserService {

    private UserDao dao = new UserDao();

    //注册
    public boolean register(User user){
        try {
            //返回受影响的行数
            int i = dao.insertUser(user);
            return i>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close();
        }
        return false;
    }

    //登陆
    public User login(String name,String pwd){
        User user = null;
        try {
            user = dao.selectOne(name,pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close();
        }
        return user;
    }

}

