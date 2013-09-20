<%@ page language="java" import="java.util.*,com.softfz.dao.dto.Admin" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="<%=path %>/back/admin/css/css.css" rel="stylesheet" type="text/css">
  </head>
  
<SCRIPT language=javascript>
<!--
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

  <body > 
  <%!HttpSession session; %>
  	<%
	session=request.getSession();
	Admin admin=(Admin)session.getAttribute("loginUserBack");
  %>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" 
border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="center"  height="25">欢迎登陆后台,<%=admin.getUsername() %>!
        
     </th>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">用户级别：<%=admin.getRole().equals("1")?"超级管理员":"普通管理员" %></td>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">使用的数据库：ORCALE 10g</td>
    </tr>
  </tbody>
</table>

<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" colspan="2" align="center"  height="25">用户权限
     </th>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">商品操作</td>
       <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>√</b>
	      </span>
	   </td >
    </tr>
	<tr>
      <td class="td_bg" width="50%" height="23">商品类别操作</td>
       <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>√</b>
	      </span>
	   </td >
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">前台用户操作</td>
      <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>√</b>
	      </span>
	   </td >
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">后台用户操作 </td>
      <td class="td_bg" width="50%" height="23">
	      <span class="TableRow2">
	      		<%=admin.getRole().equals("1")?"<b>√</b>":"<font color=\"#FF0066\"><b>×</b></font>" %>
		  </span>
     </td>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">订单操作</td>
            <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>√</b>
	      </span>
	   </td >
    </tr>
  </tbody>
</table>


<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="center" colspan="2" height="25">网站管理系统版本</th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">系统名称<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong>网上商城后台管理系统<span class="TableRow1"></span></strong></td>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">系统使用说明<span class="TableRow2"></span></td>
      <td class="td_bg" width="83%">1、前台用户的冻结和解冻在用户修改中; <br>        
        2、订单搜索中，未审核选项无需输入关键字即可; <br>      
	  </td>
    </tr>
  </tbody>
</table>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="center" colspan="2" height="25">网站管理系统开发 </th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">程序制作<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong>何伟伟</strong></td>
    </tr>
    <tr>
      <td class="td_bg" height="23">EMAIL<span class="TableRow2"></span></td>
      <td class="td_bg">wizardwsk@vip.qq.com</td>
    </tr>
    <tr>
      <td class="td_bg" height="23">QQ<span class="TableRow2"></span></td>
      <td class="td_bg">392696340 </td>
    </tr>
  </tbody>
</table>		
  </body>
</html>
