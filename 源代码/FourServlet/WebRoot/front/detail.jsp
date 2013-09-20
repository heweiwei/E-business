<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>商品详情</title> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/iecss.css" />
	<script type="text/javascript" src="<%=path%>/front/js/boxOver.js"></script>
	<script type="text/javascript" src="<%=path%>/front/js/showpic.js"></script>
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
    <c:import url="/front/top.jsp"></c:import>
    <div id="main_container">
   		<div id="main_content"> 

	    <div class="crumb_navigation">
	          你在: <span class="current">商品详情</span>
	    </div>        
<c:import url="/front/left.jsp"></c:import>
   <div class="center_content">
   	<div class="center_title_bar">${goods.name }</div>
    
    	<div class="prod_box_big">

            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
	                 <a href="javascript:popImage('<%=path%>/front/images/big_pic.jpg','Some Title')" title="header=[Zoom] body=[&nbsp;] fade=[on]">
	                 <img src="<%=path%>/front/images/product/${(empty goods.picture)?"default.jpg":goods.picture}" border="0" onload="AutoResizeImage(500,500,this)"/></a>
                 </div>
                     <div class="details_big_box">
                         <div class="product_title_big">${goods.name}</div>
                         <div class="specifications">
                   是否有货: <span class="blue">${goods.smcTag }</span><br />
                   	介绍 :<span class="blue"> ${goods.describ }</span><br />
                         </div>
                         <div class="prod_price_big"><span class="reduce">${goods.price }</span> <span class="price">${goods.price }</span></div>
                         <a href="<%=path%>/servlet/ShoppingCarServlet?method=add&id=${goods.id}" class="prod_buy">购买</a>
                         <a href="#" class="prod_compare">返回</a>
                     </div>                        
            </div>           
        </div>
   </div>
<c:import url="/front/right.jsp"></c:import>
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
