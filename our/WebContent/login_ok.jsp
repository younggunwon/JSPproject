<%@page import="java.net.URLEncoder"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<center><font size='3'><b> 회원 인증 </b></font>   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='30' align='center' border='0' >
<%@ page import = "java.sql.*, java.util.*" %>	
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String login = "YES";

if (id == "" || pass == "") {
%>
<TR>
	<TD align='center'>
	<font size=2>ID와 비밀번호를 입력하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href="login.jsp">[로그인]</a>
	</TD>
</TR>
<%
} else {

	String driverName = "org.gjt.mm.mysql.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/test1";

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM test97 where id='" + id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	rs.next();
	
	String logId = rs.getString("id");
	String logPass = rs.getString("pass");
	String logName = rs.getString("name");
	String logMajor = rs.getString("major");
	String logSubject = rs.getString("subject");
	String logEmail = rs.getString("email");

	if (!id.equals(logId)){
%>
<TR>
	<TD align="center">
	<font size='2'>회원 ID가 아닙니다. <%=id %>, <%=logId %></font>
	</TD>
</TR>
<TR>
	<TD align="center">
	<a href="login.jsp">[로그인]</a>
	</TD>
</TR>
<%
	} else { 
		if (!pass.equals(logPass)){
%>

<TR>
	<TD align='center'>
	<font size=2>비밀번호가 일치하지 않습니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href="login.jsp">[로그인]</a>
	</TD>
</TR>

<%
		} else { //아이디 이름 부 과 이메일
			session.setAttribute("LOGIN",login);
			Cookie cookie[] = new Cookie[5];
			cookie[0] = new Cookie("id", URLEncoder.encode(logId, "utf-8"));
			cookie[1] = new Cookie("name", URLEncoder.encode(logName, "utf-8"));
			cookie[2] = new Cookie("major", URLEncoder.encode(logMajor, "utf-8"));
			cookie[3] = new Cookie("subject", URLEncoder.encode(logSubject, "utf-8"));
			cookie[4] = new Cookie("email", URLEncoder.encode(logEmail, "utf-8"));
			
			for(int i = 0; i < 5; i++) {
				cookie[i].setMaxAge(30 * 60);
				cookie[i].setPath("/");
				response.addCookie(cookie[i]);
			}
			response.sendRedirect("login_success.jsp"); 
		}
	}	
}

%>
</TABLE>
</body>
</html>