package com.softfz.dao.inf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.dto.Order;
import com.softfz.dao.dto.ShoppingCar;

public interface IOrderDao {
	/**
	 * �õ������б�
	 * @return �����б�
	 */
	public List getOrderList();
	/**
	 * �õ�������ϸ
	 * @param nid ����ID
	 * @return ������ϸ�б�
	 */
	public List getOrderItem(String nid);
	/**
	 * ɾ������
	 * @param id ����id
	 * @return �Ƿ�ɾ���ɹ����ɹ�����true
	 */
	public boolean delOrder(String id);
	/**
	 * �޸Ķ���״̬
	 * @param nid ����ID
	 * @param status ����״̬
	 * @param username �����
	 * @param reply ��������
	 * @return �Ƿ��޸ĳɹ����Ƿ���true
	 */
	public boolean updateStatus(String nid,String status,String username,String reply);
	/**
	 * ���ɶ���
	 * @param order ��������
	 * @param shoppingCar ���ﳵ����
	 * @return �����Ƿ����ɳɹ����Ƿ���true
	 * 
	 */
	public boolean addOrder(Order order,ShoppingCar shoppingCar);
	/**
	 * ����ָ���û��Ķ����б�
	 * @param username �µ��û���
	 * @return �����б�
	 */
	public List getMyOrderList(String username);
	/**
	 * ����������ѯ����
	 * @param request 
	 * @return �����б�
	 */
	public List selectOrderList(HttpServletRequest request);
	
}
