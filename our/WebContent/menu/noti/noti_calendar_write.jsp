<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="java.net.URLDecoder"%>
<% request.setCharacterEncoding("euc-kr"); %>


<HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>

<SCRIPT language="JavaScript">
function writeCheck()
{
if (Write.title.value.length < 1) {
	alert("�������� �Է��ϼ���.");
	Write.write_title.focus(); 
	return false;
}

if (Write.contents.value.length < 1) {
	alert("�۳����� �Է��ϼ���.");
	Write.content.focus(); 
	return false;
}

Write.submit();
}

function writeCancel()
{
	history.back();
}

</SCRIPT>
</HEAD>

<BODY>
<%
String name = "";
Cookie cookie[] = request.getCookies();
if(cookie != null) {
	for(int i = 0; i < cookie.length; i++) {
		if(cookie[i].getName().equals("name")) {
			name = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		}
	}
}

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE));
%>

<center><font size='3'><b> �Խ��� �۾��� </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='Write' Action='menu/noti/noti_calendar_write_input.jsp' Method='post' Enctype='multipart/form-data' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title'></font>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�ۼ���</b></center></font> 
		</TD>
		<TD>
			<%=name%>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�ۼ���</b></center></font>
		</TD>
		<TD>
			<%=indate %>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents' ></textarea>
         		</font>
      		</TD>
	</TR>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>����</b></center></font>
		</TD>
		<TD>
			<font size='2'>
                           <input type="file" name="userFile">
                           </font>
		</TD>
	</TR>
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>

					<input Type = 'Button' Value = '��  ��' Name='Page' onClick='writeCheck();'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Button' Value = '��  ��'' onClick='writeCancel();'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>

</BODY>
</HTML>