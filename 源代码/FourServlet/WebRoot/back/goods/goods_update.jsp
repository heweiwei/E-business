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
	����//����һ����ά����aArray,���ڴ�Ŵ�С�ࡣÿ������ĵ�һ��λ�ù̶�����ַ��� --��ѡ��--
		//����̶�����aArray[0]�������� �����ΪaArray[0][1];
		//С���������Ӧ��aArray[i][j]��λ���� �����ΪaArray[1][1];
		var aCity=new Array();
		var aCityid= new Array();
		aCity[0]=new Array(); //����
		aCityid[0]= new Array();
		aCity[0][0]="--��ѡ��--";
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
				aCity[<%=index-1%>][0]="--��ѡ��--"; 
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
	//�շŲ˵���
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
	//Ԥ��ͼƬ
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
						������Ʒ
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						��Ʒ����
					</td>
					<td class="td_bg">
						<input name="name" value="<%=goods.getName()%>"/>
						<br>
						<span class="TableRow1"></span>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						��Ʒ�۸�
						<br>
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						<input name="price" value="<%=goods.getPrice()%>"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						�����ࣺ
					</td>
					<td class="td_bg">
						<select NAME="max" SIZE="1" ONCHANGE=ChangeMin()>
							<option>--��ѡ��--</option>

						</select>
						<select NAME="min" SIZE="1">
							<option>--��ѡ��--</option>
						</select>
					</td>
				</tr>

				<tr>
					<td class="td_bg" height="23">
						�Ƿ��л���
					</td>
					<td class="td_bg">
						<select NAME="smctag" SIZE="1">
							<option value="n" <%=goods.getSmcTag().equals("�л�")?"selected":"n" %>>��</option>
							<option value="y" <%=goods.getSmcTag().equals("ȱ��")?"selected":"y" %>>��</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="td_bg" height="23">
						��Ʒ������
						<br>
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						<textarea rows="5" cols="40" name="describ" ><%=goods.getDescrib()%></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						��ƷͼƬ��
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type="file" name="picture" onchange="preview(this.value)"/>
						<input type="hidden" name="oldpicture" value="<%=goods.getPicture()%>"/>
						�����ϴ�ͼƬ���ɲ����ٴ��ϴ����ٴ��ϴ��������ϴε�ͼƬ
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						��ƷͼƬԤ����
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<img id="pre" src="<%=path%>/Images/default.jpg" onload="AutoResizeImage(250,250,this)" >
					</td>
				</tr>
				<tr>
					<td class="td_bg"></td>
					<td class="td_bg">
						<input type="submit" value="�ύ">
						<input type="reset" value="����">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<br>
	</body>
</html>
