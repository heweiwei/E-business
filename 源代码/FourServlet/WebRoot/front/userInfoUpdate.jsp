<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户信息修改页</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/front/css/userUpdate.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/iecss.css" />
	<script type="text/javascript" src="<%=path%>/front/js/boxOver.js"></script>
	<script language=javascript src="<%=path %>/back/admin/js/calendar.js"></script>
	<script language=JavaScript src="<%=path %>/front/js/updateInfo.js"></script>  
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
 <c:import url="/front/top.jsp"></c:import>
    <div id="main_container">
   		<div id="main_content" >
    		<div class="crumb_navigation">
  	  		你在: <span class="current">用户信息修改页</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">用户信息修改</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">
<form action="<%=path%>/servlet/UserServlet?method=updateFront" method="post" name="form" onsubmit="return checkdata();">               
		<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	用户名：
		    </td>
		    <td align="left" valign="middle">
		     <input name="username" type="text" value="${loginUser.username }" readonly="readonly" class="TextBox" id="Text1" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	密码：
		    </td>
		    <td align="left" valign="middle">
		     <input name="password" type="password" class="TextBox"  />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	新密码：
		    </td>
		    <td align="left" valign="middle">
		     <input name="pwd1" type="password" class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	密码确认：
		    </td>
		    <td align="left" valign="middle">
		     <input name="pwd2" type="password" class="TextBox"/>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	真实姓名：
		    </td>
		    <td align="left" valign="middle">
		     <input name="realName" value="${loginUser.realName }" class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	性别：
		    </td>
		    <td align="left" valign="middle">
		     <input type=radio name="sex" value="m" ${loginUser.sex=="m"?"checked":""}><font size="2">男</font>
			 <input type=radio name="sex" value="f" ${loginUser.sex=="f"?"checked":""}><font size="2">女</font>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	出生日期：
		    </td>
		    <td align="left" valign="middle">
		     <input name="birthday" value="${loginUser.birthday }" readonly="readonly" class="TextBox" onfocus="calendar()"/>
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	电子邮箱：
		    </td>
		    <td align="left" valign="middle">
		     <input name="email" value="${loginUser.email }" class="TextBox"  />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	手机号码：
		    </td>
		    <td align="left" valign="middle">
		     <input name="phoneNumber" value="${loginUser.phoneNumber }" class="TextBox"  />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	地址：
		    </td>
		    <td align="left" valign="middle">
		     <input name="address" value="${loginUser.address }" class="TextBox"  />
		    </td>
		   </tr>
		   
		    <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	邮编：
		    </td>
		    <td align="left" valign="middle">
		     <input name="postCode" value="${loginUser.postCode }" class="TextBox" />
		    </td>
		   </tr>  
		   
		   <tr>
		    <td colspan="2" align="right" valign="middle">
		     <input name="Submit" id="Submit" type="submit" class="Button" value="提交" onMouseOver="this.className='Button_Select'"onMouseOut="this.className='Button'" />
		     <input name="Clear" type="reset" class="Button" id="Clear" value="重置" onMouseOver="this.className='Button_Select'" onMouseOut="this.className='Button'" />
		     <input name="Clear" type="reset" class="Button" id="Clear" value="返回" onMouseOver="this.className='Button_Select'" onMouseOut="this.className='Button'" onclick="javascript:history.back(-1);"/>
		    </td>
		   </tr>
		 </table>
</form> 
	             	</div> 
	           </div>
	       </div>
	   
   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>