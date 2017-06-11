<%@page import="connectDB.ConnectDatabase"%>
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
<%@ page import = "java.sql.*, model.Comment " %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%

String id = request.getParameter("id");
String commentNum = request.getParameter("commentNum");
String realContents  = request.getParameter("contents");
String contents = realContents.replace("\n", "<br>");

Comment comment = new Comment();
comment.setContents(contents);
comment.setNum(commentNum);

ConnectDatabase cd = new ConnectDatabase("noti_event_comment6");
int result = cd.resetComment(comment);

if(result == 1) {
	response.sendRedirect("../../main.jsp?menu=noti&subMenu=event&action=read&num=" + id);
} else if(result == 0) {
	out.println("DB연동 오류입니다.");
} 
%>


</body>
</html>