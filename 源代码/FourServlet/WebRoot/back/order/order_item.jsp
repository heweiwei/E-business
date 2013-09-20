<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.Order_Item" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单明细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
  </head>
  	<SCRIPT language=javascript>
		var displayBar=true;
		function switchBar(obj){
			if (displayBar)
			{
				parent.frame.cols="0,*";
				displayBar=false;
				obj.value="打开左边管理菜单";
			}
			else{
				parent.frame.cols="195,*";
				displayBar=true;
				obj.value="关闭左边管理菜单";
			}
		}
		
		function fullmenu(url){
			if (url==null) {url = "admin_left.asp";}
			parent.leftFrame.location = url;
		}
	</SCRIPT>
  <body>
  <br><br><br>
    <%!HttpSession session; %>

  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						订单明细
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">编号</td>
					<td class="td_bg">所属订单</td>
					<td class="td_bg">订购商品ID</td>
					<td class="td_bg">商品名</td>
					<td class="td_bg">商品简述</td>
					<td class="td_bg">商品图片</td>			
					<td class="td_bg">商品数</td>
					<td class="td_bg">商品单价</td>
					<td class="td_bg">小计</td>
				</tr>
		    <%
	   		List<Order_Item> orderItemList = (ArrayList)request.getAttribute("orderItemList");
	   		%>
			<c:choose>
				<c:when test="${!empty orderItemList}">
						<%
				   		for(Order_Item orderItem:orderItemList){
				   		%>
				   		<tr>
				   			<td class="td_bg"><%=orderItem.getNid() %></td>
				   			<td class="td_bg"><%=orderItem.getnOrderId() %></td>
				   			<td class="td_bg"><%=orderItem.getnMcId() %></td>
				   			<td class="td_bg"><%=orderItem.getsMcName()%></td>
	   				   		<td class="td_bg"><%=orderItem.getsDescription() %></td>
				   			<td class="td_bg"><img src="<%=path%>/front/images/product/<%=orderItem.getSimg().equals("null")?"default.jpg":orderItem.getSimg()%>" alt="" title="" border="0" onload="AutoResizeImage(94,71,this)"/></td>
				   			<td class="td_bg"><%=orderItem.getnCount() %></td>
				   			<td class="td_bg"><%=orderItem.getNprice() %></td>
				   			<td class="td_bg"><%=orderItem.getnTotalPrice()%></td>
					  <%
						}
					  %>
					  <tr>
					  <td align="right" colspan="10">
					  <a href="#" onclick="javascript:history.back(-1);return false;">返回订单详情页</a>
					  </td>
					  </tr>
				</c:when>
				<c:otherwise>
					<td class="td_bg" colspan="11">查无数据</td>
				</c:otherwise>
			</c:choose>

			<p>${requestScope.pagetool}</p>
			</tbody>
		</table>

  </body>
</html>