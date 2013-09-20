package com.softfz.dao.inf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.dto.User;

public interface IUserDao {
	/**
	 * �����û�
	 * @param user Ҫ���ӵ��û�����
	 * @return �Ƿ����ӳɹ�
	 */
	public boolean addUser(User user);
	/**
	 * ɾ���û�
	 * @param username Ҫɾ�����û�����
	 * @return �Ƿ�ɾ���ɹ�
	 */
	public boolean delUser(String username);
	/**
	 * ��̨�����û�
	 * @param user �û�����
	 * @return �Ƿ���ɹ����Ƿ���true
	 */
	public boolean updateUserBack(User user);
	/**
	 * ǰ̨�����û�
	 * @param user �û�����
	 * @return �Ƿ���³ɹ�
	 */
	public boolean updateUserFront(User user);
	/**
	 * �����û���½��־
	 * @param user Ҫ���µ��û����󣬽��õ�username��loginnum
	 * @return �Ƿ���³ɹ����ɹ��򷵻�true
	 */
	public boolean updateLog(User user);
	/**
	 * �õ������û�,�����û����ؿ�
	 * @param user Ҫ��ѯ���û������õ�username ��password
	 * @return ��ѯ���û�
	 */
	public User getSingleUser(User user);
	/**
	 * �õ��û��б�
	 * @param request
	 * @return �û��б�
	 */
	public List userList(HttpServletRequest request);
}
