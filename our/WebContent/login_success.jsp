<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<skript>

</skript>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">
function reset() {
	browsing_window = window.open("reset.jsp", "_resetInfo","height=500,width=500, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
	browsing_window.focus();
}
function logout() {
	location.href="logout.jsp";
}
</SCRIPT>  
</head>
<body>
<%
	String name = "";
	String major = "";
	String subject = "";
	
	Cookie cookie[] = request.getCookies();
	if(cookie != null) {
		for(int i = 0; i < cookie.length; i++) {
			if(cookie[i].getName().equals("name")) {
				name = URLDecoder.decode(cookie[i].getValue(), "utf-8");
			} else if(cookie[i].getName().equals("major")) {
				major = URLDecoder.decode(cookie[i].getValue(), "utf-8");
			} else if(cookie[i].getName().equals("subject")) {
				subject = URLDecoder.decode(cookie[i].getValue(), "utf-8");
			}
		}
	}
	try {
	if (session.getAttribute("LOGIN").equals("YES")) {
%>

<TABLE align=center width='300' border='0' cellpadding='10' cellspacing='0'>
<TR>
	<TD bgcolor='cccccc' align='center' colspan="2">
		<font size='2'><%=name %> 님 환영합니다.</font>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center' colspan="2">
		<font size='2'><%=major %> / <%=subject %></font>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<input type='button' value='개인정보 수정' onclick="reset()">
	</TD>
	<TD bgcolor='cccccc' align='center'>
		<input type='button' value='로그아웃' onclick='logout()'>
	</TD>
</TR>

</TABLE>

<%
	} else {
		response.sendRedirect("login.jsp");
	}
	}catch(Exception e) {
		response.sendRedirect("login.jsp");
	}
	
%>
</body>
</html>