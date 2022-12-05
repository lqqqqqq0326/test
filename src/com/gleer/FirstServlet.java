package com.gleer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
 * 创建Servlet
 * 1.自定义的Servlet，必须继承HttpServlet
 * 2.通过@WebServlet(urlPatterns="/xxx")注解， 标注当前的Servlet处理的请求地址，一定注意加上/
 * 3.页面中，指定跳转的Servlet控制器
 *      - 3.1 在form表单中action="first"；
 *              - method="post"  doPost方式
 *              - method="get"   doGet方式
 *      - 3.2 在超链接中<a href="first"></a>    doGet方式
 *      - 3.3 在window.location.href="first";  doGet方式
 *      - 3.4 在地址栏中，http://localhost:8899/first  doGet方式
 *
 * Servlet的生命周期
 * 1.实例化 构造器 FirstServlet() （有且只有一次）
 * 2.执行初始化 init()  （有且只有一次）
 * 3.service -> 根据请求方式，来执行doGet、doPost
 * 4.再次访问/first，根据请求方式，来执行doGet、doPost
 * 5.执行销毁 destroy()
 *
 * @WebServlet 注解中的相关属性
 * 1.name属性：当前Servlet的名字，一般建议不重复，建议Servlet类名与此处的name属性一致
 * 2.urlPatterns属性：一定要加上/，可以配置多个，与value属性的意义是一样的；能够处理的请求地址
 * 3.initParams属性：当前Servlet的初始化参数，一般在init()中获取，搭配@WebInitParam(name="键",value="值")注解使用
 * 4.loadOnStartup属性：与servlet启动相关，决定启动顺序，会随着tomcat的启动而创建Servlet，并且值越小越先启动
 * */

@WebServlet(name = "FirstServlet",
urlPatterns = "/first",
        initParams = {@WebInitParam(name="begin",value = "12") , @WebInitParam(name="version",value = "1.0")}/*,
        loadOnStartup = 2*/)
public class FirstServlet extends javax.servlet.http.HttpServlet {
//    构造方法
    public FirstServlet(){
        System.out.println("构造器 FirstServlet()");
        }
        @Override
    public void init() throws ServletException {
        System.out.println("执行初始化 init()");
        //ServletConfig 获取初始化参数:this继承ServletConfig
        String begin = this.getInitParameter("begin");
        String version = this.getInitParameter("version");
        System.out.println("begin = "+begin);
        System.out.println("version = "+version);
        }

     //销毁方法：关闭资源
    @Override
    public void destroy() {
        System.out.println("执行销毁 destroy()");
    }

    //doPost  处理post请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("FirstServlet doPost");
        }
    //doGet  处理get请求
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("FirstServlet doGet");
        }
}
