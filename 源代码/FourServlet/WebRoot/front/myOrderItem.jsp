<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.softfz.dao.dto.Order_Item;"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单详情</title>
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
  	  		你在: <span class="current">用户信息页->我的订单->订单详情->订单明细</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">我的订单详情</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">            
	
	
			<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td class="Text01">订单编号</td>
			<td class="Text01">商品ID</td>
		   	<td class="Text01">商品名</td>
		    <td class="Text01">商品描述</td>
		    <td class="Text01">商品图片</td>
		    <td class="Text01">数量</td>
		    <td class="Text01">单价</td>
		    <td class="Text01">总价</td>
		   </tr>
		  	<%
	   		List<Order_Item> orderItemList = (ArrayList)request.getAttribute("myorderItemList");
	   		for(Order_Item orderItem:orderItemList){
	   		%>
	   		<tr>
	   			<td class="Text01"><%=orderItem.getNid() %></td>
	   			<td class="Text01"><%=orderItem.getnMcId() %></td>
	   			<td class="Text01"><%=orderItem.getsMcName() %></td>
 				<td class="Text01"><%=orderItem.getsDescription() %></td>
	   			<td class="Text01"><img src="<%=path%>/front/images/product/<%=orderItem.getSimg().equals("null")?"default.jpg":orderItem.getSimg()%>" alt="" title="" border="0" onload="AutoResizeImage(94,71,this)"/></td>
	   			<td class="Text01"><%=orderItem.getnCount() %></td>
	   			<td class="Text01"><%=orderItem.getNprice() %></td>
	   			<td class="Text01"><%=orderItem.getnTotalPrice()%></td>
			 </tr>
		  <%
			}
		  %>
		  <tr>
		  	<td>
				<input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回订单详情" />
		  	</td>
		  </tr>
			<p>${requestScope.pagetool}</p>
	</table>
            </div> 
          </div>
      </div>
	   
   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
