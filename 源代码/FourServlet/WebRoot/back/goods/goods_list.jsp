<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.Goods" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!HttpSession session; %>
<%	
	session=request.getSession();
 	String [][]type=(String[][])session.getAttribute("type");
 	int [][] typeid=(int[][])session.getAttribute("typeid");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
  </head>
  	<SCRIPT language=javascript>
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
		var displayBar=true;
		function switchBar(obj){
			if (displayBar)
			{
				parent.frame.cols="0,*";
				displayBar=false;
				obj.value="打开左边管理菜单";
			}
			else{
				parent.frame.cols="195,*";
				displayBar=true;
				obj.value="关闭左边管理菜单";
			}
		}
		
		function fullmenu(url){
			if (url==null) {url = "admin_left.asp";}
			parent.leftFrame.location = url;
		}
	</SCRIPT>
  <body onload="ChangMax()">
  <br><br><br>
  
	  <form action="<%=path%>/servlet/GoodsServlet?method=List" method="post" name="frm">
	  					<select NAME="max" SIZE="1" ONCHANGE=ChangeMin()>
							<option value="-1">大类</option>
						</select>
						<select NAME="min" SIZE="1">
							<option value="-1">小类</option>
						</select>
		  <input type="text" name="name" value="${requestScope.name }">
		  <input type="submit" value="查询">
	  </form>
  

  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="11" height="25">
						商品列表
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">商品编号</td>
					<td class="td_bg">商品名</td>
					<td class="td_bg">商品图片</td>
					<td class="td_bg">商品单价</td>
					<td class="td_bg">是否缺贷</td>
					<td class="td_bg">添加时间</td>
					<td class="td_bg">所属大类</td>
					<td class="td_bg">所属小类</td>
					<td class="td_bg" colspan="2">操作</td>
				</tr>
		    <%
	   		List<Goods> goodsList = (ArrayList)request.getAttribute("goodsList");
	   		%>
			<c:choose>
				<c:when test="${!empty goodsList}">
						<%
				   		for(Goods goods:goodsList){
				   		%>
				   		<tr>
				   			<td class="td_bg"><%=goods.getId() %></td>
				   			<td class="td_bg"><%=goods.getName() %></td>
				   			<td class="td_bg"><img src="<%=path%>/front/images/product/<%=goods.getPicture().equals("null")?"default.jpg":goods.getPicture()%>" alt="" title="" border="0" onload="AutoResizeImage(94,71,this)"/></td>
				   			<td class="td_bg"><%=goods.getPrice() %></td>
				   			<td class="td_bg"><%=goods.getSmcTag()%></td>
				   			<td class="td_bg"><%=goods.getAddTime()%></td>
	   				   		<td class="td_bg"><%=goods.getMax()%></td>
				   			<td class="td_bg"><%=goods.getMin()%></td>
				   			<%session.setAttribute(String.valueOf(goods.getId()),goods); %>
				      <td class="td_bg"><a href="<%=path%>/servlet/GoodsServlet?method=del&id=<%=goods.getId()%>" onClick="return confirm('确定删除?')?true:false;">删除</a></td>
   					  <td class="td_bg"><a href="<%=path%>/back/goods/goods_update.jsp?id=<%=goods.getId()%>">修改</a></td>
   					  </tr>
					  <%
						}
					  %>
				</c:when>
				<c:otherwise>
					<td class="td_bg" colspan="11">查无数据</td>
				</c:otherwise>
			</c:choose>
			<p>${requestScope.pagetool}</p>
			</tbody>
		</table>

  </body>
</html>