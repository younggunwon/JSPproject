<%@page import="connectDB.ConnectDatabase"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">
function checkId(){
	opener.document.Member_Input.overlap.value = "��� ����";
	window.close();
}

function cancel(){
	opener.document.Member_Input.overlap.value = "ID �ߺ��˻�";
	window.close();
}
</SCRIPT>
</head>
<body>

<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<TABLE border='1' width=250>
	
<%
String id = request.getParameter("id");

if (id == ""){
%>

<TR>
	<TD align='center' bgcolor='cccccc'>
	<font size='2'>id�� �Է��ϼ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[�� ��]</a>
	</TD>
</TR>

<%
} else {
	ConnectDatabase cd = new ConnectDatabase();
	int result = cd.checkId(id);

	if (result == 2) {
%>
<TR>
	<TD align='center' bgcolor='cccccc' colspan="2">
	<fint size='2'>ID : <%=id%> <BR> ����� �� �ִ� ���̵��Դϴ�.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<input type="button" value="���" onClick="checkId()">
	</TD>
	<TD align='center'>
	<input type="button" value="���" onClick="cancel()">
	</TD>
</TR>
<%
	} else if(result == 1) {
%>
<TR>
	<TD align='center' bgcolor='cccccc'>
	<font size='2'>ID : <%=id%> <BR> ����� �� ���� ���̵��Դϴ�.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<input type="button" value="�ݱ�" onClick="cancel()">
	</TD>
</TR>
<%
	} else if(result == 0){
%>
	DB���� �����Դϴ�.
<%	
	}
}
%>



</body>
</html>