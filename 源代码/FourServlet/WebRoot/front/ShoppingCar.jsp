<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	
	session=request.getSession();
 	String [][]type=(String[][])session.getAttribute("type");
 	int [][] typeid=(int[][])session.getAttribute("typeid");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>购物车</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/ShoppingCar.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<script type="text/javascript" src="<%=path %>/front/boxOver.js"></script>
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
<script type="text/javascript">
  		　　//定义一个二维数组aArray,用于存放大小类。每个数组的第一个位置固定存放字符串 --请选择--
		//大类固定放在aArray[0]的数组中 如电器为aArray[0][1];
		//小类则放在相应的aArray[i][j]的位置中 如电脑为aArray[1][1];
		var aCity=new Array();
		var aCityid= new Array();
		aCity[0]=new Array(); //大类
		aCityid[0]= new Array();
		aCity[0][0]="大类";
		aCityid[0][0]="-1";
	<%
			int index=1; 
			for(int i=0;i<type.length;i++){
				if(type[i][0]==null)break;
	%>
				aCity[0][<%=index++%>]="<%=type[i][0]%>";
				aCityid[0][<%=index-1%>]="<%=typeid[i][0]%>";
				aCity[<%=index-1%>]=new Array(); 
				aCityid[<%=index-1%>]=new Array(); 
				aCity[<%=index-1%>][0]="小类"; 
				aCityid[<%=index-1%>][0]="-1"; 
	<%
				for(int j=1;j<type[i].length;j++){
					if(type[i][j]!=null){
	%>
						aCity[<%=index-1%>][<%=j%>]="<%=type[i][j]%>"; 
						aCityid[<%=index-1%>][<%=j%>]="<%=typeid[i][j]%>"; 
	<%
					}
				}
		}
	%>
		//页面加载时，修改大类
		function ChangMax(){
		   iCityCount=0; 
			while (aCity[0][iCityCount]!=null) 
			iCityCount++; 
			document.frm.max.length=iCityCount;//改变下拉菜单的选项数 
			for (var i=0;i<iCityCount;i++)//改变下拉菜单的内容 
			{
				document.frm.max[i]=new Option(aCity[0][i],aCityid[0][i]); 
			}
		}		
		//选中大类时，修改小类
	　　function ChangeMin() 
	　　{ 
		    var i,iProvinceIndex; 
		　　	iProvinceIndex=document.frm.max.selectedIndex; 
			if(iProvinceIndex==0){
				document.frm.min.length=1;//改变下拉菜单的选项数 
			　　	document.frm.min[i]=new Option("--请选择--",0); 
				return;
			}
		　　iCityCount=0; 
		　　while (aCity[iProvinceIndex][iCityCount]!=null) 
		　　iCityCount++; 
		　　//计算选定省份的城市个数 
		　　document.frm.min.length=iCityCount;//改变下拉菜单的选项数 
		　　for (i=0;i<=iCityCount-1;i++)//改变下拉菜单的内容 
		　　document.frm.min[i]=new Option(aCity[iProvinceIndex][i],aCityid[iProvinceIndex][i]); 
		　　document.frm.min.focus(); 
	　　} 
</script>
  </head>
  <body onload="ChangMax()">
 <!-- 头部 -->
<c:import url="/front/top.jsp"></c:import>

	<div id="main_container">
	   <div id="main_content">        
	    <div class="crumb_navigation">
	    	我在: <span class="current">购物车</span>
	    </div>    
<!-- 左部 -->
<c:import url="/front/left.jsp"></c:import>  
  
	   <div class="center_content">
	  	<div class="center_title_bar">购物车</div>
	       <table align="center">
			<tr>
	   			<th>商品名称</th>
	   			<th>商品图片</th>
	   			<th>商品单价</th>
	   			<th>数量</th>
	   			<th>小计</th>
	   			<th colspan=2>操作</th>
			</tr>
    	<c:choose>
    		<c:when test="${!empty sessionScope.shoppingCar.goodsList}">
				<c:forEach items="${sessionScope.shoppingCar.goodsList}" var="goods">
					<tr>
						
			   			<td>${goods.name}</td>
			   			<td><img src="<%=path%>/front/images/product/${(empty goods.picture)?"default.jpg":goods.picture}" alt="" title="" border="0" onload="AutoResizeImage(94,71,this)"/></td>
			   			<td>${goods.price}</td>
			   			<td>
			   				<form action="<%=path%>/servlet/ShoppingCarServlet?id=${goods.id}&method=update" method="post" 
			   				onSubmit="return isDigit(this.count${goods.id}.value)">
			   					<input name=count${goods.id} value=${goods.count} size="4"/>
			   					<input type="submit" value="修改数量">
			   				</form>
			   			</td>
			   			<td>${goods.totalCount}</td>
			   			<td><a href="<%=path%>/servlet/ShoppingCarServlet?method=del&id=${goods.id}" 
			   			onClick="return confirm('确定删除?')?true:false;">删除</a></td>
		   			</tr>
				</c:forEach>
    		</c:when>
    		<c:otherwise></c:otherwise>
    	</c:choose>
  		<tr>
  			<td colspan="4" align="right">总数量：${shoppingCar.totalCount}</td>
			<td>总价：${shoppingCar.totalPrice}</td>
		</tr>
    	<tr><td colspan="4" align="right"><a href="<%=path%>/servlet/checkoutServlet?method=default">结账</a></td>
    	<td  align="right"><a href="<%=path%>/servlet/GoodsServlet?method=divList">继续购物</a></td></tr>
		<tr><td colspan="5" align="right"><a href="<%=path%>/servlet/ShoppingCarServlet?method=clear"onClick="return confirm('确定清空?')?true:false;">清空购物车</a></td></tr>	    		
    </table>
   </div> 
</div>
  <!-- 右部 -->
<c:import url="/front/right.jsp"></c:import>
  <!-- 底部 -->
<c:import url="/front/footer.jsp"></c:import>
	</div>
  </body>
</html>
