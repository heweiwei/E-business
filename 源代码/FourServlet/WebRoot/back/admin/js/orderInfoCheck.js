function checkdata(){
   if(frm.spaytype.value=="-1"){
   	   	alert("请选择支付方式!");
	    frm.spaytype.focus();
	    return false;  
   }
   if(frm.ssendtype.value=="-1"){
   	   	alert("请选择货运方式!");
	    frm.ssendtype.focus();
	    return false;  
   }
	//收货人
	if (frm.ssname.value == "")
 	{
	    alert("请填写收货人!");
	    frm.ssname.focus();
	    return false;
  	}
  	//收货人地址
	if (frm.ssaddress.value == "" )
 	{
	    alert("请填写收货人地址!" );
	    frm.ssaddress.focus();
	    return false;
  	}
	//收货人邮编
	//邮编验证
	if(strlen(frm.sscode.value)==0){
		alert("邮编不能为空");
		return false;
	}
	if(isDigit(frm.sscode.value)){
		alert("请输入正确的邮编");
		return false;
	}
	if(strlen(frm.sscode.value)!=6){
		alert("请输入6位的邮编");
		return false;
	}
	//电话号码验证
	if(strlen(frm.ssphone.value)==0){
		alert("电话号码不能为空");
		return false;
	}
	if(isDigit(frm.ssphone.value)){
		alert("请输入正确的手机号码");
		return false;
	}
	if(strlen(frm.ssphone.value)!=11){
		alert("请输入11位的手机号码");
		return false;
	}
	//电子邮箱验证
	if(strlen(frm.ssemail.value)==0){
		alert("电子邮箱不能为空");
		return false;
	}
	if(!isEmail(frm.ssemail.value)){
		alert("请输入正确的邮箱地址！");
		return false;
	}
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
//验证是否是数字
function isDigit(str){ 
	  var reg = /[^\d]/g; 
	  return reg.test(str); 
} 