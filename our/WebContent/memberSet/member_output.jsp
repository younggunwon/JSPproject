<%@page import="connectDB.ConnectDatabase"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import = "java.sql.*, connectDB.ConnectDatabase" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="member" class="model.Member" scope="page">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<% 
	ConnectDatabase cd = new ConnectDatabase();
	int result = cd.addMember(member);
	if(result == 1) {
%>

<BODY>

<center><font size='3'><b> ȸ�� ���� ���� </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>ȸ�� ������ �����մϴ�.<BR>�α��� �ϼ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href=javascript:close()>[Ȯ ��]</a></font>
	</TD>
</TR>
</TABLE>

<%
	} else if(result == 0) {
%>
<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>DB���� �����Դϴ�.<BR>�ٽ� �õ����ּ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="javascript:history.back()">[�ڷΰ���]</a></font>
	</TD>
</TR>
</TABLE>


<%	} %>

</BODY>
</HTML>