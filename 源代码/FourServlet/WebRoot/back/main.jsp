<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<title>Ö÷Ò³Ãæ</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
	<frameset rows="59,*" frameborder="no" border="0" framespacing="0">
		<frame src="<%=path%>/back/top.jsp" noresize="noresize"
			frameborder="0" name="topFrame" marginwidth="0" marginheight="0"
			scrolling="no">
		<frameset cols="195,*" id="frame">
			<frame src="<%=path%>/back/menu.jsp" name="leftFrame"
				noresize="noresize" marginwidth="0" marginheight="0" frameborder="0"
				scrolling="auto">
			<frame src="<%=path%>/back/right.jsp" name="main" marginwidth="0"
				marginheight="0" frameborder="0" scrolling="yes">
		</frameset>
	</frameset>
</html>
