<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.Order,com.softfz.dao.dto.Admin" pageEncoding="GBK"%>
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
  <br/>

    <%!HttpSession session; %>
    <%

    	String nid=request.getParameter("nid");
    	Order order=(Order)session.getAttribute(nid); 
    %>
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						订单详情
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">订单编号</td><td class="td_bg"><%=order.getNid() %></td>
				</tr>
				<tr>
					<td class="td_bg">下单用户</td><td class="td_bg"><%=order.getScUser() %></td>
				</tr>
				<tr>
					<td class="td_bg">下单时间</td><td class="td_bg"><%=order.getDgDate().substring(0,order.getDgDate().lastIndexOf(".")) %></td>
				</tr>
				<tr>
					<td class="td_bg">付款方式</td><td class="td_bg"><%=order.getSPayType() %></td>
				</tr>
				<tr>
					<td class="td_bg">货运方式</td><td class="td_bg"><%=order.getSSendType() %></td>
				</tr>
				<tr>
					<td class="td_bg">商品总数</td><td class="td_bg"><%=order.getNMcTypeSize()%></td>
								</tr>
				<tr>			
					<td class="td_bg">商品种类</td><td class="td_bg"><%=order.getNMcSize() %></td>
				</tr>
				<tr>
					<td class="td_bg">总计</td><td class="td_bg"><%=order.getNTotalPrice() %></td>
				</tr>
				<tr>
					<td class="td_bg">订单状态</td><td class="td_bg"><%=order.getSStatus().equals("1")?"未审核":order.getSStatus().equals("2")?"通过":"未通过" %></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="td_bg">收货人</td><td class="td_bg"><%=order.getSsName()%></td>
				</tr>
				<tr>
					<td class="td_bg">收货人地址</td><td class="td_bg"><%=order.getSsAddress()%></td>
				</tr>
				<tr>
					<td class="td_bg">收货人邮编</td><td class="td_bg"><%=order.getSsCode()%></td>
				</tr>
				<tr>
					<td class="td_bg">收货人联系电话</td><td class="td_bg"><%=order.getSsPhone()%></td>
				</tr>
				<tr>
					<td class="td_bg">收货人邮箱</td><td class="td_bg"><%=order.getSsEmail()%></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="td_bg">审核人</td><td class="td_bg"><%=order.getSaUser()==null?"":order.getSaUser()%></td>
				</tr>
				<tr>
					<td class="td_bg">审核时间</td><td class="td_bg"><%=order.getDaDate()==null?"":order.getDaDate().substring(0,order.getDaDate().lastIndexOf("."))%></td>
				</tr>
				<tr>
					<td class="td_bg">订单反馈</td><td class="td_bg"><%=order.getSMsg()==null?"":order.getSMsg()%></td>
				</tr>
				<tr>
					<td class="bg_tr" colspan="2" align="center">操作</td>
				</tr>
				<tr>
				  <td class="td_bg">
				  <%
				  	if(order.getSaUser()==null){
				  %>
				 	  <form action="<%=path%>/servlet/OrderServlet?method=check&id=<%=order.getNid()%>" method="post">
				 	  	  	审核
					      <input type="radio" value="2" name="check" checked="checked"/>批准
					      <input type="radio" value="3" name="check" />拒绝<br/>
					                订单反馈：<textarea rows="5" cols="20" name="reply"></textarea>
					      <input type="submit" value="提交" onClick="return confirm('确定提交?')?true:false;"/>
				      </form>
				    <% 
				  	}
				    %>
				  </td>
   				  <td class="td_bg">
   				  <a href="<%=path%>/servlet/OrderServlet?method=orderItem&nid=<%=order.getNid()%>">订单明细</a>
   				  <a href="#" onclick="javascript:history.back(-1);return false;">返回订单页</a>
   				  </td>
   				  
   				</tr>

			<p>${requestScope.pagetool}</p>
			</tbody>
		</table>

  </body>
</html>