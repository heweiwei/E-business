package com.softfz.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import com.softfz.dao.db.SqlServerConn;
import com.softfz.dao.inf.ITypeDao;
/**
 * 商品种类操作类
 * @author wizard
 *
 */
public class TypeDao implements ITypeDao {
	/**
	 * 得到大小类
	 * @return Map
	 * Map中存有两个二维数组，type数组存放名字，typeid数组存放NID，名字和NID在数组中的位置一一对应
	 * PID体现在 数据在数组中的位置
	 * 每个一维数组的第一个位置存放PID为0的种类（即为大类），后面存放他相应的小类 
	 * 如 电器的名字为type[0][0],电脑的名字为type[0][1],电器的id为typeid[0][0],电脑的id为typeid[0][1]
	 * 数组的大小为1024*1024，即大类最多有1024个，每个大类中最多包含1023个小类
	 */
	public Map getMcType(){
		ResultSet rs = null;
		Statement stmt=null;
		String [][] type= new String[1024][1024]; //存名字
		int [][] typeid = new int [1024][1024];   //存NID
		Map map = new HashMap();
		int []index= new int [1024];
		StringBuffer sql=new StringBuffer("select * from t_mc_type");
		Connection cnn=SqlServerConn.getConn();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql.toString());
			while(rs.next()){
				int nid=rs.getInt("nid");
				String sname=rs.getString("sname");
				int npid = rs.getInt("npid");
				//大类
				if(npid==0){//找行
					int i=0;
					for(;i<1024;i++){
						if(index[i]==0){
							index[i]=nid;
							break;
						}
					}
					for(int j=0;j<1024;j++){//找列
						if(type[i][j]==null){
							type[i][j]=sname;
							typeid[i][j]=nid;
							break;
						}
					}
				}
				else {
					//小类
					int i=0;
					for(;i<1024;i++){ //找行
						if(index[i]==npid)break;
					}
					for(int j=0;j<1024;j++){//找列
						if(type[i][j]==null){
							type[i][j]=sname;
							typeid[i][j]=nid;
							break;
						}
					}
				}
			}
			map.put("type", type);
			map.put("typeid", typeid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return map;
	}
	/**
	 * 增加商品的大小类
	 * @param pid 父类id
	 * @param sname 类名
	 * @return 是否增加成功
	 */
	public boolean addMcType(String pid,String sname){
		Connection cnn=SqlServerConn.getConn();
		String sql="insert into t_mc_type(nid,sname,npid)values(seq_t_mc_type.nextval,'"+sname+"',"+pid+")";
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
			int i=stmt.executeUpdate(sql);
			if(i==1)flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * 删除大小类
	 * @param id 类的id
	 * @return 是否删除成功
	 */
	public boolean delMcType(String id){
		Connection cnn=SqlServerConn.getConn();
		String sql="delete from t_mc_type where nid="+id+" or npid="+id;
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
			int i=stmt.executeUpdate(sql);
			if(i>=1)flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * 更新种类名
	 * @param id 类的id
	 * @param name 类名
	 * @return 是否更新成功
	 */
	public boolean updateMcType(String id,String name){
		Connection cnn=SqlServerConn.getConn();
		String sql="update t_mc_type set sname='"+name+"' where nid="+id;
		Statement stmt=null;
		ResultSet rs=null;
		boolean flag=false;
		try {
			stmt = cnn.createStatement();
			int i=stmt.executeUpdate(sql);
			if(i==1)flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
}
