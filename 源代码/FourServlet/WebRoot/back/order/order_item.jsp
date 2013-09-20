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
    
    <title>������ϸ</title>
    
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
    <%!HttpSession session; %>

  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						������ϸ
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">���</td>
					<td class="td_bg">��������</td>
					<td class="td_bg">������ƷID</td>
					<td class="td_bg">��Ʒ��</td>
					<td class="td_bg">��Ʒ����</td>
					<td class="td_bg">��ƷͼƬ</td>			
					<td class="td_bg">��Ʒ��</td>
					<td class="td_bg">��Ʒ����</td>
					<td class="td_bg">С��</td>
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
					  <a href="#" onclick="javascript:history.back(-1);return false;">���ض�������ҳ</a>
					  </td>
					  </tr>
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