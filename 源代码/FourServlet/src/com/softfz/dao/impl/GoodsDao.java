package com.softfz.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.softfz.dao.db.SqlServerConn;
import com.softfz.dao.dto.Goods;
import com.softfz.dao.inf.IGoodsDao;
import com.softfz.util.PageDAO;
/**
 * 物品操作类,对物品列表进行增删改查
 * @author wizard
 *	
 */
public class GoodsDao implements IGoodsDao {
	/**
	 * 通过ID得到物品
	 * @param id 
	 * @return Goods
	 */
	public Goods getGoodsById(int id) {
		Connection cnn=SqlServerConn.getConn();
		String sql="select t1.nid,t1.sname,t1.sdescription,t1.nprice,t1.simg,t1.smctag,t1.dcdate,t2.sname max,t3.sname min from t_mc t1,t_mc_type t2,t_mc_type t3 where t1.nmaxid=t2.nid and t1.nminid=t3.nid and t1.nid="+id;
		Statement stmt=null;
		ResultSet rs=null;
		Goods goods= new Goods();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if( id==rs.getInt("nid")){
					goods.setId(rs.getInt("nid"));
					goods.setName(rs.getString("sname"));
					goods.setDescrib(rs.getString("sdescription"));
					goods.setPrice(rs.getDouble("nprice"));
					goods.setPicture(rs.getString("simg"));
					goods.setSmcTag(rs.getString("smctag").equals("n")?"有货":"缺货");
					goods.setAddTime(rs.getString("dcdate"));
					goods.setMax(rs.getString("max"));
					goods.setMin(rs.getString("min"));
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return goods;
	}
	/**
	 * 删除商品
	 * @param id 商品id
	 * @return boolean
	 */
	public boolean delGoodsById(int id) {
		Connection cnn=SqlServerConn.getConn();
		String sql="delete from t_mc where nid="+id;
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
	 * 得到所有物品列表,无分页方法，已过时
	 * @return 商品列表
	 */
	public List getGoodsList() {
		Connection cnn=SqlServerConn.getConn();
		String sql="select t1.nid,t1.sname,t1.sdescription,t1.nprice,t1.simg,t1.smctag,t1.dcdate,t2.sname max,t3.sname min from t_mc t1,t_mc_type t2,t_mc_type t3 where t1.nmaxid=t2.nid and t1.nminid=t3.nid";
		Statement stmt=null;
		ResultSet rs=null;

		List<Goods> goodsList= new ArrayList();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Goods goods= new Goods();
				goods.setId(rs.getInt("nid"));
				goods.setName(rs.getString("sname"));
				goods.setDescrib(rs.getString("sdescription"));
				goods.setPrice(rs.getDouble("nprice"));
				goods.setPicture(rs.getString("simg"));
				goods.setSmcTag(rs.getString("smctag").equals("n")?"有货":"缺货");
				goods.setAddTime(rs.getString("dcdate"));
				goods.setMax(rs.getString("max"));
				goods.setMin(rs.getString("min"));
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return goodsList;
	}
	/**
	 * 得到物品分页列表之后台显示
	 * @param request
	 * @return 商品列表容器
	 */
	public List getGoodsListBack(HttpServletRequest request) {
		//查询条件
		StringBuffer condition = new StringBuffer();
		//查询总记录数
		StringBuffer querycount = new StringBuffer("select count(nid) num from t_mc t1 where 1=1");
		//获得符合条件的记录
		StringBuffer queryall = new StringBuffer();
		
		//获得搜索字符串
		String name = request.getParameter("name");
		String min=request.getParameter("min");
		String max =request.getParameter("max");
		request.setAttribute("name", name);
		if(name!=null && !name.equals(""))
		{
			condition.append(" and t1.sname like '%").append(name).append("%'") ;
		}
		if(min!=null&&!min.equals("-1")){
			condition.append(" and nminid =").append(min).append(" ") ;
		}
		if(max!=null&&!max.equals("-1")){
			condition.append(" and nmaxid =").append(max).append(" ") ;
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
		queryall.append("select * from (select rownum rn,t1.nid,t1.sname,t1.sdescription,t1.nprice,t1.simg,t1.smctag,t1.dcdate,t2.sname max,t3.sname min from t_mc t1,t_mc_type t2,t_mc_type t3 where t1.nmaxid=t2.nid and t1.nminid=t3.nid ");
		queryall.append(condition.toString()).append(") a ");
		queryall.append("where a.rn >");
		queryall.append((currentpage-1)*pagesize);
		queryall.append(" and rownum <=");
		queryall.append(pagesize);
//System.out.println(queryall.toString());
		List goodsList = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt=null;
		Connection cnn=SqlServerConn.getConn();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(queryall.toString());
			while(rs.next()){
				Goods goods= new Goods();
				goods.setId(rs.getInt("nid"));
				goods.setName(rs.getString("sname"));
				goods.setDescrib(rs.getString("sdescription"));
				goods.setPrice(rs.getDouble("nprice"));
				goods.setPicture(rs.getString("simg"));
				goods.setSmcTag(rs.getString("smctag").equals("n")?"有货":"缺货");
				goods.setAddTime(rs.getString("dcdate"));
				goods.setMax(rs.getString("max"));
				goods.setMin(rs.getString("min"));
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return goodsList;
	}
	/**
	 * 得到物品列表之前台分页显示
	 * @param request 
	 * @return 商品列表容器
	 */
	public List getGoodsList(HttpServletRequest request) {
		//查询条件
		StringBuffer condition = new StringBuffer();
		//查询总记录数
		StringBuffer querycount = new StringBuffer("select count(nid) num from t_mc where 1=1");
		//获得符合条件的记录
		StringBuffer queryall = new StringBuffer();
		
		//获得搜索字符串
		String name = request.getParameter("name");
		String min=request.getParameter("min");
		String max =request.getParameter("max");
		request.setAttribute("name", name);
		if(name!=null && !name.equals(""))
		{
			condition.append(" and sname like '%").append(name).append("%'") ;
		}
		if(min!=null&&!min.equals("-1")){
			condition.append(" and nminid =").append(min).append(" ") ;
		}
		if(max!=null&&!max.equals("-1")){
			condition.append(" and nmaxid =").append(max).append(" ") ;
		}
		
		//设置每页行数
		PageDAO page = new PageDAO(request);
		page.setPagesize(9);
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
		queryall.append("select * from (select rownum rn, t.* from t_mc t where 1=1 ");
		queryall.append(condition.toString()).append(") a ");
		queryall.append("where a.rn >");
		queryall.append((currentpage-1)*pagesize);
		queryall.append(" and rownum <=");
		queryall.append(pagesize);
//System.out.println(queryall.toString());
		List goodsList = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt=null;
		Connection cnn=SqlServerConn.getConn();
		try {
			stmt = cnn.createStatement();
			rs=stmt.executeQuery(queryall.toString());
			while(rs.next()){
				Goods goods= new Goods();
				goods.setId(rs.getInt("nid"));
				goods.setName(rs.getString("sname"));
				goods.setPrice(rs.getDouble("nprice"));
				goods.setPicture(rs.getString("simg"));
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return goodsList;
	}
	/**
	 * 增加商品
	 * @param map 商品参数集合
	 * @return 是否增加成功
	 */
	public boolean addGoods(Map map) {
		boolean flag=false;
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append("insert into t_mc(nid,sname,sdescription,nprice,simg,smctag,dcdate,nmaxid,nminid) values(seq_t_mc.nextval,'");
		sql.append(map.get("name")).append("','");
		sql.append(map.get("describ")).append("',");
		sql.append(map.get("price")).append(",'");
		sql.append(map.get("picture")).append("','");
		sql.append(map.get("smctag")).append("',sysdate,");
		sql.append(map.get("max")).append(",");
		sql.append(map.get("min")).append(")");
//System.out.println(sql.toString());
		Connection cnn=SqlServerConn.getConn();
		try {
			stmt = cnn.createStatement();
			stmt.executeUpdate(sql.toString());
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
	/**
	 * 更新商品
	 * @param map
	 * @return 是否更新成功
	 */
	public boolean updateGoods(Map map){
		boolean flag=false;
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt=null;	
		StringBuffer sql=new StringBuffer("update t_mc set sname='");
		sql.append(map.get("name")).append("',sdescription='");
		sql.append(map.get("describ")).append("',nprice=");
		sql.append(map.get("price")).append(",smctag='");
		sql.append(map.get("smctag")).append("',simg='");
		sql.append(map.get("picture")).append("',nmaxid=");
		sql.append(map.get("max")).append(",nminid=");
		sql.append(map.get("min")).append(" where nid=").append(map.get("id"));
//System.out.println(sql.toString());
		Connection cnn=SqlServerConn.getConn();
		try {
			stmt = cnn.createStatement();
			stmt.executeUpdate(sql.toString());
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			SqlServerConn.ConnClose(cnn, stmt, rs);
		}
		return flag;
	}
}
