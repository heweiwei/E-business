<%@ page language="java" import="java.util.*,com.softfz.dao.dto.Goods" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%! HttpSession session; %>
<%	
	session=request.getSession();
 	String [][]type=(String[][])session.getAttribute("type");
 	int [][] typeid=(int[][])session.getAttribute("typeid");
 	String id= request.getParameter("id");
 	Goods goods=(Goods)session.getAttribute(id);
 %>
<html>
  <head>
    <title>AdminUpdate</title>
	<link href="<%=path %>/back/admin/css/css.css" rel="stylesheet" type="text/css">
	<script language=JavaScript src="regcheckdata.js"></script> 
	<script language=javascript src="calendar.js"></script>
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
	<script type="text/javascript" src="<%=path %>/back/admin/js/goodsCheck.js"></script>
	
  </head>
<SCRIPT language=javascript>
	　　//定义一个二维数组aArray,用于存放大小类。每个数组的第一个位置固定存放字符串 --请选择--
		//大类固定放在aArray[0]的数组中 如电器为aArray[0][1];
		//小类则放在相应的aArray[i][j]的位置中 如电脑为aArray[1][1];
		var aCity=new Array();
		var aCityid= new Array();
		aCity[0]=new Array(); //大类
		aCityid[0]= new Array();
		aCity[0][0]="--请选择--";
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
				aCity[<%=index-1%>][0]="--请选择--"; 
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
	//收放菜单栏
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
	//预览图片
	function preview(filepath)
	{
		var pre = document.getElementById("pre");
		pre.src = filepath;
	}
</SCRIPT>

 	<body onload="ChangMax()">
	<form action="<%=path%>/servlet/GoodsServlet?method=update&id=<%=goods.getId()%>" method="post" enctype="multipart/form-data" name="frm" onsubmit="return checkdata();">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						增加商品
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						商品名：
					</td>
					<td class="td_bg">
						<input name="name" value="<%=goods.getName()%>"/>
						<br>
						<span class="TableRow1"></span>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						商品价格：
						<br>
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						<input name="price" value="<%=goods.getPrice()%>"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						所属类：
					</td>
					<td class="td_bg">
						<select NAME="max" SIZE="1" ONCHANGE=ChangeMin()>
							<option>--请选择--</option>

						</select>
						<select NAME="min" SIZE="1">
							<option>--请选择--</option>
						</select>
					</td>
				</tr>

				<tr>
					<td class="td_bg" height="23">
						是否有货：
					</td>
					<td class="td_bg">
						<select NAME="smctag" SIZE="1">
							<option value="n" <%=goods.getSmcTag().equals("有货")?"selected":"n" %>>有</option>
							<option value="y" <%=goods.getSmcTag().equals("缺货")?"selected":"y" %>>无</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="td_bg" height="23">
						商品描述：
						<br>
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						<textarea rows="5" cols="40" name="describ" ><%=goods.getDescrib()%></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						商品图片：
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type="file" name="picture" onchange="preview(this.value)"/>
						<input type="hidden" name="oldpicture" value="<%=goods.getPicture()%>"/>
						如已上传图片，可不用再次上传，再次上传将覆盖上次的图片
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						商品图片预览：
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<img id="pre" src="<%=path%>/Images/default.jpg" onload="AutoResizeImage(250,250,this)" >
					</td>
				</tr>
				<tr>
					<td class="td_bg"></td>
					<td class="td_bg">
						<input type="submit" value="提交">
						<input type="reset" value="重置">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<br>
	</body>
</html>
