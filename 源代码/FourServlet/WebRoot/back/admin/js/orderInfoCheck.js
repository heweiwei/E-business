function checkdata(){
   if(frm.spaytype.value=="-1"){
   	   	alert("��ѡ��֧����ʽ!");
	    frm.spaytype.focus();
	    return false;  
   }
   if(frm.ssendtype.value=="-1"){
   	   	alert("��ѡ����˷�ʽ!");
	    frm.ssendtype.focus();
	    return false;  
   }
	//�ջ���
	if (frm.ssname.value == "")
 	{
	    alert("����д�ջ���!");
	    frm.ssname.focus();
	    return false;
  	}
  	//�ջ��˵�ַ
	if (frm.ssaddress.value == "" )
 	{
	    alert("����д�ջ��˵�ַ!" );
	    frm.ssaddress.focus();
	    return false;
  	}
	//�ջ����ʱ�
	//�ʱ���֤
	if(strlen(frm.sscode.value)==0){
		alert("�ʱ಻��Ϊ��");
		return false;
	}
	if(isDigit(frm.sscode.value)){
		alert("��������ȷ���ʱ�");
		return false;
	}
	if(strlen(frm.sscode.value)!=6){
		alert("������6λ���ʱ�");
		return false;
	}
	//�绰������֤
	if(strlen(frm.ssphone.value)==0){
		alert("�绰���벻��Ϊ��");
		return false;
	}
	if(isDigit(frm.ssphone.value)){
		alert("��������ȷ���ֻ�����");
		return false;
	}
	if(strlen(frm.ssphone.value)!=11){
		alert("������11λ���ֻ�����");
		return false;
	}
	//����������֤
	if(strlen(frm.ssemail.value)==0){
		alert("�������䲻��Ϊ��");
		return false;
	}
	if(!isEmail(frm.ssemail.value)){
		alert("��������ȷ�������ַ��");
		return false;
	}
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
//��֤�Ƿ�������
function isDigit(str){ 
	  var reg = /[^\d]/g; 
	  return reg.test(str); 
} 