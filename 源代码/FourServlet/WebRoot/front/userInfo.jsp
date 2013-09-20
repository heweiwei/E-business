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
    
    <title>�û���Ϣҳ</title>
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
  	  		����: <span class="current">�û���Ϣҳ</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">�û���Ϣ</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">            
	
	
			<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�û�����
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.username }
		    </td>
		   </tr>
		      
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��ʵ������
		    </td>
		    <td align="left" valign="middle">
		    ${loginUser.realName }
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�Ա�
		    </td>
		    <td align="left" valign="middle">
		    ${loginUser.sex=="m"?"��":"Ů"}
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�������ڣ�
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.birthday }
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�������䣺
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.email }
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ֻ����룺
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.phoneNumber }
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��ַ��
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.address }
		    </td>
		   </tr>
		   
		    <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ʱࣺ
		    </td>
		    <td align="left" valign="middle">
		    ${loginUser.postCode }
		    </td>
		   </tr>  
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�û�����
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.role=="1"?"��������Ա":loginUser.role=="5"?"��ͨ����Ա":"ע���û�" }
		    </td>
		   </tr>  
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ϴε�½ʱ�䣺
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.lastLoginTime}
		    </td>
		   </tr>  
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��½������
		    </td>
		    <td align="left" valign="middle">
		     ${loginUser.loginNum}
		    </td>
		   </tr>  
	</table>

    <a href="<%=path%>/front/userInfoUpdate.jsp">�޸��û���Ϣ</a>&nbsp;&nbsp;
    <a href="<%=path%>/servlet/OrderServlet?method=myorderlist&username=${loginUser.username}">�ҵĶ���</a>
            </div> 
          </div>
      </div>
	   
   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
