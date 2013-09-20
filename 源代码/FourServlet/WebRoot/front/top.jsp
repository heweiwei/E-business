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
						<a href="<%=path%>/front/login.jsp" class="lang_text">用户登陆</a>┆
						<a href="<%=path%>/front/reg.jsp" class="lang_text">免费注册</a>
					</div>
			<%
				} 
				else {
			%>
				<div class="languages">
					<a href="<%=path%>/front/userInfo.jsp" class="lang_text">欢迎你，<%=user.getUsername()%></a>┆
					<a href="<%=path%>/servlet/UserServlet?method=logout" class="lang_text">安全退出</a>
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
							<a href="index.jsp" class="nav"> 商品列表 </a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="<%=path%>/front/ShoppingCar.jsp" class="nav">购物车 </a>
						</li>
						<li class="divider"></li>
					<%
						if(user!=null){
					%>	
						<li>
							<a href="<%=path%>/front/userInfo.jsp" class="nav">会员中心</a>
						</li>
						<li class="divider"></li>
					<% 
						}
					%>
						<li>
							<a href="<%=path%>/back/login.jsp" class="nav">后台登陆</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
