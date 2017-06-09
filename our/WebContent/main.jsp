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
	String menu = request.getParameter("menu");
	String subMenu = request.getParameter("subMenu");
	String alert = request.getParameter("alert");
	try{
		if(menu.equals("") || menu.equals("null")) {
			menu = "info";
		}
	}catch(Exception e) {
		menu = "info";
	}
	try{
		if(subMenu.equals("") || subMenu.equals("null")) {
			if(menu.equals("info")) {
				subMenu = "intro";
			} else if(menu.equals("major")) {
				subMenu = "machine";	
			} else if(menu.equals("noti")) {
				subMenu = "calendar";
			} else if(menu.equals("free")) {
				subMenu = "free";
			}
		}
	}catch(Exception e) {
		if(menu.equals("info")) {
			subMenu = "intro";
		} else if(menu.equals("major")) {
			subMenu = "machine";
		} else if(menu.equals("noti")) {
			subMenu = "calendar";
		} else if(menu.equals("free")) {
			subMenu = "free";
		}
	}
	if(alert != null) {
		if(alert.equals("cantId")) {
%>			<script>alert("ID를 다시 확인해주세요.");</script>
<%
		} else if(alert.equals("cantPass")) {
%>			<script>alert("비밀번호를 다시 확인해주세요.");</script>
<%  	}
	}%>
<TABLE width="100%" height="100%" align="center">
<TR>
	<TD width="100%" height="100%" align="center">
<Table border = '0'>
	<TR>
		<TD bgcolor="#00FFFF" width="300" height="200">
			<%try{
				if(session.getAttribute("LOGIN").equals("YES")) { %>
			<jsp:include page="login_success.jsp" flush="false"></jsp:include>
			<%
				} else { %>
				<jsp:include page="login.jsp" flush="false"></jsp:include>
				<% 
				}
			}catch(Exception e) { %>
				<jsp:include page="login.jsp" flush="false"></jsp:include>
				<%
			}	%>
			
		</TD>
		<TD bgcolor="#FFFFFF" width="700" height="200">
			<jsp:include page="menu.jsp" flush="false"></jsp:include>
		</TD>
	</TR>
	<TR>
		<TD bgcolor="#00FF00" width="300" height="600">
			<jsp:include page="subMenu.jsp" flush="false">
				<jsp:param name="menu" value="<%=menu%>" />
			</jsp:include>
		</TD>
		<TD bgcolor="#0000FF" width="600" height="600">
			<%
			if(menu.equals("info")) {
			%>
				<jsp:include page="info.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
				</jsp:include>
			<%
			} else if(menu.equals("major")) {
			%>
				<jsp:include page="major.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
				</jsp:include>
			<%
			} else if(menu.equals("noti")) {
			%>
				<jsp:include page="noti.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
				</jsp:include>
			<%
			} else if(menu.equals("free")) {
			%>
				<jsp:include page="free.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
				</jsp:include>
			<%
			}
			%>
			
		</TD>
	</TR>
</Table>
	</TD>
</TR>
</table>
</body>
</html>