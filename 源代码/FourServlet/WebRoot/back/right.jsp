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
		obj.value="����߹���˵�";
	}
	else{
		parent.frame.cols="195,*";
		displayBar=true;
		obj.value="�ر���߹���˵�";
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
      <th class="bg_tr" align="center"  height="25">��ӭ��½��̨,<%=admin.getUsername() %>!
        
     </th>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">�û�����<%=admin.getRole().equals("1")?"��������Ա":"��ͨ����Ա" %></td>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">ʹ�õ����ݿ⣺ORCALE 10g</td>
    </tr>
  </tbody>
</table>

<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" colspan="2" align="center"  height="25">�û�Ȩ��
     </th>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">��Ʒ����</td>
       <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>��</b>
	      </span>
	   </td >
    </tr>
	<tr>
      <td class="td_bg" width="50%" height="23">��Ʒ������</td>
       <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>��</b>
	      </span>
	   </td >
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">ǰ̨�û�����</td>
      <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>��</b>
	      </span>
	   </td >
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">��̨�û����� </td>
      <td class="td_bg" width="50%" height="23">
	      <span class="TableRow2">
	      		<%=admin.getRole().equals("1")?"<b>��</b>":"<font color=\"#FF0066\"><b>��</b></font>" %>
		  </span>
     </td>
    </tr>
    <tr>
      <td class="td_bg" width="50%" height="23">��������</td>
            <td class="td_bg" width="50%" height="23">
      	  <span class="TableRow2">
	      	<b>��</b>
	      </span>
	   </td >
    </tr>
  </tbody>
</table>


<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="center" colspan="2" height="25">��վ����ϵͳ�汾</th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">ϵͳ����<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong>�����̳Ǻ�̨����ϵͳ<span class="TableRow1"></span></strong></td>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">ϵͳʹ��˵��<span class="TableRow2"></span></td>
      <td class="td_bg" width="83%">1��ǰ̨�û��Ķ���ͽⶳ���û��޸���; <br>        
        2�����������У�δ���ѡ����������ؼ��ּ���; <br>      
	  </td>
    </tr>
  </tbody>
</table>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="center" colspan="2" height="25">��վ����ϵͳ���� </th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">��������<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong>��ΰΰ</strong></td>
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
