<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String num = request.getParameter("num");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

Statement stmt = conn.createStatement();

try {

String strSQL = "DELETE FROM noti_job6 WHERE NUM = '" + num + "'";
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();
%>
<center><font size='3'><b> 게시글 삭제 완료 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>게시글이 성공적으로 삭제되었습니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="main.jsp?menu=noti&subMenu=job">[확 인]</a></font>
	</TD>
</TR>
</TABLE>
<%
}catch(Exception e) {
	
}

%>
</body>
</html>