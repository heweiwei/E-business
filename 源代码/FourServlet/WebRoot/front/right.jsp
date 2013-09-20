<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  		<div class="right_content">
			<div class="title_box">
				商品搜索
			</div>
			<div class="border_box">
				<form action="<%=path%>/servlet/GoodsServlet?method=divList" method="post" name="frm">
						<select NAME="max" SIZE="1" ONCHANGE=ChangeMin()>
							<option value="-1">大类</option>
						</select>
						<select NAME="min" SIZE="1">
							<option value="-1">小类</option>
						</select>
					<input name="name" class="newsletter_input" value="${name}" />
					<input type="submit" class="join" value="搜索" />
				</form>
			</div>

			<div class="shopping_cart">
				<div class="title_box">
					购物车
				</div>
				<div class="cart_details">
					${shoppingCar.totalCount!=null?shoppingCar.totalCount:0} 件商品
					<br />
					<span class="border_cart"></span> 总计:
					<span class="price">${shoppingCar.totalPrice!=null?shoppingCar.totalPrice:0}元</span>
				</div>

				<div class="cart_icon">
					<a href="<%=path%>/front/ShoppingCar.jsp" title="">
					<img src="<%=path%>/front/images/shoppingcart.png" alt="" title=""
							width="35" height="35" border="0" />
					</a>
				</div>
			</div>
		</div>

