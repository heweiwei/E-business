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
 * ǰ̨�û�������
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
		
		if(method.equals("add")){//�����û�
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
			if(b){//�����û��ɹ��󣬷����û��б�
				out.println("<script>window.alert('ע��ɹ������������Ե�½�ˣ�');window.location.href='" 
						+request.getContextPath()+"/front/login.jsp'</script>");
			}
			else{
				out.println("<script>window.alert('�û����Ѵ��ڣ�����������ע�ᣡ');history.back(-1);</script>");
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
			if(b){//�����û��ɹ��󣬷����û��б�
				List<Goods> userList= userDao.userList(request);
				request.setAttribute("userList", userList);
				request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
			}
			else{
				out.println("<script>window.alert('�û����Ѵ��ڣ����������룡');history.back(-1);</script>");
			}
		}
		else if(method.equals("update")){ //��̨�����û���Ϣ
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
			//�����û��ɹ��󣬷����û��б�
			List<Goods> userList= userDao.userList(request);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
		}
		else if(method.equals("updateFront")){//ǰ̨�����û���Ϣ
			User loginUser = (User)session.getAttribute("loginUser");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			if(!password.equals(loginUser.getPassword())){
				out.println("<script>window.alert('���벻��ȷ');window.location.href='"
							+ request.getContextPath()
							+ "/front/userInfo.jsp';</script>");
				out.flush();
				out.close();
				return;
			}
			//�ж��Ƿ��޸�����
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
			
			//�޸�session��Ϣ
			session.setAttribute("loginUser", userDao.getSingleUser(new User(username,pwd1)));
			//��ʾ��Ϣ����תҳ��
			out.println("<script>window.alert('���³ɹ���');window.location.href='"
							+ request.getContextPath()
							+ "/front/userInfo.jsp';</script>");
			out.flush();
			out.close();
		}
		else if(method.equals("list")){//�����û��б�
			List userList=userDao.userList(request);
			String name=request.getParameter("name");
			//request.setAttribute("name", name);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
		}
		else if(method.equals("del")){//ɾ���û�
			String username=request.getParameter("username");
			boolean flag=userDao.delUser(username);
			String info="";
			if(flag){
				info="ɾ���ɹ�";
			}
			else{
				info="ɾ��ʧ��";
			}
			out.println("<script>alert('"+info+"')</script>");
			//ɾ���û��󣬷����û��б�
			List<Goods> userList= userDao.userList(request);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/back/user/user_list.jsp").forward(request, response);
		}
		else if(method.equals("logout")){//�˳���½
			session.setAttribute("loginUser", null);
			out.println("<script>window.alert('�Ѱ�ȫ�˳���');window.location.href='"
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
