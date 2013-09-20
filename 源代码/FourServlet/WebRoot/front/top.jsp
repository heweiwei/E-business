<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.softfz.dao.dto.User;"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

		<div id="main_container">
			<div id="header">
				<div class="top_right">
			<%!HttpSession session; %>
			<%
				session=request.getSession();
				User user=(User)session.getAttribute("loginUser");
				if(user==null){
			%>
					<div class="languages">
						<a href="<%=path%>/front/login.jsp" class="lang_text">�û���½</a>��
						<a href="<%=path%>/front/reg.jsp" class="lang_text">���ע��</a>
					</div>
			<%
				} 
				else {
			%>
				<div class="languages">
					<a href="<%=path%>/front/userInfo.jsp" class="lang_text">��ӭ�㣬<%=user.getUsername()%></a>��
					<a href="<%=path%>/servlet/UserServlet?method=logout" class="lang_text">��ȫ�˳�</a>
				</div>
			<% 
				}
			%>		
			</div>
				<div id="logo">
					<a href="#"><img
							src="<%=path%>/front/images/logo.png" alt="" title="" border="0"
							width="182" height="85" />
					</a>
				</div>
			</div>

			<div id="main_content">

				<div id="menu_tab">
					<ul class="menu">
						<li>
							<a href="index.jsp" class="nav"> ��Ʒ�б� </a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="<%=path%>/front/ShoppingCar.jsp" class="nav">���ﳵ </a>
						</li>
						<li class="divider"></li>
					<%
						if(user!=null){
					%>	
						<li>
							<a href="<%=path%>/front/userInfo.jsp" class="nav">��Ա����</a>
						</li>
						<li class="divider"></li>
					<% 
						}
					%>
						<li>
							<a href="<%=path%>/back/login.jsp" class="nav">��̨��½</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
