<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.User" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û��б�</title>
    
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
  
	  <form action="<%=path%>/servlet/UserServlet?method=list" method="post">
		  �û�����<input type="text" name="name" value="${requestScope.name }">
		  <input type="submit" value="��ѯ">
	  </form>
  
 
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						��Ʒ�б�
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">�û���</td>
					<td class="td_bg">����</td>
					<td class="td_bg">��ʵ����</td>
					<td class="td_bg">�Ա�</td>
					
					
					<td class="td_bg">�ֻ�����</td>

					<td class="td_bg">�ʱ�</td>			
					<td class="td_bg">Ȩ�޼���</td>
					<td class="td_bg">ע��ʱ��</td>
					<td class="td_bg">�Ƿ񶳽�</td>
					<td class="td_bg">����½ʱ��</td>
					<td class="td_bg">��½����</td>
					<td class="td_bg" colspan="2">����</td>
				</tr>
				
		    <%
	   		List<User> userList = (ArrayList)request.getAttribute("userList");
	   		%>
			<c:choose>
				<c:when test="${!empty userList}">
						<%
				   		for(User user:userList){
				   		%>
				   		<tr>
				   			<td class="td_bg"><%=user.getUsername()%></td>
				   			<td class="td_bg"><%=user.getPassword()%></td>
				   			<td class="td_bg"><%=user.getRealName()%></td>
				   			<td class="td_bg"><%=user.getSex().equals("m")?"��":"Ů"%></td>
				   			
				   			
	   				   		<td class="td_bg"><%=user.getPhoneNumber()%></td>
		
				   			<td class="td_bg"><%=user.getPostCode()%></td>
				   			<td class="td_bg"><%=user.getRole().equals("1")?"��������Ա":user.getRole().equals("5")?"��ͨ����Ա":"ע���û�"%></td>
				   			<td class="td_bg"><%=user.getRegisterTime()%></td>
				   			<td class="td_bg"><%=user.getSlock().equals("0")?"�ⶳ":"����"%></td>
				   			<td class="td_bg"><%=user.getLastLoginTime()%></td>
				   			<td class="td_bg"><%=user.getLoginNum()%></td>
				   	<%
				   		session.setAttribute(user.getUsername(),user);
				   	%>
				      <td class="td_bg"><a href="<%=path%>/servlet/UserServlet?method=del&username=<%=user.getUsername()%>" 
				      onClick="return confirm('ȷ��ɾ��?')?true:false;">ɾ��</a></td>
   					  <td class="td_bg"><a href="<%=path%>/back/user/user_update.jsp?username=<%=user.getUsername()%>">�޸�</a></td>
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