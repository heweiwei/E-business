<%@ page language="java" import="java.util.*,com.softfz.dao.impl.AdminDao,com.softfz.dao.dto.Goods" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ʒ�����б�</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=path %>/front/js/showpic.js"></script>
  </head>
  	<SCRIPT language=javascript>
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
		//AJAX����������
		var req;  //AJAX����
		var tmpid; //����ID
		var tmp;  //��������
		function updateName(id) {
			tmpid=id;
			var name = window.prompt("�������µ�������","");
			tmp=name;
			if(name==null)return;
			if(name==""){
				alert("��������ȷ����������!");
				return;
			}
			//���������α���
			name=encodeURI(name);
			name=encodeURI(name);
			
			var url = "<%=path%>/servlet/TypeServlet?method=update&name="+name+"&id="+id;
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.open("GET", url, true);
			req.onreadystatechange = callback;
			req.send(null);
		}
		
		function callback() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var msg = req.responseXML.getElementsByTagName("msg")[0];
			        setMsg(msg.childNodes[0].nodeValue);
				}
			}
		}
		
		function setMsg(msg) {
			if(msg=="success"){//�޸ĳɹ��󱾵ظ���ҳ��
				//window.location.href='<%=basePath%>servlet/TypeServlet?method=list';
				//mdiv = document.getElementById(tmpid);
				//names=document.getElementsByName(tmpid);
				//alert(names.length);
				//alert(names[0].innerHTML);
				//mdiv.innerHTML =tmp;
			}
			else if(msg=="fail"){
				alert('����ʧ��');
			}
		}
	</SCRIPT>
  <body>
  <table>
  	<tr>
  		<td>
	  		<form action="<%=path%>/servlet/TypeServlet?method=addMax" method="post">
			  �������ࣺ<input type="text" name="sname">
			  <input type="submit" value="����">
		  	</form>
  		</td>
  	</tr>
  </table>


	    <%!HttpSession session; %>
	    <%	
		session=request.getSession();
	 	String [][]type=(String[][])session.getAttribute("type");
	 	int [][] typeid=(int[][])session.getAttribute("typeid");
	 	%>
  		<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="11" height="25">
						��Ʒ�����б�
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">��Ʒ������</td>
					<td class="td_bg">��Ʒ��������</td>
					<td class="td_bg">��Ʒ��������</td>
					<td class="td_bg" colspan="2">����</td>
				</tr>
			<c:choose>
				<c:when test="${!empty type}">
						<%
						String tmp="";
						int tmpid=0;
						for(int i=0;i<type.length;i++){
							if(type[i][0]==null)break;
							else {
								tmp=type[i][0];
								tmpid=typeid[i][0];
						%>
						<tr>
				   			<td class="td_bg" width="100"><%=tmpid%></td>
				   			<td class="td_bg" width="100" id="<%=tmpid%>" name="<%=tmpid%>"><%=tmp%></td>
				   			<td class="td_bg" >
				   				<form action="<%=path%>/servlet/TypeServlet?method=addMin&pid=<%=tmpid%>" method="post" name="form">
									<input type=text name="sname" size="8"/>
									<input type="submit" value="����С��" style="BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C3DAF5); BORDER-LEFT: #2C59AA 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #2C59AA 1px solid
									
									"/>	
				   				</form>
				   			</td>     		
				   			<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=del&id=<%=tmpid%>" onClick="return confirm('ȷ��ɾ��?��Ϊ���࣬����С�ཫ����ɾ����')?true:false;">ɾ��</a></td>
				      		<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=list" onclick="updateName(<%=tmpid%>)">�޸�</a></td>

   					  	</tr>
						<%
							}
							for(int j=1;j<type[i].length;j++){
								if(type[i][j]==null)break;
				   		%>
				   		<tr>
				   			<td class="td_bg"><%=typeid[i][j] %></td>
				   			<td class="td_bg" id="<%=typeid[i][j]%>" name="<%=typeid[i][j]%>"><%=type[i][j] %></td>
				   			<td class="td_bg" name="<%=tmpid%>"><%=tmp%></td>
				      		<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=del&id=<%=typeid[i][j]%>" onClick="return confirm('ȷ��ɾ��?')?true:false;">ɾ��</a></td>
				      		<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=list" onclick="updateName(<%=typeid[i][j] %>)">�޸�</a></td>
   					  	</tr>
					  <%
							}
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