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
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=intro">총장소개</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=ide">교육이념</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=simbol">대학상징</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=info&subMenu=road">오시는길</a></TD>
		</TR>
</TABLE>
<%
	} else if(menu.equals("major")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=machine">기계공학부</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=computer">컴퓨터공학부</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=management">경영학부</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=major&subMenu=robot">로봇자동차공학부</a></TD>
		</TR>
	</TABLE>
<%
	} else if(menu.equals("noti")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=calendar">학사일정</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=event">대학행사</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=job">취업정보</a></TD>
		</TR>
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=noti&subMenu=food">금주의식단</a></TD>
		</TR>
	</TABLE>
<%
	} else if(menu.equals("free")) {
%>
<TABLE widh = 100% height = 100% align="center">
		<TR>
			<TD width = 100 height=100 align="center"><a href="main.jsp?menu=free&subMenu=intro">자유게시판</a></TD>
		</TR>
</TABLE>
<%
	}
%>
</body>
</html>