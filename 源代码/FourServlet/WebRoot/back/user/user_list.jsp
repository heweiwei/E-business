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
    
    <title>用户列表</title>
    
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
  
	  <form action="<%=path%>/servlet/UserServlet?method=list" method="post">
		  用户名：<input type="text" name="name" value="${requestScope.name }">
		  <input type="submit" value="查询">
	  </form>
  
 
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="14" height="25">
						商品列表
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">用户名</td>
					<td class="td_bg">密码</td>
					<td class="td_bg">真实姓名</td>
					<td class="td_bg">性别</td>
					
					
					<td class="td_bg">手机号码</td>

					<td class="td_bg">邮编</td>			
					<td class="td_bg">权限级别</td>
					<td class="td_bg">注册时间</td>
					<td class="td_bg">是否冻结</td>
					<td class="td_bg">最后登陆时间</td>
					<td class="td_bg">登陆次数</td>
					<td class="td_bg" colspan="2">操作</td>
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
				   			<td class="td_bg"><%=user.getSex().equals("m")?"男":"女"%></td>
				   			
				   			
	   				   		<td class="td_bg"><%=user.getPhoneNumber()%></td>
		
				   			<td class="td_bg"><%=user.getPostCode()%></td>
				   			<td class="td_bg"><%=user.getRole().equals("1")?"超级管理员":user.getRole().equals("5")?"普通管理员":"注册用户"%></td>
				   			<td class="td_bg"><%=user.getRegisterTime()%></td>
				   			<td class="td_bg"><%=user.getSlock().equals("0")?"解冻":"冻结"%></td>
				   			<td class="td_bg"><%=user.getLastLoginTime()%></td>
				   			<td class="td_bg"><%=user.getLoginNum()%></td>
				   	<%
				   		session.setAttribute(user.getUsername(),user);
				   	%>
				      <td class="td_bg"><a href="<%=path%>/servlet/UserServlet?method=del&username=<%=user.getUsername()%>" 
				      onClick="return confirm('确定删除?')?true:false;">删除</a></td>
   					  <td class="td_bg"><a href="<%=path%>/back/user/user_update.jsp?username=<%=user.getUsername()%>">修改</a></td>
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