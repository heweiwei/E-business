function checkdata(){
	//��Ʒ����֤
	if(frm.name.value ==""){
		alert("\��Ʒ������Ϊ�գ�");
		frm.name.focus();
		return false;
	}
	if( strlen(frm.name.value)<6 || strlen(frm.name.value)>20) {
		alert("\��Ʒ���ĳ���ֻ��Ϊ3~10����");
		frm.name.focus();
		return false;
	}
	//��Ʒ�۸���֤
	if (frm.price.value == "" )
 	{
	    alert("����д�۸�!" );
	    frm.price.focus();
	    return false;
  	}
  	if (IsPriceNumeric(frm.price.value)==false)
   {
	   	alert("�۸����ݸ�ʽ������Ҫ��!" );
	    frm.price.focus();
	    return false;  
   }
   //��Ʒ��С����֤
   if(frm.max.value=="-1"){
   	   	alert("��ѡ����Ʒ�Ĵ���!" );
	    frm.max.focus();
	    return false;  
   }
   if(frm.min.value=="-1"){
   	   	alert("��ѡ����Ʒ��С��!" );
	    frm.min.focus();
	    return false;  
   }
   //��Ʒ������֤
   	if (frm.describ.value == "" )
 	{
	    alert("����д��Ʒ����!" );
	    frm.describ.focus();
	    return false;
  	}
	if( strlen(frm.describ.value)<1||strlen(frm.name.value)>100) {
		alert("\��Ʒ�����ĳ���Ϊ1~100����");
		frm.describ.focus();
		return false;
	}
	//��ƷͼƬ����֤
	if(!isPicture(frm.picture.value)&&frm.picture.value!=""){
		alert("��������ȷ��ͼƬ�ļ���");
		return false;
	}
}
//�����ַ�������
function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}
//�۸����֤
function IsPriceNumeric(oNum) 
{ 
  if(!oNum) return false; 
  //var strP=/^d+(.d+)?�6�8$/; 
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
//ͼƬ��ʽ��֤ \.(jpg|gif|jpeg)+$ 
function isPicture(str){ 
	  var reg = /\.(jpg|gif|jpeg)+$/; 
	  return reg.test(str); 
} 
