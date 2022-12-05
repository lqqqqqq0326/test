package com.igeet.day1124.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.*;

public class JDBCUtils {
    //数据源
    private static ComboPooledDataSource dateSource = new ComboPooledDataSource("mysql");
    public static ComboPooledDataSource getDateSource(){
        return dateSource;
    }
    private static ThreadLocal<Connection> t1 = new ThreadLocal<>();
    //静态的 获取连接的方法
    public static Connection getConn(){
        //从线程变量中获取连接
        Connection connection = t1.get();
        try{
            //第一次获取连接对象，可能会出现null  或者已经关闭的情况
            if(connection==null || connection.isClosed()){
                //从数据源中获取连接
                connection = dateSource.getConnection();
                //将连接对象存储至线程变量中
                t1.set(connection);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return connection;
    }
    //静态的  释放资源的方法
    public static void close(){
        Connection connection = t1.get();
        try{
            if(connection !=null && !connection.isClosed()){
                connection.close();
                t1.remove();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
