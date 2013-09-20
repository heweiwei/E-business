package com.softfz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.softfz.dao.dto.ShoppingCar;
/**
 * 购物车操作
 * method=add 添加商品
 * method=del 删除商品
 * method=clear 清空购物体
 * method=update 更新数量
 * @author wizard
 *
 */
public class ShoppingCarServlet extends HttpServlet {

	public ShoppingCarServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得方法
		String method = request.getParameter("method");
		//获得id
		int id=0;
		String idStr=request.getParameter("id");
		if(idStr!=null&&!idStr.equals("")){
			id=Integer.parseInt(idStr);
		}
		//获得count
		int count=0;
		String countStr=request.getParameter("count"+id);
		if(countStr!=null&&!countStr.equals("")){
			try{
			count=Integer.parseInt(countStr);
			}catch(NumberFormatException e){
				
			}
		}
		//获得购物车
		HttpSession session = request.getSession();
		ShoppingCar shoppingCar=(ShoppingCar)session.getAttribute("shoppingCar");
		if(shoppingCar==null){
			shoppingCar= new ShoppingCar(); 
			session.setAttribute("shoppingCar", shoppingCar);
		}
		
		if(method.equals("add")){//添加
			shoppingCar.addGoods(id);
			session.setAttribute("shoppingCar", shoppingCar);
			request.getRequestDispatcher("/front/ShoppingCar.jsp").forward(request, response);
		}
		else if(method.equals("del")){//删除
			shoppingCar.delGoods(id);
			session.setAttribute("shoppingCar", shoppingCar);
			request.getRequestDispatcher("/front/ShoppingCar.jsp").forward(request, response);
		}
		else if(method.equals("clear")){//清空
			shoppingCar.clearGoods();
			session.setAttribute("shoppingCar", shoppingCar);
			request.getRequestDispatcher("/front/ShoppingCar.jsp").forward(request, response);
		}
		else if(method.equals("update")){//修改
			shoppingCar.updateGoodsNumber(id, count);
			session.setAttribute("shoppingCar", shoppingCar);
			request.getRequestDispatcher("/front/ShoppingCar.jsp").forward(request, response);
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("  </BODY>");
		out.println("</HTML>");
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
