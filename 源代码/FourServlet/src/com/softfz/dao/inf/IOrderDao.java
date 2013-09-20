package com.softfz.dao.inf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.dto.Order;
import com.softfz.dao.dto.ShoppingCar;

public interface IOrderDao {
	/**
	 * 得到订单列表
	 * @return 订单列表
	 */
	public List getOrderList();
	/**
	 * 得到订单明细
	 * @param nid 订单ID
	 * @return 订单明细列表
	 */
	public List getOrderItem(String nid);
	/**
	 * 删除订单
	 * @param id 订单id
	 * @return 是否删除成功，成功返回true
	 */
	public boolean delOrder(String id);
	/**
	 * 修改订单状态
	 * @param nid 订单ID
	 * @param status 订单状态
	 * @param username 审核人
	 * @param reply 订单反馈
	 * @return 是否修改成功，是返回true
	 */
	public boolean updateStatus(String nid,String status,String username,String reply);
	/**
	 * 生成订单
	 * @param order 订单对象
	 * @param shoppingCar 购物车对象
	 * @return 订单是否生成成功，是返回true
	 * 
	 */
	public boolean addOrder(Order order,ShoppingCar shoppingCar);
	/**
	 * 返回指定用户的订单列表
	 * @param username 下单用户名
	 * @return 订单列表
	 */
	public List getMyOrderList(String username);
	/**
	 * 根据条件查询订单
	 * @param request 
	 * @return 订单列表
	 */
	public List selectOrderList(HttpServletRequest request);
	
}
