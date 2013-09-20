package com.softfz.dao.inf;

import java.util.List;

import org.dom4j.Document;

import com.softfz.dao.dto.Admin;

public interface IAdminDao {
	/**
	 * 得到单个用户
	 * @param admin 用户对象
	 * @return 用户对象
	 */
	public Admin getSingleUser(Admin admin) throws Exception;
	/**
	 * 得到用户列表
	 * @param admin 用户对象
	 * @return 用户列表
	 */
	public List<Admin> getUsers(Admin admin)throws Exception;
	/**
	 * 删除一个用户
	 * @param username 用户名
	 */
	public void delUser(String username) throws Exception;
	/**
	 * 增加一个用户
	 * @param admin 用户对象
	 * @return 新增用户后的信息，有"用户名已存在"，"添加成功"
	 */
	public String addUser(Admin admin) throws Exception;
	/**
	 * 更新一个用户
	 * @param admin 用户对象
	 * @return 更新信息
	 */
	public String updateUser(Admin admin) throws Exception;
}
