<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>������Ϣ��д</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/front/css/userUpdate.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/iecss.css" />
	<script type="text/javascript" src="<%=path%>/front/js/boxOver.js"></script>
	<script type="text/javascript" src="<%=path%>/back/admin/js/orderInfoCheck.js"></script>
	<script type="text/javascript">
	function checkdata(){
		   if(frm.spaytype.value=="-1"){
		   	   	alert("��ѡ��֧����ʽ!");
			    frm.spaytype.focus();
			    return false;  
		   }
		   if(frm.ssendtype.value=="-1"){
		   	   	alert("��ѡ����˷�ʽ!");
			    frm.ssendtype.focus();
			    return false;  
		   }
			//�ջ���
			if (frm.ssname.value == "")
		 	{
			    alert("����д�ջ���!");
			    frm.ssname.focus();
			    return false;
		  	}
		  	//�ջ��˵�ַ
			if (frm.ssaddress.value == "" )
		 	{
			    alert("����д�ջ��˵�ַ!" );
			    frm.ssaddress.focus();
			    return false;
		  	}
			//�ջ����ʱ�
			//�ʱ���֤
			if(strlen(frm.sscode.value)==0){
				alert("�ʱ಻��Ϊ��");
				return false;
			}
			if(isDigit(frm.sscode.value)){
				alert("��������ȷ���ʱ�");
				return false;
			}
			if(strlen(frm.sscode.value)!=6){
				alert("������6λ���ʱ�");
				return false;
			}
			//�绰������֤
			if(strlen(frm.ssphone.value)==0){
				alert("�绰���벻��Ϊ��");
				return false;
			}
			if(isDigit(frm.ssphone.value)){
				alert("��������ȷ���ֻ�����");
				return false;
			}
			if(strlen(frm.ssphone.value)!=11){
				alert("������11λ���ֻ�����");
				return false;
			}
			//����������֤
			if(strlen(frm.ssemail.value)==0){
				alert("�������䲻��Ϊ��");
				return false;
			}
			if(!isEmail(frm.ssemail.value)){
				alert("��������ȷ�������ַ��");
				return false;
			}
		}
		//�ַ�������
		function strlen(str){
			var len;
			var i;
			len = 0;
			for (i=0;i<str.length;i++){
				if (str.charCodeAt(i)>255) len+=2; else len++;
			}
			return len;
		}
		//��֤�Ƿ�������
		function isDigit(str){ 
			  var reg = /[^\d]/g; 
			  return reg.test(str); 
		} 
	
	</script>
 </head>
 
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
 <c:import url="/front/top.jsp"></c:import>
    <div id="main_container">
   		<div id="main_content" >
    		<div class="crumb_navigation">
  	  		����: <span class="current">������Ϣ��д</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">���������Ϣ</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">
		<form action="<%=path%>/servlet/checkoutServlet?method=checkout" method="post" name="frm" onSubmit="return checkdata();">               
		<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	���ʽ��
		    </td>
		    <td align="left" valign="middle">
		    	<select name="spaytype">
		    		<option value="-1">--��ѡ��--</option>
		    		<option value="����">����</option>
		    		<option value="��������">��������</option>
		    		<option value="���ÿ�">���ÿ�</option>
		    	</select>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	������ʽ��
		    </td>
		    <td align="left" valign="middle">
		     	<select name="ssendtype">
		     		<option value="-1">--��ѡ��--</option>
		    		<option value="ƽ��">ƽ��</option>
		    		<option value="���">���</option>
		    		<option value="EMS">EMS</option>
		    	</select>
		    </td>
		   </tr>
	   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ��ˣ�
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssname" type="text" class="TextBox"/>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ��˵�ַ��
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssaddress"  class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ����ʱࣺ
		    </td>
		    <td align="left" valign="middle">
		   	 	<input name="sscode"  class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ�����ϵ�绰��
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssphone" class="TextBox" />
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	�ջ��˵������䣺
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssemail"  class="TextBox"/>
		    </td>
		   </tr>

		   
		   <tr>
		    <td colspan="2" align="right" valign="middle">
		     <input name="Submit" id="Submit" type="submit" class="Button" value="�ύ" onMouseOver="this.className='Button_Select'"onMouseOut="this.className='Button'" />
		     <input name="Clear" type="reset" class="Button" id="Clear" value="����" onMouseOver="this.className='Button_Select'" onMouseOut="this.className='Button'" />
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