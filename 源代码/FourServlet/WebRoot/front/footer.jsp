<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

   <div class="footer">
        <div class="left_footer">
        <img src="<%=path %>/front/images/footer_logo.png" alt="" title="" width="89" height="42"/>
        </div>
        
        <div class="center_footer">
        OnlineShopping. All Rights Reserved by wizard<br />
        <br />
        <img src="<%=path %>/front/images/payment.gif" alt="" title="" />
        </div>
        
        <div class="right_footer">
        <a href="index.html">home</a>
        <a href="details.html">about</a>
        <a href="details.html">sitemap</a>
        <a href="details.html">rss</a>
        <a href="contact.html">contact us</a>
        </div>   
   </div>    
