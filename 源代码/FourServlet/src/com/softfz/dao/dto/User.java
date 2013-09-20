package com.softfz.dao.dto;
/**
 * ǰ̨�û�
 * @author Administrator
 *
 */
public class User {
	private String username; //�û���
	private String password; //����
	private String realName; //��ʵ����
	private String sex;     //�Ա�
	private String birthday; //����
	private String registerTime; //ע��ʱ��
	private String postCode;//�ʱ�
	private String address;//��ַ
	private String phoneNumber;//�ֻ�����
	private String email;//email
	private int loginNum;  //��½����
	private String lastLoginTime; //�ϴε�½ʱ�� 
	private String role; //�û�����
	private String slock;
	public User() {
	}
	
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}
	public User(String username, String password, String realName, String sex,
			String birthday, String postCode, String address,
			String phoneNumber, String email,String role,String slock) {
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.postCode = postCode;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.role=role;
		this.slock=slock;
	}
	public User(String username, String password, String realName, String sex,
			String birthday, String postCode, String address,
			String phoneNumber, String email) {
		super();
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.postCode = postCode;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}
	
	public String getSlock() {
		return slock;
	}
	public void setSlock(String slock) {
		this.slock = slock;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getLoginNum() {
		return loginNum;
	}
	public void setLoginNum(int loginNum) {
		this.loginNum = loginNum;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
