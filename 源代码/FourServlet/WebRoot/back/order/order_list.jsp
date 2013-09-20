<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.Order" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单列表</title>
    
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
  
	  <form action="<%=path%>/servlet/OrderServlet?method=condition" method="post">
	  	<select name="condition">
	  		<option value="nid" ${condition=="nid"?"selected":"" }>订单号</option>
	  		<option value="username" ${condition=="username"?"selected":"" }>用户名</option>
	  		<option value="status" ${condition=="status"?"selected":"" }>未审核</option>
	  	</select>
		  <input type="text" name="value" value="<%=request.getAttribute("username")!=null?request.getAttribute("username"):request.getAttribute("nid")!=null?request.getAttribute("nid"):""%>">
		  <input type="submit" value="查询">
	  </form>
  
    <%!HttpSession session; %>
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						订单列表
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">订单编号</td>
					<td class="td_bg">下单用户</td>
					<td class="td_bg">下单时间</td>
					<td class="td_bg">付款方式</td>
					<td class="td_bg">货运方式</td>
					<td class="td_bg">商品总数</td>			
					<td class="td_bg">商品种类</td>
					<td class="td_bg">总计</td>
					<td class="td_bg">订单状态</td>
					<td class="td_bg" colspan="2">操作</td>
				</tr>
				
		    <%
	   		List<Order> orderList = (ArrayList)request.getAttribute("orderList");
	   		%>
			<c:choose>
				<c:when test="${!empty orderList}">
						<%
				   		for(Order order:orderList){
				   		%>
				   		<tr>
				   			<td class="td_bg"><%=order.getNid() %></td>
				   			<td class="td_bg"><%=order.getScUser() %></td>
				   			<td class="td_bg"><%=order.getDgDate().substring(0,order.getDgDate().lastIndexOf(".")) %></td>
				   			<td class="td_bg"><%=order.getSPayType() %></td>
	   				   		<td class="td_bg"><%=order.getSSendType() %></td>
				   			<td class="td_bg"><%=order.getNMcTypeSize()%></td>
				   			<td class="td_bg"><%=order.getNMcSize() %></td>
				   			<td class="td_bg"><%=order.getNTotalPrice() %></td>
				   			<td class="td_bg"><%=order.getSStatus().equals("1")?"未审核":order.getSStatus().equals("2")?"通过":"不通过" %></td>
							<%session.setAttribute(String.valueOf(order.getNid()),order); %>
				      <td class="td_bg"><a href="<%=path%>/servlet/OrderServlet?method=del&nid=<%=order.getNid()%>" 
				      onClick="return confirm('确定删除?')?true:false;">删除</a></td>
   					  <td class="td_bg"><a href="<%=path%>/back/order/order_detail.jsp?nid=<%=order.getNid()%>">查看详情</a></td>
   					  </tr>
					  <%
						}
					  %>
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