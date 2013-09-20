package com.softfz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.softfz.dao.dto.Admin;
import com.softfz.dao.dto.Goods;
import com.softfz.dao.dto.User;
import com.softfz.dao.impl.AdminDao;
import com.softfz.dao.impl.UserDao;
import com.softfz.dao.inf.IAdminDao;
/**
 * 前台用户操作类
 * @author wizard
 *
 */
public class UserServlet extends HttpServlet {

	public UserServlet() {
	}
	public void destroy() {
	}
	public void init() throws ServletException {
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String method=request.getParameter("method");
		UserDao userDao = new UserDao();
		
		if(method.equals("add")){//增加用户
			String username=request.getParameter("username");
			String password=request.getParameter("pwd");
			String realName=request.getParameter("realName");
			String sex=request.getParameter("sex");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String postCode=request.getParameter("postCode");
			String role =request.getParameter("role");
			if(role==null||role.equals(""))role="9";
			String slock=request.getParameter("slock");
			if(slock==null||slock.equals(""))slock="0";
			User user = new User(username,password,realName,sex,birthday,postCode,address,phoneNumber,email,role,slock);
			boolean b=userDao.addUser(user);
			if(b){//增加用户成功后，返回用户列表
				out.println("<script>window.alert('注册成功，现在您可以登陆了！');window.location.href='" 
						+request.getContextPath()+"/front/login.jsp'</script>");
			}
			else{
				out.println("<script>window.alert('用户名已存在，请重新输入注册！');history.back(-1);</script>");
			}
		}
		else if(method.equals("addFromBack")){
			String username=request.getParameter("username");
			String password=request.getParameter("pwd");
			String realName=request.getParameter("realName");
			String sex=request.getParameter("sex");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String postCode=request.getParameter("postCode");
			String role =request.getParameter("role");
			if(role==null||role.equals(""))role="9";
			String slock=request.getParameter("slock");
			if(slock==null||slock.equals(""))slock="0";
			User user = new User(username,password,realName,sex,birthday,postCode,address,phoneNumber,email,role,slock);
			boolean b=userDao.addUser(user);
			if(b){//增加用户成功后，返回用户列表
				List<Goods> userList= userDao.userList(request);
				request.setAttribute("userList", userList);
				request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
			}
			else{
				out.println("<script>window.alert('用户名已存在，请重新输入！');history.back(-1);</script>");
			}
		}
		else if(method.equals("update")){ //后台更新用户信息
			String username=request.getParameter("username");
			String password=request.getParameter("pwd");
			String realName=request.getParameter("realName");
			String sex=request.getParameter("sex");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String postCode=request.getParameter("postCode");
			String role =request.getParameter("role");
			String slock=request.getParameter("slock");
			User user = new User(username,password,realName,sex,birthday,postCode,address,phoneNumber,email,role,slock);
			userDao.updateUserBack(user);
			//增加用户成功后，返回用户列表
			List<Goods> userList= userDao.userList(request);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
		}
		else if(method.equals("updateFront")){//前台更新用户信息
			User loginUser = (User)session.getAttribute("loginUser");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			if(!password.equals(loginUser.getPassword())){
				out.println("<script>window.alert('密码不正确');window.location.href='"
							+ request.getContextPath()
							+ "/front/userInfo.jsp';</script>");
				out.flush();
				out.close();
				return;
			}
			//判断是否修改密码
			String pwd1=request.getParameter("pwd1");
			if(pwd1==null||pwd1.equals("")){
				pwd1=password;
			}
			String realName=request.getParameter("realName");
			String sex=request.getParameter("sex");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String postCode=request.getParameter("postCode");
			
			User user = new User(username,pwd1,realName,sex,birthday,postCode,address,phoneNumber,email);
			userDao.updateUserFront(user);
			
			//修改session信息
			session.setAttribute("loginUser", userDao.getSingleUser(new User(username,pwd1)));
			//显示信息，跳转页面
			out.println("<script>window.alert('更新成功！');window.location.href='"
							+ request.getContextPath()
							+ "/front/userInfo.jsp';</script>");
			out.flush();
			out.close();
		}
		else if(method.equals("list")){//返回用户列表
			List userList=userDao.userList(request);
			String name=request.getParameter("name");
			//request.setAttribute("name", name);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
		}
		else if(method.equals("del")){//删除用户
			String username=request.getParameter("username");
			boolean flag=userDao.delUser(username);
			String info="";
			if(flag){
				info="删除成功";
			}
			else{
				info="删除失败";
			}
			out.println("<script>alert('"+info+"')</script>");
			//删除用户后，返回用户列表
			List<Goods> userList= userDao.userList(request);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
		}
		else if(method.equals("logout")){//退出登陆
			session.setAttribute("loginUser", null);
			out.println("<script>window.alert('已安全退出！');window.location.href='"
					+ request.getContextPath()
					+ "/index.jsp';</script>");
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}



}
