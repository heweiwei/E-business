<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�û���Ϣ�޸�ҳ</title>
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
  	  		����: <span class="current">�û���Ϣ�޸�ҳ</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">�û���Ϣ�޸�</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">
<form action="<%=path%>/servlet/UserServlet?method=updateFront" method="post" name="form" onsubmit="return checkdata();">               
		<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�û�����
		    </td>
		    <td align="left" valign="middle">
		     <input name="username" type="text" value="${loginUser.username }" readonly="readonly" class="TextBox" id="Text1" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	���룺
		    </td>
		    <td align="left" valign="middle">
		     <input name="password" type="password" class="TextBox"  />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�����룺
		    </td>
		    <td align="left" valign="middle">
		     <input name="pwd1" type="password" class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	����ȷ�ϣ�
		    </td>
		    <td align="left" valign="middle">
		     <input name="pwd2" type="password" class="TextBox"/>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��ʵ������
		    </td>
		    <td align="left" valign="middle">
		     <input name="realName" value="${loginUser.realName }" class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�Ա�
		    </td>
		    <td align="left" valign="middle">
		     <input type=radio name="sex" value="m" ${loginUser.sex=="m"?"checked":""}><font size="2">��</font>
			 <input type=radio name="sex" value="f" ${loginUser.sex=="f"?"checked":""}><font size="2">Ů</font>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�������ڣ�
		    </td>
		    <td align="left" valign="middle">
		     <input name="birthday" value="${loginUser.birthday }" readonly="readonly" class="TextBox" onfocus="calendar()"/>
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�������䣺
		    </td>
		    <td align="left" valign="middle">
		     <input name="email" value="${loginUser.email }" class="TextBox"  />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ֻ����룺
		    </td>
		    <td align="left" valign="middle">
		     <input name="phoneNumber" value="${loginUser.phoneNumber }" class="TextBox"  />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��ַ��
		    </td>
		    <td align="left" valign="middle">
		     <input name="address" value="${loginUser.address }" class="TextBox"  />
		    </td>
		   </tr>
		   
		    <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ʱࣺ
		    </td>
		    <td align="left" valign="middle">
		     <input name="postCode" value="${loginUser.postCode }" class="TextBox" />
		    </td>
		   </tr>  
		   
		   <tr>
		    <td colspan="2" align="right" valign="middle">
		     <input name="Submit" id="Submit" type="submit" class="Button" value="�ύ" onMouseOver="this.className='Button_Select'"onMouseOut="this.className='Button'" />
		     <input name="Clear" type="reset" class="Button" id="Clear" value="����" onMouseOver="this.className='Button_Select'" onMouseOut="this.className='Button'" />
		     <input name="Clear" type="reset" class="Button" id="Clear" value="����" onMouseOver="this.className='Button_Select'" onMouseOut="this.className='Button'" onclick="javascript:history.back(-1);"/>
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