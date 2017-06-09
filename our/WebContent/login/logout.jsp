<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("LOGIN", "no");
	Cookie cookie[] = request.getCookies();
	for(Cookie c : cookie) {
		c.setMaxAge(0);
		c.setPath("/");
		response.addCookie(c);
	}
	response.sendRedirect("../main.jsp");
%>
</body>
</html>