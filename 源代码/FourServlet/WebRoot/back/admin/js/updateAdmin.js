function checkdata() {
	//用户名检查
	var ssn=form.username.value.toLowerCase();
	if (!checkUserName(ssn)) return false;  
	//密码检查
	if( strlen(form.pwd.value)<6 || strlen(form.pwd.value)>15 ) {
		alert("\正确地登录密码长度为6-15位，仅可用英文、数字、特殊字符！");
		form.pwd.focus();
		return false;
	}
	if( strlen2(form.pwd.value) ) {
		alert("\您的密码中包含了非法字符，仅可用英文、数字、特殊字符！");
		form.pwd.focus();
		return false;
	}
	if( form.pwd.value == form.username.value ) {
		alert("\用户名和密码不能相同！");
		form.pwd.focus();
		return false;
	}
	//真实姓名验证
	if(strlen(form.realName.value)==0){
		alert("真实姓名不能为空");
		return false;
	}
	if(strlen(form.realName.value)<2||strlen(form.realName.value)>10){
		alert("真实姓名2-10个字符！");
		return false;
	}
	//出生年月验证
	if(strlen(form.birthday.value)==0){
		alert("出生年月不能为空");
		return false;
	}
	//电子邮箱验证
	if(strlen(form.email.value)==0){
		alert("电子邮箱不能为空");
		return false;
	}
	if(!isEmail(form.email.value)){
		alert("请输入正确的邮箱地址！");
		return false;
	}
	//电话号码验证
	if(strlen(form.phoneNumber.value)==0){
		alert("电话号码不能为空");
		return false;
	}
	if(isDigit(form.phoneNumber.value)){
		alert("请输入正确的手机号码");
		return false;
	}
	if(strlen(form.phoneNumber.value)!=11){
		alert("请输入11位的手机号码");
		return false;
	}

	//地址验证
	if(strlen(form.address.value)==0){
		alert("地址不能为空");
		return false;
	}
	if(strlen(form.address.value)>100){
		alert("地址长度不能超过100");
		return false;
	}
	//邮编验证
	if(strlen(form.postCode.value)==0){
		alert("邮编不能为空");
		return false;
	}
	if(isDigit(form.postCode.value)){
		alert("请输入正确的邮编");
		return false;
	}
	if(strlen(form.postCode.value)!=6){
		alert("请输入6位的邮编");
		return false;
	}
	return true;
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>15 ) {
		alert("\请输入正确的用户名,用户名长度为3-15位！")
		form.username.focus();
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\请输入正确的用户名,用户名中不能包含空格！")
		form.username.focus();
		return false;
	}
	if (!isSsnString(ssn)){
		alert("\    对不起，您选择的用户名不正确或已被占用！用户名\n由a～z的英文字母(不区分大小写)、0～9的数字、点、减\n号或下划线组成，长度为3～15个字符，只能以数字或字母\n开头和结尾,例如:kyzy_001。");
		form.username.focus();
		return false;
	}
	return true;
}
//字符串长度
function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}
//是否含有非法字符
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
//验证邮箱的格式
function isEmail(str){ 
	  var reg = /^([a-zA-Z0-9]|[._])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
	  return reg.test(str); 
} 
//验证是否是数字
function isDigit(str){ 
	  var reg = /[^\d]/g; 
	  return reg.test(str); 
} 
