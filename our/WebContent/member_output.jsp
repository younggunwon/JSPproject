<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass"); 
String name = request.getParameter("name");
String juminnum1 = request.getParameter("juminnum1");
String juminnum2 = request.getParameter("juminnum2");
String zip = request.getParameter("zip");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String major = request.getParameter("major");
String subject = request.getParameter("subject");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

Statement stmt = conn.createStatement();

String strSQL = "SELECT id FROM test6 where id='" + id + "'";
ResultSet rs = stmt.executeQuery(strSQL);

strSQL = "INSERT INTO test6(id,pass,name,juminnum1, juminnum2,zip,address1,address2,phone,email,major,subject)";
strSQL = strSQL +  "VALUES('" + id + "', '" + pass + "', '" + name + "', '" + juminnum1 + "',";
strSQL = strSQL +  "'" + juminnum2 + "', '" + zip + "', '" + address1 + "',"; 
strSQL = strSQL +  "'" + address2 + "', '" + phone + "', '" + email + "',";
strSQL = strSQL + "'" + major + "', '" + subject + "')";
stmt.executeUpdate(strSQL);
%>

<BODY>

<center><font size='3'><b> 회원 가입 성공 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원 가입을 축하합니다.<BR>로그인 하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href=javascript:close()>[확 인]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>

<%
stmt.close();
conn.close();
%>
