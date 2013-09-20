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
 * ǰ��̨��½��֤,����url�д��ݵ�method������ֵ��ȷ��ִ�е�ҵ��
 * method=front,ǰ̨��½��֤
 * method=back����̨��½��֤
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
		if(method.equals("back")){//��̨�û���½
			session.setAttribute("inputNameBack", username);
			try {
				returnAdmin = adminDao.getSingleUser(admin);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(!rand.equals(session.getAttribute("rand"))){
				
				out.println("<script>window.alert('��֤�벻��ȷ�����������룡');window.location.href='"
								+ request.getContextPath()
								+ "/back/login.jsp';</script>");
				out.flush();
				out.close();
			}
			else if (returnAdmin== null) {
				out.println("<script>window.alert('�û����������벻��ȷ');window.location.href='"
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
		else if(method.equals("front")){//ǰ̨�û���½
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
				out.println("<script>window.alert('��֤�벻��ȷ�����������룡');window.location.href='"
								+ request.getContextPath()
								+ "/front/login.jsp';</script>");
			}
			else if (returnUser== null) {
				out.println("<script>window.alert('�û����������벻��ȷ');window.location.href='"
								+ request.getContextPath()
								+ "/front/login.jsp';</script>");
			}
			else if (returnUser.getSlock().equals("1")) {
				out.println("<script>window.alert('���û������ᣡ����ϵ����Ա');window.location.href='"
								+ request.getContextPath()
								+ "/back/main.jsp';</script>");
			}
			else
			{			
				boolean flag=userDao.updateLog(returnUser);//���µ�½��Ϣ
				if(flag){//��½�ɹ�
					session.setAttribute("loginUser", returnUser);
					session.setAttribute("loginUserBack", null);
					//����û���ǰ�Ƿ�Ҫ����
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
					out.println("<script>window.alert('δ֪��������ϵ����Ա');window.location.href='"
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
