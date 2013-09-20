<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.Admin" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����Ա�б�</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
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
  
	  <form action="/FourServlet/servlet/AdminServlet?method=list" method="post">
		  �û�����<input type="text" name="username">
		  <input type="submit" value="��ѯ">
	  </form>
  
    <%!HttpSession session; %>
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="11" height="25">
						�û��б�
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">�û���</td>
					<td class="td_bg">����</td>
					<td class="td_bg">��ʵ����</td>
					<td class="td_bg">�Ա�</td>
					<td class="td_bg">����</td>
					<td class="td_bg">email</td>
					<td class="td_bg">�ֻ�����</td>
					<td class="td_bg">��ַ</td>
					<td class="td_bg">�ʱ�</td>
					<td class="td_bg">�û�����</td>
					<td class="td_bg" colspan="2">����</td>
				</tr>
				
		    <%
	   		List<Admin> users = (ArrayList)request.getAttribute("users");
	   		%>
			<c:choose>
				<c:when test="${!empty users}">
						<%
				   		for(Admin a:users){
				   		%>
				   		<tr>
				   			<td class="td_bg"><%=a.getUsername() %></td>
				   			<td class="td_bg"><%=a.getPassword() %></td>
				   			<td class="td_bg"><%=a.getRealName() %></td>
				   			<td class="td_bg"><%=a.getSex() %></td>
				   			<td class="td_bg"><%=a.getBirthday() %></td>
				   			<td class="td_bg"><%=a.getEmail() %></td>
				   			<td class="td_bg"><%=a.getPhoneNumber() %></td>
				   			<td class="td_bg"><%=a.getAddress() %></td>
				   			<td class="td_bg"><%=a.getPostCode() %></td>	
				   			<td class="td_bg"><%=a.getRole().equals("1")?"��������Ա":"��ͨ����Ա"%></td>	   
				      <td class="td_bg"><a href="<%=path %>/servlet/AdminServlet?method=del&username=<%=a.getUsername()%>" onClick="return confirm('ȷ��ɾ��?')?true:false;">ɾ��</a></td>
   					  <td class="td_bg"><a href="<%=path %>/back/admin/AdminUpdate.jsp?username=<%=a.getUsername()%>">�޸�</a></td>
   					  </tr>
					  <%
						session=request.getSession();
					   	session.setAttribute(a.getUsername(),a);
						}
					  %>
				</c:when>
				<c:otherwise>
					<td class="td_bg" colspan="11">��������</td>
				</c:otherwise>
			</c:choose>

			</tbody>
		</table>

  </body>
</html>