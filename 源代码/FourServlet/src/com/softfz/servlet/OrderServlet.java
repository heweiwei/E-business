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
import com.softfz.dao.impl.OrderDao;
/**
 * 订单操作类
 * @author Administrator
 *
 */
public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String method = request.getParameter("method");
		OrderDao orderDao = new OrderDao();
		if(method.equals("list")){//得到订单列表
			List orderList = orderDao.getOrderList();
			request.setAttribute("orderList", orderList);
			request.getRequestDispatcher("/back/order/order_list.jsp")
			.forward(request, response);
		}
		else if(method.equals("orderItem")){//得到订单明细
			String nid=request.getParameter("nid");
			List orderItemList = orderDao.getOrderItem(nid);
			request.setAttribute("orderItemList", orderItemList);
			request.getRequestDispatcher("/back/order/order_item.jsp").forward(request, response);
		}
		else if(method.equals("del")){//删除订单
			String nid=request.getParameter("nid");
			boolean b = orderDao.delOrder(nid);
			request.getRequestDispatcher("/servlet/OrderServlet?method=list").forward(request, response);
		}
		else if(method.equals("check")){//审核订单
			String id=request.getParameter("id");
			String status= request.getParameter("check");
			String reply = request.getParameter("reply");
			HttpSession session = request.getSession();
			Admin admin=(Admin)session.getAttribute("loginUserBack");
			String username=admin.getUsername();
			boolean b=orderDao.updateStatus(id, status,username,reply);
			request.getRequestDispatcher("/servlet/OrderServlet?method=list").forward(request, response);
		}
		else if(method.equals("myorderlist")){//获得我的订单
			String username=request.getParameter("username");
			List myOrderList=orderDao.getMyOrderList(username);
			request.setAttribute("myOrderList", myOrderList);
			request.getRequestDispatcher("/front/myOrder.jsp").forward(request, response);
		}
		else if(method.equals("myorderitem")){//获得我的订单详情
			String nid=request.getParameter("nid");
			List orderItemList = orderDao.getOrderItem(nid);
			request.setAttribute("myorderItemList", orderItemList);
			request.getRequestDispatcher("/front/myOrderItem.jsp").forward(request, response);
		}
		else if(method.equals("condition")){//条件查询
			String condition =request.getParameter("condition");
			String value=request.getParameter("value");
			request.setAttribute(condition, value);
			request.setAttribute("condition", condition);
			
			List orderlist=orderDao.selectOrderList(request);		
			request.setAttribute("orderList", orderlist);
			request.getRequestDispatcher("/back/order/order_list.jsp").forward(request, response);
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

	public OrderServlet() {
	}

	public void destroy() {
		super.destroy();
	}
}
