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
 * 商品种类操作类
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
		if(method.equals("list")){ //商品种类列表
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("del")){//删除大小类
			String id=request.getParameter("id");
			typeDao.delMcType(id);
			//删除成功后，返回商品种类列表
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("addMin")){//增加小类
			String pid=request.getParameter("pid");
			String sname=request.getParameter("sname");
			typeDao.addMcType(pid, sname);
			//增加成功后，返回商品种类列表
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("addMax")){//增加大类
			String sname=request.getParameter("sname");
			typeDao.addMcType("0", sname);
			//增加成功后，返回商品种类列表
			Map map=typeDao.getMcType();
			String [][] type = (String[][])map.get("type");
			int [][] typeid=(int[][])map.get("typeid");	
			HttpSession session=request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/back/type/type_list.jsp").forward(request, response);
		}
		else if(method.equals("update")){ //更新种类名称
			
			String tmp=request.getParameter("name");
			String name= URLDecoder.decode(tmp,"UTF-8");//解码
			
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
