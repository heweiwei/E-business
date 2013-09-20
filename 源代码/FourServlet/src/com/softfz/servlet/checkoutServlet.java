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
 * �������ɲ���
 * @author Administrator
 *	method=default �ж��û��Ƿ��½
 *	method=checkout �û��µ�
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
		//�õ����ﳵ
		ShoppingCar shoppingCar=(ShoppingCar)session.getAttribute("shoppingCar");
		if(shoppingCar==null){
			shoppingCar= new ShoppingCar(); 
			session.setAttribute("shoppingCar", shoppingCar);
		}
		
		String method=request.getParameter("method");
		
		if(method.equals("default")){//�ж��û��Ƿ��½	
			
			if(shoppingCar.getTotalCount()==0){//���ﳵΪ��ʱ
				System.out.println(shoppingCar.getTotalCount());
				out.println("<script>window.alert('���Ĺ��ﳵĿǰΪ���أ��Ͽ�ȥ����ɣ�');window.location.href='"
						+ request.getContextPath()
						+ "/servlet/GoodsServlet?method=divList';</script>");
				return;
			}
			if(user==null){//�û�δ��½,��ת����½ҳ
				session.setAttribute("checkout", true);
				out.println("<script>window.alert('����ǰ��ѡ��½');window.location.href='"
						+ request.getContextPath()
						+ "/front/login.jsp';</script>");
				return;
				//request.getRequestDispatcher("/front/login.jsp").forward(request, response);
			}
			else{//������ת����д������Ϣҳ
				request.getRequestDispatcher("/front/orderInfo.jsp").forward(request, response);
			}
		}
		else if(method.equals("checkout")){//���ɶ���
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
			shoppingCar=(ShoppingCar)session.getAttribute("shoppingCar");//�õ����ﳵ����
			orderDao.addOrder(order, shoppingCar);
			
			session.setAttribute("shoppingCar", null);
			out.println("<script>window.alert('����������');window.location.href='"
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
