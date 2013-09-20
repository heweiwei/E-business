package com.softfz.dao.dto;
/**
 * 后台管理员
 * @author wizard
 *
 */
public class Admin {
	/**
	 * 用户名
	 */
	private String username;//用户名
	private String password;//密码
	private String realName;//真实姓名
	private String sex;//性别
	private String birthday;//生日
	private String email;//email
	private String phoneNumber;//手机号码
	private String address;//地址
	private String postCode;//邮编
	private String role;//用户级别
	/**
	 * 无参构造函数
	 */
	public Admin() {
	}
	public Admin(String username, String password, String realName, String sex,
			String birthday, String email, String phoneNumber, String address,
			String postCode) {
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.postCode = postCode;
	}
	public Admin(String username, String password, String realName, String sex,
			String birthday, String email, String phoneNumber, String address,
			String postCode,String role) {
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.postCode = postCode;
		this.role=role;
	}
	
	/**
	 * 得到用户权限
	 * @return String
	 */
	public String getRole() {
		return role;
	}
	/**
	 * 设置用户权限
	 * @param role 用户权限
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * 得到用户名
	 * @return String
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * 设置用户名
	 * @param username 用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * 得到密码
	 * @return String
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * 设置密码
	 * @param password 密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 得到真实姓名
	 * @return String
	 */
	public String getRealName() {
		return realName;
	}
	/**
	 * 设置真实姓名
	 *@param  realName 真实姓名
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}
	/**
	 * 得到密码
	 * @return String
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * 设置性别
	 * @param sex 性别
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * 得到出生日期，格式如1989-11-09
	 * @return String
	 */
	public String getBirthday() {
		return birthday;
	}
	/**
	 * 设置出生日期，格式如1989-11-09
	 * @param 	birthday
	 * 			出生日期
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * 得到email
	 * @return String
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 设置email
	 * @param email email地址
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 得到手机号码
	 * @return String
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}
	/**
	 * 设置手机号码
	 * @param phoneNumber 手机号码
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	/**
	 * 得到地址
	 * @return String
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置地址
	 * @param address 地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 得到邮编
	 * @return String
	 */
	public String getPostCode() {
		return postCode;
	}
	/**
	 * 设置邮编
	 * @param postCode 邮编
	 */
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
}
