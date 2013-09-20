package com.softfz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.softfz.dao.impl.TypeDao;
/**
 * ��Ʒ���������
 * @author wizard
 *
 */
public class TypeServlet extends HttpServlet {
	public TypeServlet() {
	}

	public void destroy() {
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String method=request.getParameter("method");
		TypeDao typeDao = new TypeDao();
		if(method.equals("list")){ //��Ʒ�����б�
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("del")){//ɾ����С��
			String id=request.getParameter("id");
			typeDao.delMcType(id);
			//ɾ���ɹ��󣬷�����Ʒ�����б�
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("addMin")){//����С��
			String pid=request.getParameter("pid");
			String sname=request.getParameter("sname");
			typeDao.addMcType(pid, sname);
			//���ӳɹ��󣬷�����Ʒ�����б�
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("addMax")){//���Ӵ���
			String sname=request.getParameter("sname");
			typeDao.addMcType("0", sname);
			//���ӳɹ��󣬷�����Ʒ�����б�
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("update")){ //������������
			
			String tmp=request.getParameter("name");
			String name= URLDecoder.decode(tmp,"UTF-8");//����
			
			String id= request.getParameter("id");
			boolean flag=typeDao.updateMcType(id, name);
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-store"); //HTTP1.1
			response.setHeader("Pragma", "no-cache"); //HTTP1.0
			response.setDateHeader("Expires", 0); //prevents catching at proxy server
			//System.out.println(request.getParameter("id"));
			//check the database
			response.getWriter().write("<msg>"+(flag?"success":"fail")+"</msg>");
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
