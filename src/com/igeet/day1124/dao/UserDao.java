package com.igeet.day1124.dao;


import com.igeet.day1124.entity.User;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * @version 1.0
 * @Description UserDao - 用户的数据交互层
 */
public class UserDao extends BaseDao<User> {

    //插入用户信息
    public int insertUser(User user) throws SQLException {
        String sql = "insert into user values(null,?,?,?,?,?,?,?,default)";
        Date birthday = user.getBirthday();
        Date now = new Date();
        int age = now.getYear() - birthday.getYear();
        int i = this.update(sql,
                user.getName(),user.getPwd(),user.getGender(),
                user.getBirthday(),age+1,user.getEmail(),user.getPhoto());
        return i;
    }

    //通过姓名和密码查询用户信息
    public User selectOne(String name,String pwd) throws SQLException {
        String sql = "select * from user where name = ? and pwd = ?";
        User user = this.getBean(sql, User.class, name, pwd);
        return user;
    }

    //查询所有用户信息
    public List<User> selectAll() throws SQLException {
        String sql = "select * from user";
        List<User> list = this.getBeanList(sql, User.class);
        return list;
    }
}

