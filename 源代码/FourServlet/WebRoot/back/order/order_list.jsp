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
    
    <title>�����б�</title>
    
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
				obj.value="����߹���˵�";
			}
			else{
				parent.frame.cols="195,*";
				displayBar=true;
				obj.value="�ر���߹���˵�";
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
	  		<option value="nid" ${condition=="nid"?"selected":"" }>������</option>
	  		<option value="username" ${condition=="username"?"selected":"" }>�û���</option>
	  		<option value="status" ${condition=="status"?"selected":"" }>δ���</option>
	  	</select>
		  <input type="text" name="value" value="<%=request.getAttribute("username")!=null?request.getAttribute("username"):request.getAttribute("nid")!=null?request.getAttribute("nid"):""%>">
		  <input type="submit" value="��ѯ">
	  </form>
  
    <%!HttpSession session; %>
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						�����б�
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">�������</td>
					<td class="td_bg">�µ��û�</td>
					<td class="td_bg">�µ�ʱ��</td>
					<td class="td_bg">���ʽ</td>
					<td class="td_bg">���˷�ʽ</td>
					<td class="td_bg">��Ʒ����</td>			
					<td class="td_bg">��Ʒ����</td>
					<td class="td_bg">�ܼ�</td>
					<td class="td_bg">����״̬</td>
					<td class="td_bg" colspan="2">����</td>
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
				   			<td class="td_bg"><%=order.getSStatus().equals("1")?"δ���":order.getSStatus().equals("2")?"ͨ��":"��ͨ��" %></td>
							<%session.setAttribute(String.valueOf(order.getNid()),order); %>
				      <td class="td_bg"><a href="<%=path%>/servlet/OrderServlet?method=del&nid=<%=order.getNid()%>" 
				      onClick="return confirm('ȷ��ɾ��?')?true:false;">ɾ��</a></td>
   					  <td class="td_bg"><a href="<%=path%>/back/order/order_detail.jsp?nid=<%=order.getNid()%>">�鿴����</a></td>
   					  </tr>
					  <%
						}
					  %>
				</c:when>
				<c:otherwise>
					<td class="td_bg" colspan="11">��������</td>
				</c:otherwise>
			</c:choose>
			<p>${requestScope.pagetool}</p>
			</tbody>
		</table>

  </body>
</html>