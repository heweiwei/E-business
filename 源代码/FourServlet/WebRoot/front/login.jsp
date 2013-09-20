<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
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
  
   <div id="main_content"> 
     
    <div class="crumb_navigation">
  	  你在: <span class="current">用户登陆</span>
    </div>        
   <div class="center_content" >
   	<div class="center_title_bar">用户登陆</div>
    
    	<div class="prod_box_big">
      
            <div class="center_prod_box_big">            
                 
              	<div class="contact_form">
               <form name="form" action="<%=path%>/servlet/LoginServlet?method=front" method="post" onSubmit="return checkdata()">      
                    <div class="form_row">
                    <label class="contact"><strong>用户名:</strong></label>
                    <input name="username" value="${inputNameFront }" class="contact_input" />
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>密码:</strong></label>
                    <input name="password" type="password" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>验证码:</strong></label>
                    <input name="rand" class="contact_input_test" />
                    <img src="<%=path%>/back/img.jsp" width="50" height="24" />
                    </div>
                    
					
                    <div class="form_row">
                    <input type="submit" value="登陆" class="prod_details"/>
                    <input type="reset" value="重置" class="prod_details"/>
                    </div>
        		</form>                  
                </div> 
            </div>
        </div>
   </div>

   </div>      
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
