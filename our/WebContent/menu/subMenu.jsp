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
	if(menu.equals("info")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=intro">����Ұ�</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=ide">�����̳�</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=simbol">���л�¡</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=road">���ô±�</a></TD>
		</TR>
</TABLE>
<%
	} else if(menu.equals("major")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=machine">�����к�</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=computer">��ǻ�Ͱ��к�</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=management">�濵�к�</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=robot">�κ��ڵ������к�</a></TD>
		</TR>
	</TABLE>
<%
	} else if(menu.equals("noti")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=calendar">�л�����</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=event">�������</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=job">�������</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=food">�����ǽĴ�</a></TD>
		</TR>
	</TABLE>
<%
	} else if(menu.equals("free")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=free&subMenu=intro">�����Խ���</a></TD>
		</TR>
</TABLE>
<%
	}
%>
</body>
</html>