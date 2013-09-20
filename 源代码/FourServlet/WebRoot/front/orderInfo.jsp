<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>订单信息填写</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/front/css/userUpdate.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/iecss.css" />
	<script type="text/javascript" src="<%=path%>/front/js/boxOver.js"></script>
	<script type="text/javascript" src="<%=path%>/back/admin/js/orderInfoCheck.js"></script>
	<script type="text/javascript">
	function checkdata(){
		   if(frm.spaytype.value=="-1"){
		   	   	alert("请选择支付方式!");
			    frm.spaytype.focus();
			    return false;  
		   }
		   if(frm.ssendtype.value=="-1"){
		   	   	alert("请选择货运方式!");
			    frm.ssendtype.focus();
			    return false;  
		   }
			//收货人
			if (frm.ssname.value == "")
		 	{
			    alert("请填写收货人!");
			    frm.ssname.focus();
			    return false;
		  	}
		  	//收货人地址
			if (frm.ssaddress.value == "" )
		 	{
			    alert("请填写收货人地址!" );
			    frm.ssaddress.focus();
			    return false;
		  	}
			//收货人邮编
			//邮编验证
			if(strlen(frm.sscode.value)==0){
				alert("邮编不能为空");
				return false;
			}
			if(isDigit(frm.sscode.value)){
				alert("请输入正确的邮编");
				return false;
			}
			if(strlen(frm.sscode.value)!=6){
				alert("请输入6位的邮编");
				return false;
			}
			//电话号码验证
			if(strlen(frm.ssphone.value)==0){
				alert("电话号码不能为空");
				return false;
			}
			if(isDigit(frm.ssphone.value)){
				alert("请输入正确的手机号码");
				return false;
			}
			if(strlen(frm.ssphone.value)!=11){
				alert("请输入11位的手机号码");
				return false;
			}
			//电子邮箱验证
			if(strlen(frm.ssemail.value)==0){
				alert("电子邮箱不能为空");
				return false;
			}
			if(!isEmail(frm.ssemail.value)){
				alert("请输入正确的邮箱地址！");
				return false;
			}
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
		//验证是否是数字
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
  	  		你在: <span class="current">订单信息填写</span>
   			 </div>        
	   <div class="center_content" >
	  		<div class="center_title_bar">订单相关信息</div>
	   		<div class="prod_box_big">
	           <div class="center_prod_box_big">
		<form action="<%=path%>/servlet/checkoutServlet?method=checkout" method="post" name="frm" onSubmit="return checkdata();">               
		<table border="0" cellspacing="3" cellpadding="3">
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	付款方式：
		    </td>
		    <td align="left" valign="middle">
		    	<select name="spaytype">
		    		<option value="-1">--请选择--</option>
		    		<option value="网银">网银</option>
		    		<option value="货到付款">货到付款</option>
		    		<option value="信用卡">信用卡</option>
		    	</select>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	发货方式：
		    </td>
		    <td align="left" valign="middle">
		     	<select name="ssendtype">
		     		<option value="-1">--请选择--</option>
		    		<option value="平邮">平邮</option>
		    		<option value="快递">快递</option>
		    		<option value="EMS">EMS</option>
		    	</select>
		    </td>
		   </tr>
	   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	收货人：
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssname" type="text" class="TextBox"/>
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	收货人地址：
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssaddress"  class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	收货人邮编：
		    </td>
		    <td align="left" valign="middle">
		   	 	<input name="sscode"  class="TextBox" />
		    </td>
		   </tr>
		   
		   <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	收货人联系电话：
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssphone" class="TextBox" />
		    </td>
		   </tr>
		   
		  <tr>
		    <td width="100" align="right" valign="middle" class="Text01">
		     	收货人电子邮箱：
		    </td>
		    <td align="left" valign="middle">
		     <input name="ssemail"  class="TextBox"/>
		    </td>
		   </tr>

		   
		   <tr>
		    <td colspan="2" align="right" valign="middle">
		     <input name="Submit" id="Submit" type="submit" class="Button" value="提交" onMouseOver="this.className='Button_Select'"onMouseOut="this.className='Button'" />
		     <input name="Clear" type="reset" class="Button" id="Clear" value="重置" onMouseOver="this.className='Button_Select'" onMouseOut="this.className='Button'" />
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