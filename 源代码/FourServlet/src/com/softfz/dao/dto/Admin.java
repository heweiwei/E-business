package com.softfz.dao.dto;
/**
 * ��̨����Ա
 * @author wizard
 *
 */
public class Admin {
	/**
	 * �û���
	 */
	private String username;//�û���
	private String password;//����
	private String realName;//��ʵ����
	private String sex;//�Ա�
	private String birthday;//����
	private String email;//email
	private String phoneNumber;//�ֻ�����
	private String address;//��ַ
	private String postCode;//�ʱ�
	private String role;//�û�����
	/**
	 * �޲ι��캯��
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
	 * �õ��û�Ȩ��
	 * @return String
	 */
	public String getRole() {
		return role;
	}
	/**
	 * �����û�Ȩ��
	 * @param role �û�Ȩ��
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * �õ��û���
	 * @return String
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * �����û���
	 * @param username �û���
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * �õ�����
	 * @return String
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * ��������
	 * @param password ����
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * �õ���ʵ����
	 * @return String
	 */
	public String getRealName() {
		return realName;
	}
	/**
	 * ������ʵ����
	 *@param  realName ��ʵ����
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}
	/**
	 * �õ�����
	 * @return String
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * �����Ա�
	 * @param sex �Ա�
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * �õ��������ڣ���ʽ��1989-11-09
	 * @return String
	 */
	public String getBirthday() {
		return birthday;
	}
	/**
	 * ���ó������ڣ���ʽ��1989-11-09
	 * @param 	birthday
	 * 			��������
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * �õ�email
	 * @return String
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * ����email
	 * @param email email��ַ
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * �õ��ֻ�����
	 * @return String
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}
	/**
	 * �����ֻ�����
	 * @param phoneNumber �ֻ�����
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	/**
	 * �õ���ַ
	 * @return String
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * ���õ�ַ
	 * @param address ��ַ
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * �õ��ʱ�
	 * @return String
	 */
	public String getPostCode() {
		return postCode;
	}
	/**
	 * �����ʱ�
	 * @param postCode �ʱ�
	 */
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
}
