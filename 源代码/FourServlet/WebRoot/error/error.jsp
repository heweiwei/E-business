<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>出错啦</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div align="center">
    <img src="<%=path%>/Images/error/error.jpg" /><br>
    <p>呃呃呃,大概,也许,可能，maybe,possible,probable,likely 是出错了</p>
    所以....<a href="#" onclick="javascript:window.top.location.href='<%=path%>/index.jsp';return false;">还是回首页吧 </a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:history.back(-1);return false;">不然从哪里来，就回哪里去吧</a>
    </div>
  </body>
</html>
