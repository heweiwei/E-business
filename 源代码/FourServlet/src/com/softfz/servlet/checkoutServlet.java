package com.softfz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.softfz.dao.dto.Order;
import com.softfz.dao.dto.ShoppingCar;
import com.softfz.dao.dto.User;
import com.softfz.dao.impl.OrderDao;
/**
 * 订单生成操作
 * @author Administrator
 *	method=default 判断用户是否登陆
 *	method=checkout 用户下单
 */
public class checkoutServlet extends HttpServlet {
	public checkoutServlet() {
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		
		OrderDao orderDao = new OrderDao();
		User user=(User)session.getAttribute("loginUser");
		//得到购物车
		ShoppingCar shoppingCar=(ShoppingCar)session.getAttribute("shoppingCar");
		if(shoppingCar==null){
			shoppingCar= new ShoppingCar(); 
			session.setAttribute("shoppingCar", shoppingCar);
		}
		
		String method=request.getParameter("method");
		
		if(method.equals("default")){//判断用户是否登陆	
			
			if(shoppingCar.getTotalCount()==0){//购物车为空时
				System.out.println(shoppingCar.getTotalCount());
				out.println("<script>window.alert('您的购物车目前为空呢，赶快去购物吧！');window.location.href='"
						+ request.getContextPath()
						+ "/servlet/GoodsServlet?method=divList';</script>");
				return;
			}
			if(user==null){//用户未登陆,跳转至登陆页
				session.setAttribute("checkout", true);
				out.println("<script>window.alert('结账前请选登陆');window.location.href='"
						+ request.getContextPath()
						+ "/front/login.jsp';</script>");
				return;
				//request.getRequestDispatcher("/front/login.jsp").forward(request, response);
			}
			else{//否则跳转至填写订单信息页
				request.getRequestDispatcher("/front/orderInfo.jsp").forward(request, response);
			}
		}
		else if(method.equals("checkout")){//生成订单
			Order order = new Order();
			String scuser = user.getUsername();
			String spaytype = request.getParameter("spaytype");
			String ssendtype= request.getParameter("ssendtype");
			String smsg = request.getParameter("smsg");
			String ssname = request.getParameter("ssname");
			String ssaddress = request.getParameter("ssaddress");
			String sscode= request.getParameter("sscode");
			String ssphone = request.getParameter("ssphone");
			String ssemail = request.getParameter("ssemail");
			
			order.setScUser(scuser);
			order.setSPayType(spaytype);
			order.setSSendType(ssendtype);
			order.setSMsg(smsg);
			order.setSsName(ssname);
			order.setSsAddress(ssaddress);
			order.setSsPhone(ssphone);
			order.setSsCode(sscode);
			order.setSsPhone(ssphone);
			order.setSsEmail(ssemail);
			shoppingCar=(ShoppingCar)session.getAttribute("shoppingCar");//得到购物车对象
			orderDao.addOrder(order, shoppingCar);
			
			session.setAttribute("shoppingCar", null);
			out.println("<script>window.alert('订单已生成');window.location.href='"
					+ request.getContextPath()
					+ "/servlet/OrderServlet?method=myorderlist&username="+user.getUsername()+"';</script>");
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
