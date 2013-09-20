package com.softfz.dao.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/**
 * 数据库连接类
 * @author wizard
 *
 */
public class SqlServerConn {
	/**
	 * 连接数据库
	 * @return Connection
	 */
	public static Connection getConn(){
		Connection cnn=null;
		try {
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//String url ="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Online;user=hww;password=123";
			//cnn = DriverManager.getConnection(url);
			Context context = new InitialContext();
			DataSource ds= (DataSource)context.lookup("java:comp/env/jdbc/sqlserver");
			cnn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnn;
	}
	/**
	 * 关闭连接
	 * @param cnn
	 * 			数据库连接对象
	 * @param stmt
	 * 			SQL的声明语句
	 * @param rs
	 * 			结果集
	 */
	public static void ConnClose(Connection cnn,Statement stmt,ResultSet rs){
			try {
				if(cnn!=null){
					cnn.close();
					cnn=null;
				}
				if(stmt!=null){
					stmt.close();
					stmt=null;
				}
				if(rs!=null){
					rs.close();
					rs=null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
