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
<% 	
	String subMenu = request.getParameter("subMenu");
	String num = request.getParameter("num");
	if(subMenu.equals("calendar")) {
		if(num.equals("null")) {
%>
		<jsp:include page="noti/noti_calendar.jsp" flush="false"></jsp:include>
<%
		} else {
%>
		<jsp:include page="noti/noti_calendar_writing.jsp?<%=num %>" flush="false"></jsp:include>	
<%
		}
	}else if(subMenu.equals("event")) {
%>
		<jsp:include page="noti/noti_event.jsp" flush="false"></jsp:include>
<%
	}else if(subMenu.equals("job")) {
%>
		<jsp:include page="noti/noti_job.jsp" flush="false"></jsp:include>
<%
	}else if(subMenu.equals("food")) {
%>
		<jsp:include page="noti/noti_food.jsp" flush="false"></jsp:include>
<%
	}
%>
		</TD>
	</TR>
</TABLE>
</body>
</html>