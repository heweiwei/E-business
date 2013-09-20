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
import com.softfz.dao.impl.AdminDao;
/**
 * 后台用户操作类
 * method=add 添加管理员
 * method=del 删除管理员
 * method=update 更新管理员
 * method=list 查询管理员
 * method=logout 管理员退出登陆
 * @author wizard
 *	
 */
public class AdminServlet extends HttpServlet {

	public AdminServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session=request.getSession();
		String method=request.getParameter("method");
		String addInfo=null;
		String filePath = this.getServletContext().getRealPath("/WEB-INF/classes/admin.xml");
		AdminDao adminDao=new AdminDao(filePath);
		if(method==null){
			addInfo="url错误";
		}else if(method.equals("add")){//添加管理员
			String username=request.getParameter("username");
			String password=request.getParameter("pwd");
			String realName=request.getParameter("realName");
			String sex=request.getParameter("sex");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String postCode=request.getParameter("postCode");
			String role= request.getParameter("role");
			Admin admin= new Admin(username,password,realName,sex,birthday,email,phoneNumber,address,postCode,role);	
			try {
				addInfo=adminDao.addUser(admin);
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.println("<script>window.alert('"+addInfo+"');window.location.href='"
					+ request.getContextPath()
					+ "/servlet/AdminServlet?method=list';</script>");
			//response.sendRedirect(request.getContextPath()+"/servlet/AdminServlet?method=list");
		}else if(method.equals("del")){//删除管理员
			String username=(String)request.getParameter("username");
			try {
				adminDao.delUser(username);
				response.sendRedirect(request.getContextPath()+"/servlet/AdminServlet?method=list");
				addInfo="删除成功！";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(method.equals("update")){//更新管理员
			String username=request.getParameter("username");
			String password=request.getParameter("pwd");
			String realName=request.getParameter("realName");
			String sex=request.getParameter("sex");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String postCode=request.getParameter("postCode");
			Admin admin= new Admin(username,password,realName,sex,birthday,email,phoneNumber,address,postCode);
					
			try {
				addInfo=adminDao.updateUser(admin);			
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath()+"/servlet/AdminServlet?method=list");
		}else if(method.equals("list")){//查询管理员
			Admin admin=(Admin)session.getAttribute("loginUserBack");
			if(!admin.getRole().equals("1")){//不是超级用户
				out.println("<script>window.alert('只有超用管理员，才能执行此操作');window.location.href='"
						+ request.getContextPath()
						+ "/back/right.jsp';</script>");
				return;
			}
			String username=request.getParameter("username");//通过用户名来查询
			Admin a=new Admin();
			a.setUsername(username);
			try {
				List<Admin> users=adminDao.getUsers(a);
				request.setAttribute("users", users);
				request.getRequestDispatcher("/back/admin/AdminList.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(method.equals("logout")){//退出登陆
			session.setAttribute("loginUserBack", null);
			out.println("<script>window.alert('已退出登陆');window.location.href='"
					+ request.getContextPath()
					+ "/back/login.jsp';</script>");
			//request.getRequestDispatcher("/back/login.jsp").forward(request, response);
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}


	public void init() throws ServletException {
		
	}

}
