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
    <title>��Ʒ����</title> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/front/css/iecss.css" />
	<script type="text/javascript" src="<%=path%>/front/js/boxOver.js"></script>
	<script type="text/javascript" src="<%=path%>/front/js/showpic.js"></script>
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
    <c:import url="/front/top.jsp"></c:import>
    <div id="main_container">
   		<div id="main_content"> 

	    <div class="crumb_navigation">
	          ����: <span class="current">��Ʒ����</span>
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
                   �Ƿ��л�: <span class="blue">${goods.smcTag }</span><br />
                   	���� :<span class="blue"> ${goods.describ }</span><br />
                         </div>
                         <div class="prod_price_big"><span class="reduce">${goods.price }</span> <span class="price">${goods.price }</span></div>
                         <a href="<%=path%>/servlet/ShoppingCarServlet?method=add&id=${goods.id}" class="prod_buy">����</a>
                         <a href="#" class="prod_compare">����</a>
                     </div>                        
            </div>           
        </div>
   </div>
<c:import url="/front/right.jsp"></c:import>
<c:import url="/front/footer.jsp"></c:import>
</div>
  </body>
</html>
