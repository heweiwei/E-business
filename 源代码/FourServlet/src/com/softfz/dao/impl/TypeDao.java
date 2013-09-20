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
 * ��Ʒ���������
 * @author wizard
 *
 */
public class TypeDao implements ITypeDao {
	/**
	 * �õ���С��
	 * @return Map
	 * Map�д���������ά���飬type���������֣�typeid������NID�����ֺ�NID�������е�λ��һһ��Ӧ
	 * PID������ �����������е�λ��
	 * ÿ��һά����ĵ�һ��λ�ô��PIDΪ0�����ࣨ��Ϊ���ࣩ������������Ӧ��С�� 
	 * �� ����������Ϊtype[0][0],���Ե�����Ϊtype[0][1],������idΪtypeid[0][0],���Ե�idΪtypeid[0][1]
	 * ����Ĵ�СΪ1024*1024�������������1024����ÿ��������������1023��С��
	 */
	public Map getMcType(){
		ResultSet rs = null;
		Statement stmt=null;
		String [][] type= new String[1024][1024]; //������
		int [][] typeid = new int [1024][1024];   //��NID
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
				//����
				if(npid==0){//����
					int i=0;
					for(;i<1024;i++){
						if(index[i]==0){
							index[i]=nid;
							break;
						}
					}
					for(int j=0;j<1024;j++){//����
						if(type[i][j]==null){
							type[i][j]=sname;
							typeid[i][j]=nid;
							break;
						}
					}
				}
				else {
					//С��
					int i=0;
					for(;i<1024;i++){ //����
						if(index[i]==npid)break;
					}
					for(int j=0;j<1024;j++){//����
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
	 * ������Ʒ�Ĵ�С��
	 * @param pid ����id
	 * @param sname ����
	 * @return �Ƿ����ӳɹ�
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
	 * ɾ����С��
	 * @param id ���id
	 * @return �Ƿ�ɾ���ɹ�
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
	 * ����������
	 * @param id ���id
	 * @param name ����
	 * @return �Ƿ���³ɹ�
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
