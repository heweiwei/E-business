<%@ page language="java" import="java.util.*,com.softfz.dao.dto.Admin" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

session=request.getSession();
String username=request.getParameter("username");
Admin a= (Admin)session.getAttribute(username);
%>
<html>
  <head>
    <title>AdminUpdate</title>
	<link href="/FourServlet/back/admin/css/css.css" rel="stylesheet" type="text/css">
		<script language=javascript src="<%=path %>/back/admin/js/calendar.js"></script>
  </head>
<SCRIPT language=javascript>
function checkdata(){
	//�û�����֤
	var ssn=form.username.value.toLowerCase();
	if(ssn.length<3||ssn.length>15 ){
		alert("\��������ȷ���û���,�û�������Ϊ3-15λ��");
		form.username.focus();
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\��������ȷ���û���,�û����в��ܰ����ո�");
		form.username.focus();
		return false;
	}
	if (!isSsnString(ssn)){
		alert("\�Բ�����ѡ����û�������ȷ���ѱ�ռ�ã��û���\n��a��z��Ӣ����ĸ(�����ִ�Сд)��0��9�����֡��㡢��\n�Ż��»�����ɣ�����Ϊ3��15���ַ���ֻ�������ֻ���ĸ\n��ͷ�ͽ�β,����:kyzy_001��");
		form.username.focus();
		return false;
	}
	//������֤
	if(strlen(form.pwd.value)<6||strlen(form.pwd.value)>15 ){
		alert("\��ȷ�ص�¼���볤��Ϊ6-15λ��������Ӣ�ġ����֡������ַ���");
		form.pwd.focus();
		return false;
	}
	if(strlen2(form.pwd.value)){
		alert("\���������а����˷Ƿ��ַ���������Ӣ�ġ����֡������ַ���");
		form.pwd.focus();
		return false;
	}
	if(form.pwd.value==form.username.value){
		alert("\�û��������벻����ͬ��");
		form.pwd.focus();
		return false;
	}
	//��ʵ������֤
	if(strlen(form.realName.value)==0){
		alert("��ʵ��������Ϊ��");
		return false;
	}
	if(strlen(form.realName.value)<2||strlen(form.realName.value)>10){
		alert("��ʵ����2-10���ַ���");
		return false;
	}
	//����������֤
	if(strlen(form.birthday.value)==0){
		alert("�������²���Ϊ��");
		return false;
	}
	//����������֤
	if(strlen(form.email.value)==0){
		alert("�������䲻��Ϊ��");
		return false;
	}
	if(!isEmail(form.email.value)){
		alert("��������ȷ�������ַ��");
		return false;
	}
	//�绰������֤
	if(strlen(form.phoneNumber.value)==0){
		alert("�绰���벻��Ϊ��");
		return false;
	}
	if(isDigit(form.phoneNumber.value)){
		alert("��������ȷ���ֻ�����");
		return false;
	}
	if(strlen(form.phoneNumber.value)!=11){
		alert("������11λ���ֻ�����");
		return false;
	}

	//��ַ��֤
	if(strlen(form.address.value)==0){
		alert("��ַ����Ϊ��");
		return false;
	}
	if(strlen(form.address.value)>100){
		alert("��ַ���Ȳ��ܳ���100");
		return false;
	}
	//�ʱ���֤
	if(strlen(form.postCode.value)==0){
		alert("�ʱ಻��Ϊ��");
		return false;
	}
	if(isDigit(form.postCode.value)){
		alert("��������ȷ���ʱ�");
		return false;
	}
	if(strlen(form.postCode.value)!=6){
		alert("������6λ���ʱ�");
		return false;
	}
	return true;
}
//�ַ�������
function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}
//�Ƿ��зǷ��ַ�
function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}
function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}
function checkssn(gotoURL) {
   var ssn=form.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}
//��֤����ĸ�ʽ
function isEmail(str){ 
	  var reg = /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
	  return reg.test(str); 
} 
//��֤�Ƿ�������
function isDigit(str){ 
	  var reg = /[^\d]/g; 
	  return reg.test(str); 
}

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
	<form name="form" action="/FourServlet/servlet/AdminServlet?method=update" method="post" onSubmit="return checkdata();">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						�޸��û���Ϣ
						<input onClick="switchBar(this)" type="button" value="�ر���߹���˵�"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						�û�����
					</td>
					<td class="td_bg">
						<input readOnly value="<%=request.getParameter("username")%>" name="username" />
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
						<input type=text value="<%=a.getPassword()%>" name="pwd" size="15" maxlength="16">
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
						<input type=text value="<%=a.getRealName()%>" name="realName" size="10" maxlength="10">
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
						<input type=radio name="sex" value="male" checked>��
						<input type=radio name="sex" value="female">Ů
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">
						�������ڣ�
						<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<INPUT value="<%=a.getBirthday()%>" name="birthday" onfocus=calendar() size="20" maxlength="20" />
						��ʽyyyy-mm-dd
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�������䣺<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getEmail()%>" name="email" size="20" maxlength="20" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�ֻ����룺<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getPhoneNumber()%>" name="phoneNumber" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">��ַ��<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getAddress()%>" name="address" size="20" maxlength="100"/>
						���Ȳ��ô���100
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�ʱࣺ<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<input type=text value="<%=a.getPostCode()%>" name="postCode" size="20" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td class="td_bg" height="23">�û�����<br>
						<span class="TableRow2"> </span>
					</td>
					<td class="td_bg">
						<select name="role">
							<option value="1" <%=a.getRole().equals("1")?"selected":""%>>��������Ա</option>
							<option value="5" <%=a.getRole().equals("5")?"selected":""%> s>��ͨ����Ա</option>
						</select>
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
