<%@page import="java.net.URLEncoder"%>
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

String strSQL = "UPDATE test6 set zip = '" + zip + "', address1 = '" + address1 + "', address2 = '" + address2 + "',";
strSQL = strSQL + "phone = '" + phone + "', email = '" + email + "', major = '" + major + "', subject = '" + subject + "',";
strSQL = strSQL + "pass = '" + pass + "' where id = '" + id + "'";
stmt.executeUpdate(strSQL);

String strSQL2 = "SELECT * FROM test6 where id='" + id + "'";
ResultSet rs = stmt.executeQuery(strSQL2);
rs.next();

String logId = rs.getString("id");
String logName = rs.getString("name");
String logMajor = rs.getString("major");
String logSubject = rs.getString("subject");
String logEmail = rs.getString("email");
String logZip = rs.getString("zip");
String logAddress1 = rs.getString("address1");
String logAddress2 = rs.getString("address2");
String logPhone = rs.getString("phone");

Cookie cookie[] = new Cookie[9];
cookie[0] = new Cookie("id", URLEncoder.encode(logId, "utf-8"));
cookie[1] = new Cookie("name", URLEncoder.encode(logName, "utf-8"));
cookie[2] = new Cookie("major", URLEncoder.encode(logMajor, "utf-8"));
cookie[3] = new Cookie("subject", URLEncoder.encode(logSubject, "utf-8"));
cookie[4] = new Cookie("email", URLEncoder.encode(logEmail, "utf-8"));
cookie[5] = new Cookie("zip", URLEncoder.encode(logZip, "utf-8"));
cookie[6] = new Cookie("address1", URLEncoder.encode(logAddress1, "utf-8"));
cookie[7] = new Cookie("address2", URLEncoder.encode(logAddress2, "utf-8"));
cookie[8] = new Cookie("phone", URLEncoder.encode(logPhone, "utf-8"));

for (int i = 0; i < 9; i++) {
	cookie[i].setMaxAge(60 * 60 * 24);
	cookie[i].setPath("/");
	response.addCookie(cookie[i]);
}

stmt.close();
conn.close();
%>
<center><font size='3'><b> 회원 정보 수정 완료 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원 정보가 성공적으로 수정되었습니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href=javascript:close()>[확 인]</a></font>
	</TD>
</TR>
</TABLE>

</body>
</html>