<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<TABLE>
	<TR>
		<TD>
<% request.setCharacterEncoding("euc-kr"); %>
<% 	
	String action = request.getParameter("action");
	String subMenu = request.getParameter("subMenu");
	String num = request.getParameter("num");
	if(subMenu.equals("free")) {
		if(action.equals("read")) {
			if(!num.equals("null")) {
%>
			<jsp:include page="free/free_read.jsp?num=<%=num %>" flush="false"></jsp:include>	
<%
			}
		} else if(action.equals("write")) {
%>
			<jsp:include page="free/free_write.jsp" flush="false"></jsp:include>
<%
		} else if(action.equals("reset")) {
%>
			<jsp:include page="free/free_reset.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else if(action.equals("delete")) {
%>
			<jsp:include page="free/free_delete.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else {
%>
			<jsp:include page="free/free.jsp" flush="false"></jsp:include>	
<%		}
	}
%>
</body>
</html>