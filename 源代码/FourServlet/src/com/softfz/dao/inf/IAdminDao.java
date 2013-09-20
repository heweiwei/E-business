package com.softfz.dao.inf;

import java.util.List;

import org.dom4j.Document;

import com.softfz.dao.dto.Admin;

public interface IAdminDao {
	/**
	 * �õ������û�
	 * @param admin �û�����
	 * @return �û�����
	 */
	public Admin getSingleUser(Admin admin) throws Exception;
	/**
	 * �õ��û��б�
	 * @param admin �û�����
	 * @return �û��б�
	 */
	public List<Admin> getUsers(Admin admin)throws Exception;
	/**
	 * ɾ��һ���û�
	 * @param username �û���
	 */
	public void delUser(String username) throws Exception;
	/**
	 * ����һ���û�
	 * @param admin �û�����
	 * @return �����û������Ϣ����"�û����Ѵ���"��"��ӳɹ�"
	 */
	public String addUser(Admin admin) throws Exception;
	/**
	 * ����һ���û�
	 * @param admin �û�����
	 * @return ������Ϣ
	 */
	public String updateUser(Admin admin) throws Exception;
}
