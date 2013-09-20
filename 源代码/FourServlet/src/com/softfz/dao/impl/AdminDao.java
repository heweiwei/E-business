package com.softfz.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.softfz.dao.dto.Admin;
import com.softfz.dao.inf.IAdminDao;
/**
 * ����Ա�����࣬�Թ���Ա������ɾ�Ĳ�
 * @author wizard
 *
 */
public class AdminDao implements IAdminDao {
	
	String filePath =null;
	public AdminDao(String filePath) {
		this.filePath = filePath;
	}
	/**
	 * ���ҵ����û�
	 * @param admin ��װ��Ҫ��ѯ���û���username��password
	 * @return  Ҫ��ѯ���û�
	 */
	public Admin getSingleUser(Admin admin) throws Exception {

		Document document = this.readXML();
		Element element = (Element)document.selectSingleNode("/users/user[username='" + admin.getUsername()
				+ "' and password='" + admin.getPassword() + "']");
		Admin a = null;
		if(element!=null)
		{
			String username = element.elementText("username");
			String password = element.elementText("password");
			String role = element.elementText("role");
			a = new Admin();
			a.setUsername(username);
			a.setPassword(password);
			a.setRole(role);
		}
		return a;
	}
	/**
	 * ���������û�
	 * @param admin �û�����
	 * 
	 */
	public List<Admin> getUsers(Admin admin)throws Exception{
		Document document = this.readXML();
		StringBuffer path = new StringBuffer("/users/user[1=1");
		if (admin != null) {
			if (admin.getUsername() != null
					&& !admin.getUsername().equals("")) {
				path.append(" and contains(username,'").append(
						admin.getUsername()).append("')");
			}
		}
		path.append("]");
		List<Element> list = document.selectNodes(path.toString());
		Element rootElement=document.getRootElement();
		List<Admin> admins= new ArrayList<Admin>();
		for(Element e:list){
			String username=e.elementText("username");
			String password=e.elementText("password");
			String realName=e.elementText("realName");
			String sex=e.elementText("sex");
			String birthday=e.elementText("birthday");
			String email=e.elementText("email");
			String phoneNumber=e.elementText("phoneNumber");
			String address=e.elementText("address");
			String postCode=e.elementText("postCode");
			String role=e.elementText("role");
			Admin a= new Admin(username,password,realName,sex,birthday,email,phoneNumber,address,postCode,role);
			admins.add(a);
		}
		return admins;
	}
	/**
	 * ɾ���û�
	 * @param username �û���
	 *
	 */
	public void delUser(String username) throws Exception {
		Document document = this.readXML();
		Element rootElement=document.getRootElement();
		Element element = (Element)document.selectSingleNode("/users/user[username='" + username + "']");
		if(element!=null)
		{
			rootElement.remove(element);
		}
		this.writeXML(document);
	}
	/**
	 * �����û�
	 * @param admin �û�����
	 * @return �����û������Ϣ�����û����Ѵ��ڣ���ӳɹ�
	 */
	public String addUser(Admin admin) throws Exception {
		Document document = this.readXML();
		Element rootElement=document.getRootElement();
		//�ж��û����Ƿ����
		List<Element> list=rootElement.elements("user");
		for(Element e:list){
			if(e.element("username").getText().equals(admin.getUsername())){
				return "�û����Ѵ���";
			}
		}
		Element userElement =rootElement.addElement("user");

			Element usernameElement =userElement.addElement("username");
			usernameElement.setText(admin.getUsername());
			
			Element passwordElement =userElement.addElement("password");
			passwordElement.setText(admin.getPassword());
			
			Element realNameElement =userElement.addElement("realName");
			realNameElement.setText(admin.getRealName());
			
			Element sexElement =userElement.addElement("sex");
			sexElement.setText(admin.getSex());
			
			Element birthdayElement =userElement.addElement("birthday");
			birthdayElement.setText(admin.getBirthday());
			
			Element emailElement =userElement.addElement("email");
			emailElement.setText(admin.getEmail());
			
			Element phoneNumberElement =userElement.addElement("phoneNumber");
			phoneNumberElement.setText(admin.getPhoneNumber());
			
			Element addressElement =userElement.addElement("address");
			addressElement.setText(admin.getAddress());
			
			Element postCodeElement =userElement.addElement("postCode");
			postCodeElement.setText(admin.getPostCode());
			
			Element roleElement =userElement.addElement("role");
			roleElement.setText(admin.getRole());
			
		this.writeXML(document);
		return "��ӳɹ�";
	}
	/**
	 * �����û�
	 * @param admin �û�����
	 * @return ������Ϣ
	 */
	public String updateUser(Admin admin) throws Exception {
		Document document = this.readXML();
		Element rootElement=document.getRootElement();
		
		Element userElement = (Element)document.selectSingleNode("/users/user[username='" + admin.getUsername() + "']");

			Element usernameElement =userElement.element("username");
			usernameElement.setText(admin.getUsername());
			
			Element passwordElement =userElement.element("password");
			passwordElement.setText(admin.getPassword());
			
			Element realNameElement =userElement.element("realName");
			realNameElement.setText(admin.getRealName());
			
			Element sexElement =userElement.element("sex");
			sexElement.setText(admin.getSex());
			
			Element birthdayElement =userElement.element("birthday");
			birthdayElement.setText(admin.getBirthday());
			
			Element emailElement =userElement.element("email");
			emailElement.setText(admin.getEmail());
			
			Element phoneNumberElement =userElement.element("phoneNumber");
			phoneNumberElement.setText(admin.getPhoneNumber());
			
			Element addressElement =userElement.element("address");
			addressElement.setText(admin.getAddress());
			
			Element postCodeElement =userElement.element("postCode");
			postCodeElement.setText(admin.getPostCode());
			
		this.writeXML(document);
		return "���³ɹ�";
	}
	/**
	 * ��ȡXML
	 * @return �ĵ�����
	 * @throws Exception
	 */
	private Document readXML() throws Exception {
		SAXReader reader = new SAXReader();
/*		Document document = reader.read(this.getClass().getResourceAsStream(
				"/admin.xml"));*/
		Document document = reader.read(new File(filePath));
		return document;
	}
	/**
	 * д��XML
	 * @param document �ĵ�����
	 * @throws Exception
	 */
	private void writeXML(Document document) throws Exception {
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("GBK");
		XMLWriter write = new XMLWriter(new FileOutputStream(filePath), format);
		write.write(document);
		document.clearContent();
		write.flush();
		write.close();
	}


}
