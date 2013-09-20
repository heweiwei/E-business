function checkdata(){
	//商品名验证
	if(frm.name.value ==""){
		alert("\商品名不能为空！");
		frm.name.focus();
		return false;
	}
	if( strlen(frm.name.value)<6 || strlen(frm.name.value)>20) {
		alert("\商品名的长度只能为3~10个字");
		frm.name.focus();
		return false;
	}
	//商品价格验证
	if (frm.price.value == "" )
 	{
	    alert("请填写价格!" );
	    frm.price.focus();
	    return false;
  	}
  	if (IsPriceNumeric(frm.price.value)==false)
   {
	   	alert("价格数据格式不符合要求!" );
	    frm.price.focus();
	    return false;  
   }
   //商品大小类验证
   if(frm.max.value=="-1"){
   	   	alert("请选择商品的大类!" );
	    frm.max.focus();
	    return false;  
   }
   if(frm.min.value=="-1"){
   	   	alert("请选择商品的小类!" );
	    frm.min.focus();
	    return false;  
   }
   //商品描述验证
   	if (frm.describ.value == "" )
 	{
	    alert("请填写商品描述!" );
	    frm.describ.focus();
	    return false;
  	}
	if( strlen(frm.describ.value)<1||strlen(frm.name.value)>100) {
		alert("\商品描述的长度为1~100个字");
		frm.describ.focus();
		return false;
	}
	//商品图片的验证
	if(!isPicture(frm.picture.value)&&frm.picture.value!=""){
		alert("请输入正确的图片文件！");
		return false;
	}
}
//返回字符串长度
function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}
//价格的验证
function IsPriceNumeric(oNum) 
{ 
  if(!oNum) return false; 
  //var strP=/^d+(.d+)? $/; 
  var strP=/^[0-9]+.[0-9]{0,2}$/;
  if(!strP.test(oNum)) return false;
  try{ 
  	if(parseFloat(oNum)!=oNum) return false; 
  }
  catch(ex){ 
   return false; 
  } 
  return true; 
} 
//图片格式验证 \.(jpg|gif|jpeg)+$ 
function isPicture(str){ 
	  var reg = /\.(jpg|gif|jpeg)+$/; 
	  return reg.test(str); 
} 
