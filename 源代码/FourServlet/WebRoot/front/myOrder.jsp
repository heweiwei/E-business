<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.softfz.dao.dto.Order;"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ҵĶ���</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/userUpdate.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/iecss.css" />
	<script type="text/javascript" src="<%=path%>/front/js/boxOver.js"></script>
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
	<script language=javascript src="<%=path %>/back/admin/js/calendar.js"></script>
	<script language=JavaScript src="<%=path %>/back/admin/js/regcheckdata.js"></script> 
  </head>
  <body>
 <c:import url="/front/top.jsp"></c:import>
    <div id="main_container">
   		<div id="main_content" >
    		<div class="crumb_navigation">
  	  		����: <span class="current">�û���Ϣҳ->�ҵĶ���</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">�ҵĶ���</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">            
	
	
			<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td class="Text01">�������</td>
			<td class="Text01">�µ�ʱ��</td>
		   	<td class="Text01">֧����ʽ</td>
		    <td class="Text01">���˷�ʽ</td>
		    <td class="Text01">��Ʒ�ܼ�</td>
		    <td class="Text01">����״̬</td>
		   </tr>
		  <%
	   		List<Order> orderList = (ArrayList)request.getAttribute("myOrderList");
	   	%>

						<%
				   		for(Order order:orderList){
				   		%>
				   		<tr>
				   			<td class="Text01"><%=order.getNid() %></td>
				   			<td class="Text01"><%=order.getDgDate().substring(0,order.getDgDate().lastIndexOf(".")) %></td>
				   			<td class="Text01"><%=order.getSPayType() %></td>
	   				   		<td class="Text01"><%=order.getSSendType() %></td>
				   			<td class="Text01"><%=order.getNTotalPrice() %></td>
				   			<td class="Text01"><%=order.getSStatus().equals("1")?"δ���":order.getSStatus().equals("2")?"ͨ��":"δͨ��" %></td>
							<%session.setAttribute(String.valueOf(order.getNid()),order); %>
   					  <td class="Text01"><a href="<%=path%>/front/myOrderDetail.jsp?nid=<%=order.getNid()%>">�鿴����</a></td>
   					  </tr>
					  <%
						}
					  %>
					  <tr>
					  	<td colspan="8" align="center"><a href="<%=path%>/front/userInfo.jsp">�����û���Ϣҳ</a></td>
					  </tr>
	</table>
            </div> 
          </div>
      </div>
	   
   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
