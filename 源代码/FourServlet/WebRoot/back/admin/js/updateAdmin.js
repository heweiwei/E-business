function checkdata() {
	//�û������
	var ssn=form.username.value.toLowerCase();
	if (!checkUserName(ssn)) return false;  
	//������
	if( strlen(form.pwd.value)<6 || strlen(form.pwd.value)>15 ) {
		alert("\��ȷ�ص�¼���볤��Ϊ6-15λ��������Ӣ�ġ����֡������ַ���");
		form.pwd.focus();
		return false;
	}
	if( strlen2(form.pwd.value) ) {
		alert("\���������а����˷Ƿ��ַ���������Ӣ�ġ����֡������ַ���");
		form.pwd.focus();
		return false;
	}
	if( form.pwd.value == form.username.value ) {
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

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>15 ) {
		alert("\��������ȷ���û���,�û�������Ϊ3-15λ��")
		form.username.focus();
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\��������ȷ���û���,�û����в��ܰ����ո�")
		form.username.focus();
		return false;
	}
	if (!isSsnString(ssn)){
		alert("\    �Բ�����ѡ����û�������ȷ���ѱ�ռ�ã��û���\n��a��z��Ӣ����ĸ(�����ִ�Сд)��0��9�����֡��㡢��\n�Ż��»�����ɣ�����Ϊ3��15���ַ���ֻ�������ֻ���ĸ\n��ͷ�ͽ�β,����:kyzy_001��");
		form.username.focus();
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
