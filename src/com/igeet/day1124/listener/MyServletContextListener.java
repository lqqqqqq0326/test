package com.igeet.day1124.listener;
import com.igeet.day1124.utils.JDBCUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.sql.SQLException;

/**
 * 如何定义一个监听器
 * 1.新建Java类 implements 监听器
 * 2.使用@WebListener()注解
 */
@WebListener()
public class MyServletContextListener implements ServletContextListener{
    public MyServletContextListener() {
        System.out.println("MyServletContextListener 实例化");
    }
    public void contextInitialized(ServletContextEvent event) {

        System.out.println("容器启动 - 上下文对象创建");
    }


    public void contextDestroyed(ServletContextEvent event) {

        System.out.println("容器关闭 - 上下文对象销毁");
    }
}
