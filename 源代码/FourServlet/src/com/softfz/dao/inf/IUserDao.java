package com.softfz.dao.inf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.dto.User;

public interface IUserDao {
	/**
	 * 增加用户
	 * @param user 要增加的用户对象
	 * @return 是否增加成功
	 */
	public boolean addUser(User user);
	/**
	 * 删除用户
	 * @param username 要删除的用户对象
	 * @return 是否删除成功
	 */
	public boolean delUser(String username);
	/**
	 * 后台更新用户
	 * @param user 用户对象
	 * @return 是否更成功，是返回true
	 */
	public boolean updateUserBack(User user);
	/**
	 * 前台更新用户
	 * @param user 用户对象
	 * @return 是否更新成功
	 */
	public boolean updateUserFront(User user);
	/**
	 * 更新用户登陆日志
	 * @param user 要更新的用户对象，仅用到username和loginnum
	 * @return 是否更新成功，成功则返回true
	 */
	public boolean updateLog(User user);
	/**
	 * 得到单个用户,查无用户返回空
	 * @param user 要查询的用户，仅用到username 和password
	 * @return 查询的用户
	 */
	public User getSingleUser(User user);
	/**
	 * 得到用户列表
	 * @param request
	 * @return 用户列表
	 */
	public List userList(HttpServletRequest request);
}
