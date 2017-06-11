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
	if(subMenu.equals("calendar")) {
		if(action.equals("read")) {
			if(!num.equals("null")) {
%>
			<jsp:include page="noti/noti_calendar_read.jsp?num=<%=num %>" flush="false"></jsp:include>	
<%
			}
		} else if(action.equals("write")) {
%>
			<jsp:include page="noti/noti_calendar_write.jsp" flush="false"></jsp:include>
<%
		} else if(action.equals("reset")) {
%>
			<jsp:include page="noti/noti_calendar_reset.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else if(action.equals("delete")) {
%>
			<jsp:include page="noti/noti_calendar_delete.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else {
%>
			<jsp:include page="noti/noti_calendar.jsp" flush="false"></jsp:include>	
<%		}
	}else if(subMenu.equals("event")) {
		if(action.equals("read")) {
			if(!num.equals("null")) {
%>
			<jsp:include page="event/noti_event_read.jsp?num=<%=num %>" flush="false"></jsp:include>	
<%
			}
		} else if(action.equals("write")) {
%>
			<jsp:include page="event/noti_event_write.jsp" flush="false"></jsp:include>
<%
		} else if(action.equals("reset")) {
%>
			<jsp:include page="event/noti_event_reset.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else if(action.equals("delete")) {
%>
			<jsp:include page="event/noti_event_delete.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else {
%>
			<jsp:include page="event/noti_event.jsp" flush="false"></jsp:include>	
<%		}
	}else if(subMenu.equals("job")) {
		if(action.equals("read")) {
			if(!num.equals("null")) {
%>
			<jsp:include page="job/noti_job_read.jsp?num=<%=num %>" flush="false"></jsp:include>	
<%
			}
		} else if(action.equals("write")) {
%>
			<jsp:include page="job/noti_job_write.jsp" flush="false"></jsp:include>
<%
		} else if(action.equals("reset")) {
%>
			<jsp:include page="job/noti_job_reset.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else if(action.equals("delete")) {
%>
			<jsp:include page="job/noti_job_delete.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else {
%>
			<jsp:include page="job/noti_job.jsp" flush="false"></jsp:include>	
<%		}
	}else if(subMenu.equals("food")) {
		if(action.equals("read")) {
			if(!num.equals("null")) {
%>
			<jsp:include page="food/noti_food_read.jsp?num=<%=num %>" flush="false"></jsp:include>	
<%
			}
		} else if(action.equals("write")) {
%>
			<jsp:include page="food/noti_food_write.jsp" flush="false"></jsp:include>
<%
		} else if(action.equals("reset")) {
%>
			<jsp:include page="food/noti_food_reset.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else if(action.equals("delete")) {
%>
			<jsp:include page="food/noti_food_delete.jsp?num=<%=num %>" flush="false"></jsp:include>
<%
		} else {
%>
			<jsp:include page="food/noti_food.jsp" flush="false"></jsp:include>	
<%		}

	}
%>
		</TD>
	</TR>
</TABLE>
</body>
</html>