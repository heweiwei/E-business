<%@ page language="java" import="java.util.*,com.softfz.dao.dto.Admin" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

session=request.getSession();
String username=request.getParameter("username");
Admin a= (Admin)session.getAttribute(username);
%>
<html>
  <head>
    <title>AdminUpdate</title>
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
		<script language=javascript src="<%=path %>/back/admin/js/calendar.js"></script>
  </head>
<SCRIPT language=javascript>
function checkdata(){
	//用户名验证
	var ssn=form.username.value.toLowerCase();
	if(ssn.length<3||ssn.length>15 ){
		alert("\请输入正确的用户名,用户名长度为3-15位！");
		form.username.focus();
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\请输入正确的用户名,用户名中不能包含空格！");
		form.username.focus();
		return false;
	}
	if (!isSsnString(ssn)){
		alert("\对不起，您选择的用户名不正确或已被占用！用户名\n由a～z的英文字母(不区分大小写)、0～9的数字、点、减\n号或下划线组成，长度为3～15个字符，只能以数字或字母\n开头和结尾,例如:kyzy_001。");
		form.username.focus();
		return false;
	}
	//密码验证
	if(strlen(form.pwd.value)<6||strlen(form.pwd.value)>15 ){
		alert("\正确地登录密码长度为6-15位，仅可用英文、数字、特殊字符！");
		form.pwd.focus();
		return false;
	}
	if(strlen2(form.pwd.value)){
		alert("\您的密码中包含了非法字符，仅可用英文、数字、特殊字符！");
		form.pwd.focus();
		return false;
	}
	if(form.pwd.value==form.username.value){
		alert("\用户名和密码不能相同！");
		form.pwd.focus();
		return false;
	}
	//真实姓名验证
	if(strlen(form.realName.value)==0){
		alert("真实姓名不能为空");
		return false;
	}
	if(strlen(form.realName.value)<2||strlen(form.realName.value)>10){
		alert("真实姓名2-10个字符！");
		return false;
	}
	//出生年月验证
	if(strlen(form.birthday.value)==0){
		alert("出生年月不能为空");
		return false;
	}
	//电子邮箱验证
	if(strlen(form.email.value)==0){
		alert("电子邮箱不能为空");
		return false;
	}
	if(!isEmail(form.email.value)){
		alert("请输入正确的邮箱地址！");
		return false;
	}
	//电话号码验证
	if(strlen(form.phoneNumber.value)==0){
		alert("电话号码不能为空");
		return false;
	}
	if(isDigit(form.phoneNumber.value)){
		alert("请输入正确的手机号码");
		return false;
	}
	if(strlen(form.phoneNumber.value)!=11){
		alert("请输入11位的手机号码");
		return false;
	}

	//地址验证
	if(strlen(form.address.value)==0){
		alert("地址不能为空");
		return false;
	}
	if(strlen(form.address.value)>100){
		alert("地址长度不能超过100");
		return false;
	}
	//邮编验证
	if(strlen(form.postCode.value)==0){
		alert("邮编不能为空");
		return false;
	}
	if(isDigit(form.postCode.value)){
		alert("请输入正确的邮编");
		return false;
	}
	if(strlen(form.postCode.value)!=6){
		alert("请输入6位的邮编");
		return false;
	}
	return true;
}
//字符串长度
function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}
//是否含有非法字符
function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}
function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}
function checkssn(gotoURL) {
   var ssn=form.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}
//验证邮箱的格式
function isEmail(str){ 
	  var reg = /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
	  return reg.test(str); 
} 
//验证是否是数字
function isDigit(str){ 
	  var reg = /[^\d]/g; 
	  return reg.test(str); 
}

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
	<form name="form" action="/FourServlet/servlet/AdminServlet?method=update" method="post" onSubmit="return checkdata();">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						修改用户信息
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						用户名：
					</td>
					<td class="td_bg">
						<input readOnly value="<%=request.getParameter("username")%>" name="username" />
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
						<input type=text value="<%=a.getPassword()%>" name="pwd" size="15" maxlength="16">
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
						<input type=text value="<%=a.getRealName()%>" name="realName" size="10" maxlength="10">
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
						<input type=radio name="sex" value="male" checked>男
						<input type=radio name="sex" value="female">女
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						出生日期：
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<INPUT value="<%=a.getBirthday()%>" name="birthday" onfocus=calendar() size="20" maxlength="20" />
						格式yyyy-mm-dd
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">电子邮箱：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getEmail()%>" name="email" size="20" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">手机号码：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getPhoneNumber()%>" name="phoneNumber" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">地址：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getAddress()%>" name="address" size="20" maxlength="100"/>
						长度不得大于100
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">邮编：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getPostCode()%>" name="postCode" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">用户级别：<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="role">
							<option value="1" <%=a.getRole().equals("1")?"selected":""%>>超级管理员</option>
							<option value="5" <%=a.getRole().equals("5")?"selected":""%> s>普通管理员</option>
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
