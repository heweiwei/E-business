package com.softfz.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.db.SqlServerConn;
import com.softfz.dao.dto.User;
import com.softfz.dao.inf.IUserDao;
import com.softfz.util.PageDAO;

public class UserDao implements IUserDao{
	/**
	 * �����û�
	 * @param user Ҫ���ӵ��û�����
	 * @return �Ƿ����ӳɹ�
	 */
	public boolean addUser(User user){
		boolean flag=false;
		StringBuffer sql= new StringBuffer("insert into t_user(suser,spwd,sname,ssex,dbirth,semail,sphone,saddress,scode,nlevel,dregdate,slock,dlastdate,nlogin)values ('");
		sql.append(user.getUsername()).append("','");
		sql.append(user.getPassword()).append("','");
		sql.append(user.getRealName()).append("','");
		sql.append(user.getSex()).append("',to_date('");
		sql.append(user.getBirthday()).append("','yyyy-mm-dd'),'");
		sql.append(user.getEmail()).append("','");
		sql.append(user.getPhoneNumber()).append("','");
		sql.append(user.getAddress()).append("','");
		sql.append(user.getPostCode()).append("',");
		sql.append(user.getRole());
		sql.append(",sysdate,");
		sql.append(user.getSlock());
		sql.append(",sysdate,0)");
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt = cnn.createStatement();
			stmt.executeUpdate(sql.toString());
			flag=true;
		} catch (SQLException e) {
			
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * ɾ���û�
	 * @param username Ҫɾ�����û�����
	 * @return �Ƿ�ɾ���ɹ�
	 */
	public boolean delUser(String username){
		Connection cnn=SqlServerConn.getConn();
		String sql="delete from t_user where suser='"+username+"'";
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
			int i=stmt.executeUpdate(sql);
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * ��̨�����û�
	 * @param user �û�����
	 * @return �Ƿ���ɹ����Ƿ���true
	 */
	public boolean updateUserBack(User user){
		StringBuffer sql= new StringBuffer("update t_user set spwd='");
		sql.append(user.getPassword()).append("',sname='");
		sql.append(user.getRealName()).append("',ssex='");
		sql.append(user.getSex()).append("',dbirth=to_date('");
		sql.append(user.getBirthday()).append("','yyyy-mm-dd'),semail='");
		sql.append(user.getEmail()).append("',sphone='");
		sql.append(user.getPhoneNumber()).append("',saddress='");
		sql.append(user.getAddress()).append("',scode='");
		sql.append(user.getPostCode()).append("',nlevel=");
		sql.append(user.getRole()).append(",slock=");
		sql.append(user.getSlock()).append(" where suser='");
		sql.append(user.getUsername()).append("'");
//System.out.println(sql.toString());
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
		    int i=stmt.executeUpdate(sql.toString());
		    if(i==1)flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * ǰ̨�����û�
	 * @param user �û�����
	 * @return �Ƿ���³ɹ�
	 */
	public boolean updateUserFront(User user){
		StringBuffer sql= new StringBuffer("update t_user set spwd='");
		sql.append(user.getPassword()).append("',sname='");
		sql.append(user.getRealName()).append("',ssex='");
		sql.append(user.getSex()).append("',dbirth=to_date('");
		sql.append(user.getBirthday()).append("','yyyy-mm-dd'),semail='");
		sql.append(user.getEmail()).append("',sphone='");
		sql.append(user.getPhoneNumber()).append("',saddress='");
		sql.append(user.getAddress()).append("',scode='");
		sql.append(user.getPostCode()).append("'");
		sql.append(" where suser='");
		sql.append(user.getUsername()).append("'");
//System.out.println(sql.toString());
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
		    int i=stmt.executeUpdate(sql.toString());
		    if(i==1)flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * �����û���½��־
	 * @param user Ҫ���µ��û����󣬽��õ�username��loginnum
	 * @return �Ƿ���³ɹ����ɹ��򷵻�true
	 */
	public boolean updateLog(User user){
		Connection cnn=SqlServerConn.getConn();
		String sql="update t_user set nlogin="+user.getLoginNum()+", dlastdate=sysdate where suser='"+user.getUsername()+"'";	
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
			int i=stmt.executeUpdate(sql);
			if(i==1){
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * �õ������û�,�����û����ؿ�
	 * @param user Ҫ��ѯ���û������õ�username ��password
	 * @return ��ѯ���û�
	 */
	public User getSingleUser(User user){
		Connection cnn=SqlServerConn.getConn();
		String sql="select t.suser,t.spwd,t.sname,t.ssex,to_char(t.dbirth,'yyyy-mm-dd') dbirth,t.semail,t.sphone,t.saddress,t.scode,t.nlevel,t.nlogin,to_char(t.dlastdate,'yyyy-mm-dd') dlastdate,to_char(t.dregdate,'yyyy-mm-dd') dregdate,t.slock from t_user t where t.suser='"+user.getUsername()+"' and t.spwd='"+user.getPassword()+"'";
		Statement stmt=null;
		ResultSet rs=null;
		User returnUser= new User();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){		
				returnUser.setUsername(rs.getString("suser"));
				returnUser.setPassword(rs.getString("spwd"));
				returnUser.setRealName(rs.getString("sname"));
				returnUser.setSex(rs.getString("ssex"));
				returnUser.setBirthday(rs.getString("dbirth"));
				returnUser.setEmail(rs.getString("semail"));
				returnUser.setPhoneNumber(rs.getString("sphone"));
				returnUser.setAddress(rs.getString("saddress"));
				returnUser.setPostCode(rs.getString("scode"));
				returnUser.setRole(String.valueOf(rs.getInt("nlevel")));
				returnUser.setLoginNum(rs.getInt("nlogin")+1);
				returnUser.setLastLoginTime(rs.getString("dlastdate"));
				returnUser.setRegisterTime(rs.getString("dregdate"));
				returnUser.setSlock(rs.getString("slock"));
				return returnUser;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return null;
	}
	/**
	 * �õ��û��б�
	 * @param request
	 * @return �û��б�
	 */
	public List userList(HttpServletRequest request){
		//��ѯ����
		StringBuffer condition = new StringBuffer();
		//��ѯ�ܼ�¼��
		StringBuffer querycount = new StringBuffer("select count(suser) num from t_user t where 1=1");
		//��÷��������ļ�¼
		StringBuffer queryall = new StringBuffer();
		
		//��������ַ���
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		if(name!=null && !name.equals(""))
		{
			condition.append(" and t.suser like '%").append(name).append("%'") ;
		}
		//����ÿҳ����
		PageDAO page = new PageDAO(request);
		page.setPagesize(6);
		//������
		int rscount = page.getRsCountForSQL(querycount.append(condition).toString());
		//��ǰҳ��
		int currentpage = page.getCurrentPage();
		//ÿҳ����
		int pagesize = page.getPagesize();
		//��ҳ��
		int pagecount = page.getPageCount();
		
		String pagetool = page.pagetool(PageDAO.BbsText);
		request.setAttribute("pagetool", pagetool);
		
		//��ѯ��������������
		queryall.append("select * from (select rownum rn,t.suser,t.spwd,t.sname,t.ssex,to_char(t.dbirth,'yyyy-mm-dd') dbirth,t.semail,t.sphone,t.saddress,t.scode,t.nlevel,t.nlogin,to_char(t.dlastdate,'yyyy-mm-dd') dlastdate,to_char(t.dregdate,'yyyy-mm-dd') dregdate,t.slock from t_user t where 1=1");
		queryall.append(condition.toString()).append(") a ");
		queryall.append("where a.rn >");
		queryall.append((currentpage-1)*pagesize);
		queryall.append(" and rownum <=");
		queryall.append(pagesize);
		List userList = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt=null;
		Connection cnn=SqlServerConn.getConn();
		
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(queryall.toString());
			while(rs.next()){
				User user= new User();
				user.setUsername(rs.getString("suser"));
				user.setPassword(rs.getString("spwd"));
				user.setRealName(rs.getString("sname"));
				user.setSex(rs.getString("ssex"));
				user.setBirthday(rs.getString("dbirth"));
				user.setEmail(rs.getString("semail"));
				user.setPhoneNumber(rs.getString("sphone"));
				user.setAddress(rs.getString("saddress"));
				user.setPostCode(rs.getString("scode"));
				user.setRole(String.valueOf(rs.getInt("nlevel")));
				user.setLoginNum(rs.getInt("nlogin"));
				user.setLastLoginTime(rs.getString("dlastdate"));
				user.setRegisterTime(rs.getString("dregdate"));
				user.setSlock(rs.getString("slock"));
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return userList;
	}
}
