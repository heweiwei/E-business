package com.softfz.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.db.SqlServerConn;
import com.softfz.dao.dto.Goods;
import com.softfz.dao.dto.Order;
import com.softfz.dao.dto.Order_Item;
import com.softfz.dao.dto.ShoppingCar;
import com.softfz.dao.inf.IOrderDao;

public class OrderDao implements IOrderDao{
	/**
	 * �õ������б�
	 * @return �����б�
	 */
	public List getOrderList(){
		String sql ="select * from t_order";
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		List orderList= new ArrayList();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Order order = new Order();
				order.setNid(rs.getInt("nid"));
				order.setScUser(rs.getString("scuser"));
				order.setDgDate(rs.getString("dgDate"));
				order.setSPayType(rs.getString("spayType"));
				order.setSSendType(rs.getString("ssendType"));
				order.setNMcTypeSize(rs.getInt("nmctypesize"));
				order.setNMcSize(rs.getString("nmcsize"));
				order.setNTotalPrice(rs.getDouble("ntotalPrice"));
				order.setSStatus(rs.getString("sstatus"));
				order.setSMsg(rs.getString("smsg"));
				order.setSaUser(rs.getString("sauser"));
				order.setDaDate(rs.getString("dadate"));
				order.setSsName(rs.getString("ssname"));
				order.setSsAddress(rs.getString("ssaddress"));
				order.setSsCode(rs.getString("sscode"));
				order.setSsPhone(rs.getString("ssphone"));
				order.setSsEmail(rs.getString("ssemail"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return orderList;
	}
	/**
	 * �õ�������ϸ
	 * @param nid ����ID
	 * @return ������ϸ�б�
	 */
	public List getOrderItem(String nid){
		String sql ="select * from t_order_item where norderid="+nid;
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		List orderItemList= new ArrayList();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Order_Item orderItem = new Order_Item();
				orderItem.setNid(rs.getInt("nid"));
				orderItem.setnOrderId(rs.getInt("norderid"));
				orderItem.setnMcId(rs.getInt("nmcid"));
				orderItem.setsMcName(rs.getString("smcname"));
				orderItem.setsDescription(rs.getString("sdescription"));
				orderItem.setSimg(rs.getString("simg"));
				orderItem.setnCount(rs.getInt("ncount"));
				orderItem.setNprice(rs.getDouble("nprice"));
				orderItem.setnTotalPrice(rs.getDouble("ntotalprice"));
				orderItemList.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return orderItemList;
	}
	/**
	 * ɾ������
	 * @param id ����id
	 * @return �Ƿ�ɾ���ɹ����ɹ�����true
	 */
	public boolean delOrder(String id){
		Boolean flag =false;
		String sql ="delete t_order where nid="+id;
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
			try {
				stmt = cnn.createStatement();
				int i=stmt.executeUpdate(sql);				
				sql="delete t_order_item where norderid="+id;
				stmt = cnn.createStatement();				
				flag=true;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SqlServerConn.ConnClose(cnn, stmt, rs);
			}
		return flag;
	}
	/**
	 * �޸Ķ���״̬
	 * @param nid ����ID
	 * @param  status ����״̬
	 * @param username �¶��û�
	 * @param reply ��������
	 * @return �Ƿ��޸ĳɹ����Ƿ���true
	 */
	public boolean updateStatus(String nid,String status,String username,String reply){
		Boolean flag =false;
		String sql ="update t_order set sstatus="+status+",sauser='"+username+"',smsg='"+reply+"',dadate=sysdate where nid="+nid;
//System.out.println(sql);
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
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
	 * ���ɶ���
	 * @param order ��������
	 * @param shoppingCar ���ﳵ����
	 * @return �����Ƿ����ɳɹ����Ƿ���true
	 * 
	 */
	public boolean addOrder(Order order,ShoppingCar shoppingCar){
		boolean flag=false;
		StringBuffer sql = new StringBuffer("insert into t_order (nid,scuser,dgdate,spaytype,ssendtype,nmctypesize,nmcsize,ntotalprice,sstatus,smsg,sauser,dadate,ssname,ssaddress,sscode,ssphone,ssemail) values(seq_t_order.nextval,'");
		sql.append(order.getScUser()).append("',sysdate,'");
		sql.append(order.getSPayType()).append("','");
		sql.append(order.getSSendType()).append("',");
		sql.append(shoppingCar.getNMcSize()).append(",");
		sql.append(shoppingCar.getTotalCount()).append(",");
		sql.append(shoppingCar.getTotalPrice()).append(",1,'");
		sql.append(order.getSMsg()).append("',null,null,'");
		sql.append(order.getSsName()).append("','");
		sql.append(order.getSsAddress()).append("','");
		sql.append(order.getSsCode()).append("','");
		sql.append(order.getSsPhone()).append("','");
		sql.append(order.getSsEmail()).append("')");
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
			try {
				//д��t_order��
				stmt = cnn.createStatement();
				cnn.setAutoCommit(false);
				stmt.executeUpdate(sql.toString());
				//�õ�������
				String test = "select seq_t_order.currval norderid from dual";
				rs=stmt.executeQuery(test);
				rs.next();
				String norderid=String.valueOf(rs.getInt("norderid"));
				//д��t_order_item
				List<Goods> goodsList=shoppingCar.getGoodsList();
				for(Goods goods :goodsList){
					StringBuffer str = new StringBuffer("insert into t_order_item(nid,norderid,nmcid,smcname,sdescription,simg,ncount,nprice,ntotalprice)values(seq_t_order_item.nextval,");
					str.append(norderid).append(	",");
					str.append(goods.getId()).append(",'");
					str.append(goods.getName()).append("','");
					str.append(goods.getDescrib()).append("','");
					str.append(goods.getPicture()).append("',");
					str.append(goods.getCount()).append(",");
					str.append(goods.getPrice()).append(",");
					str.append(goods.getTotalCount()).append(")");
					stmt.executeUpdate(str.toString());
				}
				flag=true;
				cnn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					cnn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}finally{
				SqlServerConn.ConnClose(cnn, stmt, rs);
			}
		return flag;
	}
	/**
	 * ����ָ���û��Ķ����б�
	 * @param username �µ��û���
	 * @return �����б�
	 */
	public List getMyOrderList(String username){
		String sql ="select * from t_order where scuser='"+username+"'";
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		List orderList= new ArrayList();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Order order = new Order();
				order.setNid(rs.getInt("nid"));
				order.setScUser(rs.getString("scuser"));
				order.setDgDate(rs.getString("dgDate"));
				order.setSPayType(rs.getString("spayType"));
				order.setSSendType(rs.getString("ssendType"));
				order.setNMcTypeSize(rs.getInt("nmctypesize"));
				order.setNMcSize(rs.getString("nmcsize"));
				order.setNTotalPrice(rs.getDouble("ntotalPrice"));
				order.setSStatus(rs.getString("sstatus"));
				order.setSMsg(rs.getString("smsg"));
				order.setSaUser(rs.getString("sauser"));
				order.setDaDate(rs.getString("dadate"));
				order.setSsName(rs.getString("ssname"));
				order.setSsAddress(rs.getString("ssaddress"));
				order.setSsCode(rs.getString("sscode"));
				order.setSsPhone(rs.getString("ssphone"));
				order.setSsEmail(rs.getString("ssemail"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return orderList;
	}
	/**
	 * ����������ѯ����
	 * @param request
	 * @return �����б�
	 */
	public List selectOrderList(HttpServletRequest request){
		String username = (String)request.getAttribute("username");//�û���
		String nid = (String)request.getAttribute("nid");//������
		String status = (String)request.getAttribute("status");//�Ƿ����
		StringBuffer condition =new StringBuffer();
		if(username!=null&&!username.equals("")){
			condition.append(" and scuser like '%"+username+"%'");
		}
		if(nid!=null&&!nid.equals("")){
			condition.append(" and nid="+nid);
		}
		if(status!=null){
			condition.append(" and sstatus=1");
		}

		StringBuffer sql =new StringBuffer("select * from t_order where 1=1 ");
		sql.append(condition);
		Connection cnn=SqlServerConn.getConn();
		Statement stmt=null;
		ResultSet rs=null;
		List orderList= new ArrayList();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql.toString());
			while(rs.next()){
				Order order = new Order();
				order.setNid(rs.getInt("nid"));
				order.setScUser(rs.getString("scuser"));
				order.setDgDate(rs.getString("dgDate"));
				order.setSPayType(rs.getString("spayType"));
				order.setSSendType(rs.getString("ssendType"));
				order.setNMcTypeSize(rs.getInt("nmctypesize"));
				order.setNMcSize(rs.getString("nmcsize"));
				order.setNTotalPrice(rs.getDouble("ntotalPrice"));
				order.setSStatus(rs.getString("sstatus"));
				order.setSMsg(rs.getString("smsg"));
				order.setSaUser(rs.getString("sauser"));
				order.setDaDate(rs.getString("dadate"));
				order.setSsName(rs.getString("ssname"));
				order.setSsAddress(rs.getString("ssaddress"));
				order.setSsCode(rs.getString("sscode"));
				order.setSsPhone(rs.getString("ssphone"));
				order.setSsEmail(rs.getString("ssemail"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return orderList;
	}
}


























