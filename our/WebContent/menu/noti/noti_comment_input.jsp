<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="connectDB.ConnectDatabase" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="comment" class="model.Comment" scope="page">
	<jsp:setProperty name="comment" property="*"/>
</jsp:useBean>
<%
	ConnectDatabase cd = new ConnectDatabase("noti_comment6");
	int result = cd.addComment(comment);
	if(result == 1) {
		response.sendRedirect("../../main.jsp?menu=noti&subMenu=calendar&action=read&num=" + comment.getId());
	}else if(result == 0) {
%>
DB연동 실패
<%	
	}
%>
</body>
</html>