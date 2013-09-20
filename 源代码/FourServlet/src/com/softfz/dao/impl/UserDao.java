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
	 * 增加用户
	 * @param user 要增加的用户对象
	 * @return 是否增加成功
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
	 * 删除用户
	 * @param username 要删除的用户对象
	 * @return 是否删除成功
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
	 * 后台更新用户
	 * @param user 用户对象
	 * @return 是否更成功，是返回true
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
	 * 前台更新用户
	 * @param user 用户对象
	 * @return 是否更新成功
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
	 * 更新用户登陆日志
	 * @param user 要更新的用户对象，仅用到username和loginnum
	 * @return 是否更新成功，成功则返回true
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
	 * 得到单个用户,查无用户返回空
	 * @param user 要查询的用户，仅用到username 和password
	 * @return 查询的用户
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
	 * 得到用户列表
	 * @param request
	 * @return 用户列表
	 */
	public List userList(HttpServletRequest request){
		//查询条件
		StringBuffer condition = new StringBuffer();
		//查询总记录数
		StringBuffer querycount = new StringBuffer("select count(suser) num from t_user t where 1=1");
		//获得符合条件的记录
		StringBuffer queryall = new StringBuffer();
		
		//获得搜索字符串
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		if(name!=null && !name.equals(""))
		{
			condition.append(" and t.suser like '%").append(name).append("%'") ;
		}
		//设置每页行数
		PageDAO page = new PageDAO(request);
		page.setPagesize(6);
		//总行数
		int rscount = page.getRsCountForSQL(querycount.append(condition).toString());
		//当前页数
		int currentpage = page.getCurrentPage();
		//每页行数
		int pagesize = page.getPagesize();
		//总页数
		int pagecount = page.getPageCount();
		
		String pagetool = page.pagetool(PageDAO.BbsText);
		request.setAttribute("pagetool", pagetool);
		
		//查询符合条件的数据
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
