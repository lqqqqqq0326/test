package com.igeet.day1124.listener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * 创建一个会话属性监听器
 * 1.自定义一个监听器 implements  HttpSessionAttributeListener
 * 2.HttpSessionBindingEvent 事件用来监听会话中的属性是否发生变化
 * 3.会话中属性添加、移除、替换 ，触发会话绑定事件
 */
@WebListener()
public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener {
    public MyHttpSessionAttributeListener() {
        System.out.println("MyHttpSessionAttributeListener 实例化");
    }
    public void attributeAdded(HttpSessionBindingEvent event) {
        String name = event.getName();
        Object value = event.getValue();
        System.out.println("添加会话属性：name = "+name +" , value = "+value);
    }
    public void attributeRemoved(HttpSessionBindingEvent event) {
        System.out.println("移除会话属性：name = "+event.getName());
    }
    public void attributeReplaced(HttpSessionBindingEvent event){
        System.out.println("替换会话属性：name = "+event.getName()+",value = "+event.getValue());
    }
}
