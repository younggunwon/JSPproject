<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<%	
	if(session.getAttribute("LOGIN") == null) {
		session.setAttribute("LOGIN", "NO");
		session.setMaxInactiveInterval(60*60);
	}

	String key = request.getParameter("key");
	String keyword = request.getParameter("keyword");
	
	String action = request.getParameter("action");
	String subAction = request.getParameter("subAction");
	String commentNum = request.getParameter("commentNum");
	
	String num = request.getParameter("num");
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
<%  	} else if(alert.equals("alert")) { %>
			<script>alert("글이 삭제되었습니다.");</script>
<%		}
	}%>
<TABLE width="100%" height="100%" align="center">
<TR>
	<TD width="100%" height="100%" align="center">
<Table border = '0'>
	<TR>
		<TD  width="300" height="200" bgcolor="#AAAAAA">
			<%try{
				if(session.getAttribute("LOGIN").equals("YES")) { %>
			<jsp:include page="login/login_success.jsp" flush="false"></jsp:include>
			<%
				} else { %>
				<jsp:include page="login/login.jsp" flush="false"></jsp:include>
				<% 
				}
			}catch(Exception e) { %>
				<jsp:include page="login/login.jsp" flush="false"></jsp:include>
				<%
			}	%>
			
		</TD>
		<TD  width="700" height="200" bgcolor="#00CCCC">
			<jsp:include page="menu/menu.jsp" flush="false"></jsp:include>
		</TD>
	</TR>
	<TR>
		<TD  width="300" height="600" bgcolor="#CCCC00">
			<jsp:include page="menu/subMenu.jsp" flush="false">
				<jsp:param name="menu" value="<%=menu%>" />
			</jsp:include>
		</TD>
		<TD width="600" height="600" valign="top" align="center">
			<%
			if(menu.equals("info")) {
			%>
				<jsp:include page="menu/info.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
				</jsp:include>
			<%
			} else if(menu.equals("major")) {
			%>
				<jsp:include page="menu/major.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
				</jsp:include>
			<%
			} else if(menu.equals("noti")) {
			%>
				<jsp:include page="menu/noti.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
					<jsp:param name="num" value="<%=num%>" />
					<jsp:param name="key" value="<%=key%>" />
					<jsp:param name="keyword" value="<%=keyword%>" />
					<jsp:param name="action" value="<%=action%>" />
					<jsp:param name="subAction" value="<%=subAction%>" />
					<jsp:param name="commentNum" value="<%=commentNum%>" />
				</jsp:include>
			<%
			} else if(menu.equals("free")) {
			%>
				<jsp:include page="menu/free.jsp" flush="false">
					<jsp:param name="subMenu" value="<%=subMenu%>" />
					<jsp:param name="num" value="<%=num%>" />
					<jsp:param name="key" value="<%=key%>" />
					<jsp:param name="keyword" value="<%=keyword%>" />
					<jsp:param name="action" value="<%=action%>" />
					<jsp:param name="subAction" value="<%=subAction%>" />
					<jsp:param name="commentNum" value="<%=commentNum%>" />
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