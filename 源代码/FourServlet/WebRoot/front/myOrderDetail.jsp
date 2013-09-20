<%@ page language="java" import="java.util.*,com.softfz.dao.dto.Order" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%!HttpSession session; %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String nid=request.getParameter("nid");
session = request.getSession();
Order order=(Order)session.getAttribute(nid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ҵĶ���</title>
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
  	  		����: <span class="current">�û���Ϣҳ->�ҵĶ���->��������</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">�ҵĶ���</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">            
	
	
			<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	������ţ�
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getNid() %>
		    </td>
		   </tr>
		      
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�µ�ʱ�䣺
		    </td>
		    <td align="left" valign="middle">
		    	<%=order.getDgDate().substring(0,order.getDgDate().lastIndexOf(".")) %>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	֧����ʽ��
		    </td>
		    <td align="left" valign="middle">
		    <%=order.getSPayType()%>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	���˷�ʽ��
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSSendType()%>
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��Ʒ��������
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getNMcTypeSize()%>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��Ʒ������
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getNMcSize()%>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	��Ʒ�ܼ۸�
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getNTotalPrice() %>
		    </td>
		   </tr>
		   
		    <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	����״̬��
		    </td>
		    <td align="left" valign="middle">
		    <%=order.getSStatus().equals("1")?"δ���":order.getSStatus().equals("2")?"ͨ��":"δͨ��" %>
		    </td>
		   </tr>  
		   <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ��ˣ�
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSsName()%>
		    </td>
		   </tr> 
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ��˵�ַ��
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSsAddress()%>
		    </td>
		   </tr>  
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ����ʱࣺ
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSsCode()%>
		    </td>
		   </tr> 
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ����ֻ����룺
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSsPhone() %>
		    </td>
		   </tr> 
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ������䣺
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSsEmail()%>
		    </td>
		   </tr> 
		  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	����������
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSMsg().equals("null")?"":order.getSMsg()%>
		    </td>
		   </tr>  
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	����ˣ�
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getSaUser()==null?"":order.getSaUser()%>
		    </td>
		   </tr>  
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	���ʱ�䣺
		    </td>
		    <td align="left" valign="middle">
		     <%=order.getDaDate()==null?"":order.getDaDate().substring(0,order.getDaDate().lastIndexOf("."))%>
		    </td>
		   </tr> 
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		    <a href="#" onclick="javascript:history.back(-1);return false;">�����ҵĶ���</a>
		    </td>
		    <td>
		    	<a href="<%=path%>/servlet/OrderServlet?method=myorderitem&nid=<%=order.getNid()%>">�鿴������ϸ</a>
		    </td>
		   </tr> 
	</table>


            </div> 
          </div>
      </div>
	   
   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
