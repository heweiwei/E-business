<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  		<div class="right_content">
			<div class="title_box">
				��Ʒ����
			</div>
			<div class="border_box">
				<form action="<%=path%>/servlet/GoodsServlet?method=divList" method="post" name="frm">
						<select NAME="max" SIZE="1" ONCHANGE=ChangeMin()>
							<option value="-1">����</option>
						</select>
						<select NAME="min" SIZE="1">
							<option value="-1">С��</option>
						</select>
					<input name="name" class="newsletter_input" value="${name}" />
					<input type="submit" class="join" value="����" />
				</form>
			</div>

			<div class="shopping_cart">
				<div class="title_box">
					���ﳵ
				</div>
				<div class="cart_details">
					${shoppingCar.totalCount!=null?shoppingCar.totalCount:0} ����Ʒ
					<br />
					<span class="border_cart"></span> �ܼ�:
					<span class="price">${shoppingCar.totalPrice!=null?shoppingCar.totalPrice:0}Ԫ</span>
				</div>

				<div class="cart_icon">
					<a href="<%=path%>/front/ShoppingCar.jsp" title="">
					<img src="<%=path%>/front/images/shoppingcart.png" alt="" title=""
							width="35" height="35" border="0" />
					</a>
				</div>
			</div>
		</div>

