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
    <title>���ﳵ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/ShoppingCar.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<script type="text/javascript" src="<%=path %>/front/boxOver.js"></script>
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
<script type="text/javascript">
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
</script>
  </head>
  <body onload="ChangMax()">
 <!-- ͷ�� -->
<c:import url="/front/top.jsp"></c:import>

	<div id="main_container">
	   <div id="main_content">        
	    <div class="crumb_navigation">
	    	����: <span class="current">���ﳵ</span>
	    </div>    
<!-- �� -->
<c:import url="/front/left.jsp"></c:import>  
  
	   <div class="center_content">
	  	<div class="center_title_bar">���ﳵ</div>
	       <table align="center">
			<tr>
	   			<th>��Ʒ����</th>
	   			<th>��ƷͼƬ</th>
	   			<th>��Ʒ����</th>
	   			<th>����</th>
	   			<th>С��</th>
	   			<th colspan=2>����</th>
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
			   					<input type="submit" value="�޸�����">
			   				</form>
			   			</td>
			   			<td>${goods.totalCount}</td>
			   			<td><a href="<%=path%>/servlet/ShoppingCarServlet?method=del&id=${goods.id}" 
			   			onClick="return confirm('ȷ��ɾ��?')?true:false;">ɾ��</a></td>
		   			</tr>
				</c:forEach>
    		</c:when>
    		<c:otherwise></c:otherwise>
    	</c:choose>
  		<tr>
  			<td colspan="4" align="right">��������${shoppingCar.totalCount}</td>
			<td>�ܼۣ�${shoppingCar.totalPrice}</td>
		</tr>
    	<tr><td colspan="4" align="right"><a href="<%=path%>/servlet/checkoutServlet?method=default">����</a></td>
    	<td  align="right"><a href="<%=path%>/servlet/GoodsServlet?method=divList">��������</a></td></tr>
		<tr><td colspan="5" align="right"><a href="<%=path%>/servlet/ShoppingCarServlet?method=clear"onClick="return confirm('ȷ�����?')?true:false;">��չ��ﳵ</a></td></tr>	    		
    </table>
   </div> 
</div>
  <!-- �Ҳ� -->
<c:import url="/front/right.jsp"></c:import>
  <!-- �ײ� -->
<c:import url="/front/footer.jsp"></c:import>
	</div>
  </body>
</html>
