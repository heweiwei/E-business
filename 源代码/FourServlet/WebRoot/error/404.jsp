<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>NO,NO,NO,MY GOD,��ô�ͳ�������</title>
    
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
    <img src="<%=path%>/Images/error/404.png" /><br>
    <a href="#" onclick="javascript:window.top.location.href='<%=path%>/index.jsp';return false;">�һ���ȥ����ҳ����....</a><br/><br/>
    <a href="#" onclick="javascript:history.back(-1);return false;">����ҳ���鷳���һ���ԭ·���ذ�</a>
    </div>
  </body>
</html>
