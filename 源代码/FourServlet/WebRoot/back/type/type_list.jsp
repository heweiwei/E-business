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
    
    <title>商品种类列表</title>
    
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
		//AJAX更新种类名
		var req;  //AJAX请求
		var tmpid; //种类ID
		var tmp;  //新种类名
		function updateName(id) {
			tmpid=id;
			var name = window.prompt("请输入新的种类名","");
			tmp=name;
			if(name==null)return;
			if(name==""){
				alert("请输入正确的种类名称!");
				return;
			}
			//种类名两次编码
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
			if(msg=="success"){//修改成功后本地更新页面
				//window.location.href='<%=basePath%>servlet/TypeServlet?method=list';
				//mdiv = document.getElementById(tmpid);
				//names=document.getElementsByName(tmpid);
				//alert(names.length);
				//alert(names[0].innerHTML);
				//mdiv.innerHTML =tmp;
			}
			else if(msg=="fail"){
				alert('更新失败');
			}
		}
	</SCRIPT>
  <body>
  <table>
  	<tr>
  		<td>
	  		<form action="<%=path%>/servlet/TypeServlet?method=addMax" method="post">
			  新增大类：<input type="text" name="sname">
			  <input type="submit" value="增加">
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
						商品种类列表
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg">商品种类编号</td>
					<td class="td_bg">商品种类名称</td>
					<td class="td_bg">商品种类所属</td>
					<td class="td_bg" colspan="2">操作</td>
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
									<input type="submit" value="新增小类" style="BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #2C59AA 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C3DAF5); BORDER-LEFT: #2C59AA 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #2C59AA 1px solid
									
									"/>	
				   				</form>
				   			</td>     		
				   			<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=del&id=<%=tmpid%>" onClick="return confirm('确定删除?此为大类，从属小类将级联删除！')?true:false;">删除</a></td>
				      		<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=list" onclick="updateName(<%=tmpid%>)">修改</a></td>

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
				      		<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=del&id=<%=typeid[i][j]%>" onClick="return confirm('确定删除?')?true:false;">删除</a></td>
				      		<td class="td_bg"><a href="<%=path%>/servlet/TypeServlet?method=list" onclick="updateName(<%=typeid[i][j] %>)">修改</a></td>
   					  	</tr>
					  <%
							}
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