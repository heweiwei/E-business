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
						��������
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">�������</td><td class="td_bg"><%=order.getNid() %></td>
				</tr>
				<tr>
					<td class="td_bg">�µ��û�</td><td class="td_bg"><%=order.getScUser() %></td>
				</tr>
				<tr>
					<td class="td_bg">�µ�ʱ��</td><td class="td_bg"><%=order.getDgDate().substring(0,order.getDgDate().lastIndexOf(".")) %></td>
				</tr>
				<tr>
					<td class="td_bg">���ʽ</td><td class="td_bg"><%=order.getSPayType() %></td>
				</tr>
				<tr>
					<td class="td_bg">���˷�ʽ</td><td class="td_bg"><%=order.getSSendType() %></td>
				</tr>
				<tr>
					<td class="td_bg">��Ʒ����</td><td class="td_bg"><%=order.getNMcTypeSize()%></td>
								</tr>
				<tr>			
					<td class="td_bg">��Ʒ����</td><td class="td_bg"><%=order.getNMcSize() %></td>
				</tr>
				<tr>
					<td class="td_bg">�ܼ�</td><td class="td_bg"><%=order.getNTotalPrice() %></td>
				</tr>
				<tr>
					<td class="td_bg">����״̬</td><td class="td_bg"><%=order.getSStatus().equals("1")?"δ���":order.getSStatus().equals("2")?"ͨ��":"δͨ��" %></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="td_bg">�ջ���</td><td class="td_bg"><%=order.getSsName()%></td>
				</tr>
				<tr>
					<td class="td_bg">�ջ��˵�ַ</td><td class="td_bg"><%=order.getSsAddress()%></td>
				</tr>
				<tr>
					<td class="td_bg">�ջ����ʱ�</td><td class="td_bg"><%=order.getSsCode()%></td>
				</tr>
				<tr>
					<td class="td_bg">�ջ�����ϵ�绰</td><td class="td_bg"><%=order.getSsPhone()%></td>
				</tr>
				<tr>
					<td class="td_bg">�ջ�������</td><td class="td_bg"><%=order.getSsEmail()%></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="td_bg">�����</td><td class="td_bg"><%=order.getSaUser()==null?"":order.getSaUser()%></td>
				</tr>
				<tr>
					<td class="td_bg">���ʱ��</td><td class="td_bg"><%=order.getDaDate()==null?"":order.getDaDate().substring(0,order.getDaDate().lastIndexOf("."))%></td>
				</tr>
				<tr>
					<td class="td_bg">��������</td><td class="td_bg"><%=order.getSMsg()==null?"":order.getSMsg()%></td>
				</tr>
				<tr>
					<td class="bg_tr" colspan="2" align="center">����</td>
				</tr>
				<tr>
				  <td class="td_bg">
				  <%
				  	if(order.getSaUser()==null){
				  %>
				 	  <form action="<%=path%>/servlet/OrderServlet?method=check&id=<%=order.getNid()%>" method="post">
				 	  	  	���
					      <input type="radio" value="2" name="check" checked="checked"/>��׼
					      <input type="radio" value="3" name="check" />�ܾ�<br/>
					                ����������<textarea rows="5" cols="20" name="reply"></textarea>
					      <input type="submit" value="�ύ" onClick="return confirm('ȷ���ύ?')?true:false;"/>
				      </form>
				    <% 
				  	}
				    %>
				  </td>
   				  <td class="td_bg">
   				  <a href="<%=path%>/servlet/OrderServlet?method=orderItem&nid=<%=order.getNid()%>">������ϸ</a>
   				  <a href="#" onclick="javascript:history.back(-1);return false;">���ض���ҳ</a>
   				  </td>
   				  
   				</tr>

			<p>${requestScope.pagetool}</p>
			</tbody>
		</table>

  </body>
</html>