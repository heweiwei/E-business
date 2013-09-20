<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title>table</title>
		<link href="<%=path%>/back/admin/css/css.css" rel="stylesheet" type="text/css">
		<script language=JavaScript src="<%=path%>/back/admin/js/regcheckdata.js"></script> 
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
	<form name="form" action="<%=path%>/servlet/UserServlet?method=addFromBack" method="post" onSubmit="return checkdata()">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						用户注册
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						用户名：
					</td>
					<td class="td_bg">
						<input type=text name="username" size="30" maxlength="18">
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
						<input type=password name="pwd" size="15" maxlength="16">
						密码长度限为6-16位，仅可用英文、数字、特殊字符
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						密码确认：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg"">
						<input type=password name="pwd2" size="15" maxlength="12">
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						真实姓名：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="realName" size="10" maxlength="10">
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
						<input type=radio name="sex" value="m" checked>男
						<input type=radio name="sex" value="f">女
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						出生日期：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<INPUT name="birthday" onfocus=calendar() readOnly size="20" maxlength="20" />
						格式yyyy-mm-dd
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">电子邮箱：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="email" size="20" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">手机号码：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="phoneNumber" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">地址：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="address" size="20" maxlength="100"/>
						长度不得大于100
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">邮编：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="postCode" size="20" maxlength="20"/>
					</td>
				</tr>
								<tr>
					<td class="td_bg" height="23">权限级别：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="role">
							<option value="9">注册用户</option>
							<option value="5">普通管理员</option>
							<option value="1">超级管理员</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">是否冻结：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="slock">
							<option value="1">冻结</option>
							<option value="0">解冻</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg"></td>
					<td class="td_bg">
						<input type="submit" value="提交">
						<input type="reset" value="重置">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<br>
	</body>
</html>

