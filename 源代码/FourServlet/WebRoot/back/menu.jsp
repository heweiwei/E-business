<%@ page language="java" import="java.util.*,com.softfz.dao.dto.Admin" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="Images/css1/left_css.css" rel="stylesheet" type="text/css">
  </head>
<SCRIPT language=JavaScript>
	function showsubmenu(sid)
	{
		whichEl = eval("submenu" + sid);
		if (whichEl.style.display == "none")
		{
			eval("submenu" + sid + ".style.display=\"\";");
		}
		else
		{
			eval("submenu" + sid + ".style.display=\"none\";");
		}
	}
</SCRIPT>

<body bgcolor="16ACFF">
<table width="98%" border="0" cellpadding="0" cellspacing="0" background="Images/tablemde.jpg">
<!-- ------------------------------- -->
<%
Admin admin=(Admin)session.getAttribute("loginUserBack");
if(admin.getRole().equals("1")){//���ǳ����û�
%>
  <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#16ACFF"></td>
  </tr>
  <tr>
    <td><TABLE width="97%" 
border=0 align=right cellPadding=0 cellSpacing=0 class=leftframetable>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(Images/left_tt.gif) no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <TD width="20"></TD>
          		<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(1); height=25>��̨����Ա����</TD>
          	  </tr>
            </table>
          </TD>
          </TR>
        <TR>
          <TD>
	          <TABLE id=submenu1 cellSpacing=0 cellPadding=0 width="100%" border=0>
	              <TBODY>
	                <TR>
	                  <TD width="2%"><IMG src="Images/closed.gif"></TD>
	                  <TD height=23><A href="<%=path%>/servlet/AdminServlet?method=list" 
	            target=main>����Ա�б�</A></TD>
	                </TR>
	
	                <TR>
	                  <TD><IMG src="Images/closed.gif"></TD>
	                  <TD height=23><A href="<%=path%>/back/admin/AdminReg.jsp" target=main>��������Ա</A></TD>
	                </TR>
	              </TBODY>
	          </TABLE>
          </TD>
        </TR>
      </TBODY>
    </TABLE>
    </td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
<%
	} 
%>
  <!-- ------------------------------- -->
  <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#9BC2ED"></td>
  </tr>
  
  <tr>
    <td><table class="leftframetable" cellspacing="0" cellpadding="0" width="97%" align="right" 
border="0">
      <tbody>
        <tr>
          <td height="25" style="background:url(Images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20"></td>
          <td height="25" class="titledaohang" style="CURSOR: hand" onClick="showsubmenu(2);"><span class="STYLE1">��Ʒ����</span></td>
              </tr>
            </table></td>
          </tr>
        <tr>
          <td><table id="submenu2" cellspacing="0" cellpadding="0" width="100%" border="0">
              <tbody>
	            <TR>
	                <TD><IMG src="Images/closed.gif"></TD>
	                <TD height=23><A href="<%=path%>/servlet/GoodsServlet?method=getType" target=main>������Ʒ</A></TD>
	             </TR>
				<tr>
                  <td><img src="Images/closed.gif" /></td>
                  <td height="23"><a href="<%=path%>/servlet/GoodsServlet?method=List" target="main">��Ʒ�б�</a></td>
                </tr>
              </tbody>
          </table></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
   <!-- ------------------------------- -->
  <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#9BC2ED"></td>
  </tr>
  <tr>
    <td><TABLE class=leftframetable cellSpacing=0 cellPadding=0 width="97%" align=right border=0>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(Images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <TD width="20"></TD>
          <TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(4); height=25>ǰ̨�û�����</TD>
            </tr>
          </table></TD>
          </TR>
        <TR>
          <TD><TABLE id=submenu4 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
				<TR>
                  <TD><IMG src="Images/closed.gif"></TD>
                  <TD height=23><A href="<%=path%>/servlet/UserServlet?method=list" target=main>�û��б�</A></TD>
                </TR>
                <TR>
                  <TD><IMG src="Images/closed.gif"></TD>
                  <TD height=23><A href="<%=path%>/back/user/user_add.jsp" target=main>�����û�</A></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
   <!-- ------------------------------- -->
  <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#9BC2ED"></td>
  </tr>
  <tr>
    <td><TABLE class=leftframetable cellSpacing=0 cellPadding=0 width="97%" align=right border=0>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(Images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <TD width="20"></TD>
          <TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(5); height=25>��Ʒ������</TD>
            </tr>
          </table></TD>
          </TR>
        <TR>
          <TD><TABLE id=submenu5 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD><IMG src="Images/closed.gif"></TD>
                  <TD height=23><A href="<%=path%>/servlet/TypeServlet?method=list" target=main>��Ʒ�����б�</A></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
   <!-- ------------------------------- -->
     <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#9BC2ED"></td>
  </tr>
  <tr>
    <td><TABLE class=leftframetable cellSpacing=0 cellPadding=0 width="97%" align=right border=0>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(Images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <TD width="20"></TD>
          <TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(6); height=25>��������</TD>
            </tr>
          </table></TD>
          </TR>
        <TR>
          <TD><TABLE id=submenu6 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
				<TR>
                  <TD><IMG src="Images/closed.gif"></TD>
                  <TD height=23><A href="<%=path%>/servlet/OrderServlet?method=list" target=main>�����б�</A></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
   <!-- ------------------------------- -->
  <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#9BC2ED"></td>
  </tr>
  <tr>
    <td><TABLE class=leftframetable cellSpacing=0 cellPadding=0 width="97%" align=right border=0>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(Images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <TD width="20"></TD>
          <TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(9); height=25>��������</TD>
            </tr>
          </table></TD>
          </TR>
        <TR>
          <TD><TABLE id=submenu9 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD width="2%"><IMG src="Images/closed.gif"></TD>
                  <TD height=23><A href="http://wizardwsk.rupai.net/" target="_blank">wizardͼƬ�ϴ�ϵͳ</A> </TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
   <!-- ------------------------------- -->
  <tr>
    <td height="5" background="Images/tableline_top.jpg" bgcolor="#9BC2ED"></td>
  </tr>
  <tr>
    <td height="8">
	
<TABLE class=leftframetable cellSpacing=1 cellPadding=1 width="97%" align=right 
border=0>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(Images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <TD width="20"></TD>
          <TD class=STYLE1 height=25>ϵͳ��Ϣ</TD>
            </tr>
          </table></TD>
          </TR>
        <TR>
          <TD 
      height=105><span class="STYLE2"><IMG src="Images/closed.gif">��Ȩ���У���ΰΰ<br>
              <IMG src="Images/closed.gif">�����������ΰΰ<br>
              <IMG src="Images/closed.gif">����֧�֣�<a href="http://wizardwsk.rupai.net/" target="_blank">��ΰΰ</a><br>
              <IMG src="Images/closed.gif">�������ģ�<a href="http://wizardwsk.rupai.net/" target="_blank">��ΰΰ</a><br>
            <IMG src="Images/closed.gif">ϵͳ�汾��1.0</span></TD>
        </TR>
      </TBODY>
    </TABLE>	</td>
  </tr>
  <tr>
    <td height="5" background="Images/tableline_bottom.jpg"></td>
  </tr>
</table>
</body>
</html>
