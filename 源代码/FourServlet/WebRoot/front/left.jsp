<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.softfz.dao.impl.TypeDao;"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!TypeDao typeDao= new TypeDao(); %>
<%
	Map map= typeDao.getMcType(); 
	String [][] type=(String[][])map.get("type");
	int [][] typeid=(int [][])map.get("typeid");
%>
 	<div class="left_content">
		<div class="title_box">
			商品分类
		</div>
		<ul class="left_menu">
			<%
				for(int i=0;i<type.length;i++){
					if(type[i][0]==null)break;
			%>
				<li class="even">
					<a href="<%=path%>/servlet/GoodsServlet?method=divList&max=<%=typeid[i][0]%>"><%=type[i][0]%></a>
				</li>
			<%
					for(int j=1;j<type[i].length;j++){
						if(type[i][j]==null)break;	
			%>
				<li class="odd">
					<p align="center">
						<a href="<%=path%>/servlet/GoodsServlet?method=divList&min=<%=typeid[i][j]%>"><%=type[i][j]%>&nbsp;&nbsp;&nbsp;</a>
					</p>
				</li>
			<%
					}
				}
			%>
	
		</ul>
	</div>
