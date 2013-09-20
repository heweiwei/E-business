<%@ page language="java" import="java.util.*,com.softfz.dao.dto.User" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!HttpSession session; %>
<%
	session=request.getSession();
	User user=(User)session.getAttribute(request.getParameter("username"));
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title>table</title>
		<link href="<%=path%>/back/admin/css/css.css" rel="stylesheet" type="text/css">
		<script language=JavaScript src="<%=path%>/back/user/js/updateUser.js"></script> 
		<script language=javascript src="<%=path%>/back/admin/js/calendar.js"></script>
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
	</SCRIPT>

	<body>
	<form name="form" action="<%=path%>/servlet/UserServlet?method=update" method="post" onSubmit="return checkdata()">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						�û���Ϣ
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						�û�����
					</td>
					<td class="td_bg">
						<input type=text name="username" readOnly value="<%=user.getUsername() %>" size="30" maxlength="18">
						�û���������Ϊ3-18λ
						<br>
						<span class="TableRow1"></span>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						���룺
						<br>
						<span class="TableRow2"></span>
					</td>
					<td class="td_bg">
						<input type=text name="pwd" value="<%=user.getPassword()%>" size="15" maxlength="16">
						���볤����Ϊ6-16λ��������Ӣ�ġ����֡������ַ�
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						��ʵ������
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="realName" value="<%=user.getRealName() %>" size="10" maxlength="10">
						���ģ�2-10���ַ�
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						�Ա�
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=radio name="sex" value="m" <%=user.getSex().equals("m")?"checked":""%>>��
						<input type=radio name="sex" value="f"<%=user.getSex().equals("m")?"":"checked"%>>Ů
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						�������ڣ�
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<INPUT name="birthday" value="<%=user.getBirthday() %>" onfocus=calendar() readOnly size="20" maxlength="20" />
						��ʽyyyy-mm-dd
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�������䣺<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="email" value="<%=user.getEmail() %>" size="20" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�ֻ����룺<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="phoneNumber" value="<%=user.getPhoneNumber() %>" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">��ַ��<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="address" value="<%=user.getAddress() %>" size="20" maxlength="100"/>
						���Ȳ��ô���100
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�ʱࣺ<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text name="postCode" value="<%=user.getPostCode() %>" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">Ȩ�޼���<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="role">
							<option value="9" <%=user.getRole().equals("9")?"selected":"" %>>ע���û�</option>
							<option value="5" <%=user.getRole().equals("5")?"selected":"" %>>��ͨ����Ա</option>
							<option value="1" <%=user.getRole().equals("1")?"selected":"" %>>��������Ա</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�Ƿ񶳽᣺<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="slock">
							<option value="1" <%=user.getSlock().equals("1")?"selected":"" %>>����</option>
							<option value="0" <%=user.getSlock().equals("0")?"selected":"" %>>�ⶳ</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg"></td>
					<td class="td_bg">
						<input type="submit" value="�޸�"  onClick="return confirm('ȷ���޸�?')?true:false;">
						<input type="reset" value="����">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<br>
	</body>
</html>

