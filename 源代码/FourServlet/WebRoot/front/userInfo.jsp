<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息页</title>
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
  	  		你在: <span class="current">用户信息页</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">用户信息</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">            
	
	
			<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	用户名：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.username }
		    </td>
		   </tr>
		      
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	真实姓名：
		    </td>
		    <td align="left" valign="middle">
		    ${loginUser.realName }
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	性别：
		    </td>
		    <td align="left" valign="middle">
		    ${loginUser.sex=="m"?"男":"女"}
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	出生日期：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.birthday }
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	电子邮箱：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.email }
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	手机号码：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.phoneNumber }
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	地址：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.address }
		    </td>
		   </tr>
		   
		    <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	邮编：
		    </td>
		    <td align="left" valign="middle">
		    ${loginUser.postCode }
		    </td>
		   </tr>  
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	用户级别：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.role=="1"?"超级管理员":loginUser.role=="5"?"普通管理员":"注册用户" }
		    </td>
		   </tr>  
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	上次登陆时间：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.lastLoginTime}
		    </td>
		   </tr>  
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	登陆次数：
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.loginNum}
		    </td>
		   </tr>  
	</table>

    <a href="<%=path%>/front/userInfoUpdate.jsp">修改用户信息</a>&nbsp;&nbsp;
    <a href="<%=path%>/servlet/OrderServlet?method=myorderlist&username=${loginUser.username}">我的订单</a>
            </div> 
          </div>
      </div>
	   
   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
