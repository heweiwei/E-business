package com.softfz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.softfz.dao.dto.Admin;
import com.softfz.dao.dto.User;
import com.softfz.dao.impl.AdminDao;
import com.softfz.dao.impl.UserDao;
/**
 * 前后台登陆验证,根据url中传递的method变量的值来确定执行的业务
 * method=front,前台登陆验证
 * method=back，后台登陆验证
 * @author Administrator
 *
 */
public class LoginServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String method=request.getParameter("method");
		String rand=request.getParameter("rand");
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		String filePath = this.getServletContext().getRealPath("/WEB-INF/classes/admin.xml");
		AdminDao adminDao = new AdminDao(filePath);
		Admin returnAdmin = null;
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		if(method.equals("back")){//后台用户登陆
			session.setAttribute("inputNameBack", username);
			try {
				returnAdmin = adminDao.getSingleUser(admin);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(!rand.equals(session.getAttribute("rand"))){
				
				out.println("<script>window.alert('验证码不正确，请重新输入！');window.location.href='"
								+ request.getContextPath()
								+ "/back/login.jsp';</script>");
				out.flush();
				out.close();
			}
			else if (returnAdmin== null) {
				out.println("<script>window.alert('用户名或者密码不正确');window.location.href='"
								+ request.getContextPath()
								+ "/back/login.jsp';</script>");
				out.flush();
				out.close();
			}else
			{
				session.setAttribute("loginUserBack", returnAdmin);
				session.setAttribute("loginUser", null);
				request.getRequestDispatcher("/back/main.jsp").forward(request, response);
			}
		}
		else if(method.equals("front")){//前台用户登陆
			UserDao userDao = new UserDao();
			session.setAttribute("inputNameFront", username);
			User user= new User();
			user.setUsername(username);
			user.setPassword(password);
			User returnUser=null;
			try {	
				returnUser=userDao.getSingleUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(!rand.equals(session.getAttribute("rand"))){
				out.println("<script>window.alert('验证码不正确，请重新输入！');window.location.href='"
								+ request.getContextPath()
								+ "/front/login.jsp';</script>");
			}
			else if (returnUser== null) {
				out.println("<script>window.alert('用户名或者密码不正确');window.location.href='"
								+ request.getContextPath()
								+ "/front/login.jsp';</script>");
			}
			else if (returnUser.getSlock().equals("1")) {
				out.println("<script>window.alert('此用户被冻结！请联系管理员');window.location.href='"
								+ request.getContextPath()
								+ "/back/main.jsp';</script>");
			}
			else
			{			
				boolean flag=userDao.updateLog(returnUser);//更新登陆信息
				if(flag){//登陆成功
					session.setAttribute("loginUser", returnUser);
					session.setAttribute("loginUserBack", null);
					//检查用户当前是否要结帐
					Boolean checkout=(Boolean)session.getAttribute("checkout");
					if(checkout==null){
						checkout=false;
					}
					if(checkout==true){
						request.getRequestDispatcher("/front/orderInfo.jsp").forward(request, response);
					}
					else{
						request.getRequestDispatcher("/front/userInfo.jsp").forward(request, response);
					}
				}
				else{
					out.println("<script>window.alert('未知错误！请联系管理员');window.location.href='"
							+ request.getContextPath()
							+ "/index.jsp';</script>");
				}
			}
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
