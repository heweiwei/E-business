<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������</title>
    
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
    <p>������,���,Ҳ��,���ܣ�maybe,possible,probable,likely �ǳ�����</p>
    ����....<a href="#" onclick="javascript:window.top.location.href='<%=path%>/index.jsp';return false;">���ǻ���ҳ�� </a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:history.back(-1);return false;">��Ȼ�����������ͻ�����ȥ��</a>
    </div>
  </body>
</html>
