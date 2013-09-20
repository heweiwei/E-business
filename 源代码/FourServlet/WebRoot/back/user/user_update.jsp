<%@ page language="java" import="java.util.*,com.softfz.dao.dto.User" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!HttpSession session; %>
<%
	session=request.getSession();
	User user=(User)session.getAttribute(request.getParameter("username"));
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title>table</title>
		<link href="<%=path%>/back/admin/css/css.css" rel="stylesheet" type="text/css">
		<script language=JavaScript src="<%=path%>/back/user/js/updateUser.js"></script> 
		<script language=javascript src="<%=path%>/back/admin/js/calendar.js"></script>
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
	<form name="form" action="<%=path%>/servlet/UserServlet?method=update" method="post" onSubmit="return checkdata()">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						用户信息
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						用户名：
					</td>
					<td class="td_bg">
						<input type=text name="username" readOnly value="<%=user.getUsername() %>" size="30" maxlength="18">
						用户名长度限为3-18位
						<br>
						<span class="TableRow1"></span>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						密码：
						<br>
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						<input type=text name="pwd" value="<%=user.getPassword()%>" size="15" maxlength="16">
						密码长度限为6-16位，仅可用英文、数字、特殊字符
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						真实姓名：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="realName" value="<%=user.getRealName() %>" size="10" maxlength="10">
						中文，2-10个字符
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						性别：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=radio name="sex" value="m" <%=user.getSex().equals("m")?"checked":""%>>男
						<input type=radio name="sex" value="f"<%=user.getSex().equals("m")?"":"checked"%>>女
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						出生日期：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<INPUT name="birthday" value="<%=user.getBirthday() %>" onfocus=calendar() readOnly size="20" maxlength="20" />
						格式yyyy-mm-dd
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">电子邮箱：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="email" value="<%=user.getEmail() %>" size="20" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">手机号码：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="phoneNumber" value="<%=user.getPhoneNumber() %>" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">地址：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="address" value="<%=user.getAddress() %>" size="20" maxlength="100"/>
						长度不得大于100
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">邮编：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="postCode" value="<%=user.getPostCode() %>" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">权限级别：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="role">
							<option value="9" <%=user.getRole().equals("9")?"selected":"" %>>注册用户</option>
							<option value="5" <%=user.getRole().equals("5")?"selected":"" %>>普通管理员</option>
							<option value="1" <%=user.getRole().equals("1")?"selected":"" %>>超级管理员</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">是否冻结：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="slock">
							<option value="1" <%=user.getSlock().equals("1")?"selected":"" %>>冻结</option>
							<option value="0" <%=user.getSlock().equals("0")?"selected":"" %>>解冻</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg"></td>
					<td class="td_bg">
						<input type="submit" value="修改"  onClick="return confirm('确定修改?')?true:false;">
						<input type="reset" value="重置">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<br>
	</body>
</html>

