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
    
    <title>��Ʒ�б�</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
  </head>
  	<SCRIPT language=javascript>
  	  		����//����һ����ά����aArray,���ڴ�Ŵ�С�ࡣÿ������ĵ�һ��λ�ù̶�����ַ��� --��ѡ��--
		//����̶�����aArray[0]�������� �����ΪaArray[0][1];
		//С���������Ӧ��aArray[i][j]��λ���� �����ΪaArray[1][1];
		var aCity=new Array();
		var aCityid= new Array();
		aCity[0]=new Array(); //����
		aCityid[0]= new Array();
		aCity[0][0]="����";
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
				aCity[<%=index-1%>][0]="С��"; 
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
		//ҳ�����ʱ���޸Ĵ���
		function ChangMax(){
		   iCityCount=0; 
			while (aCity[0][iCityCount]!=null) 
			iCityCount++; 
			document.frm.max.length=iCityCount;//�ı������˵���ѡ���� 
			for (var i=0;i<iCityCount;i++)//�ı������˵������� 
			{
				document.frm.max[i]=new Option(aCity[0][i],aCityid[0][i]); 
			}
		}		
		//ѡ�д���ʱ���޸�С��
	����function ChangeMin() 
	����{ 
		    var i,iProvinceIndex; 
		����	iProvinceIndex=document.frm.max.selectedIndex; 
			if(iProvinceIndex==0){
				document.frm.min.length=1;//�ı������˵���ѡ���� 
			����	document.frm.min[i]=new Option("--��ѡ��--",0); 
				return;
			}
		����iCityCount=0; 
		����while (aCity[iProvinceIndex][iCityCount]!=null) 
		����iCityCount++; 
		����//����ѡ��ʡ�ݵĳ��и��� 
		����document.frm.min.length=iCityCount;//�ı������˵���ѡ���� 
		����for (i=0;i<=iCityCount-1;i++)//�ı������˵������� 
		����document.frm.min[i]=new Option(aCity[iProvinceIndex][i],aCityid[iProvinceIndex][i]); 
		����document.frm.min.focus(); 
	����} 
		var displayBar=true;
		function switchBar(obj){
			if (displayBar)
			{
				parent.frame.cols="0,*";
				displayBar=false;
				obj.value="����߹���˵�";
			}
			else{
				parent.frame.cols="195,*";
				displayBar=true;
				obj.value="�ر���߹���˵�";
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
							<option value="-1">����</option>
						</select>
						<select NAME="min" SIZE="1">
							<option value="-1">С��</option>
						</select>
		  <input type="text" name="name" value="${requestScope.name }">
		  <input type="submit" value="��ѯ">
	  </form>
  

  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="11" height="25">
						��Ʒ�б�
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">��Ʒ���</td>
					<td class="td_bg">��Ʒ��</td>
					<td class="td_bg">��ƷͼƬ</td>
					<td class="td_bg">��Ʒ����</td>
					<td class="td_bg">�Ƿ�ȱ��</td>
					<td class="td_bg">���ʱ��</td>
					<td class="td_bg">��������</td>
					<td class="td_bg">����С��</td>
					<td class="td_bg" colspan="2">����</td>
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
				      <td class="td_bg"><a href="<%=path%>/servlet/GoodsServlet?method=del&id=<%=goods.getId()%>" onClick="return confirm('ȷ��ɾ��?')?true:false;">ɾ��</a></td>
   					  <td class="td_bg"><a href="<%=path%>/back/goods/goods_update.jsp?id=<%=goods.getId()%>">�޸�</a></td>
   					  </tr>
					  <%
						}
					  %>
				</c:when>
				<c:otherwise>
					<td class="td_bg" colspan="11">��������</td>
				</c:otherwise>
			</c:choose>
			<p>${requestScope.pagetool}</p>
			</tbody>
		</table>

  </body>
</html>