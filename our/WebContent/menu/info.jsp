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
	String subMenu = request.getParameter("subMenu");
	if(subMenu.equals("intro")) {
%>
	<!-- <img src="D:/kim/web1_6/WebContent/img/info.png" alt="���� �Ұ�"> -->
	<img src="D:/kim/web1_6/WebContent/img/intro.PNG" alt="���� �Ұ�">
	
<%
	}else if(subMenu.equals("ide")) {
%>
	<img src="D:/kim/web1_6/WebContent/img/ide1.PNG" alt="���� �̳�">
	<img src="D:/kim/web1_6/WebContent/img/ide2.PNG" alt="���� �̳�">
<%
	}else if(subMenu.equals("simbol")) {
%>
	<img src="D:/kim/web1_6/WebContent/img/simbol.PNG" alt="���� �ɺ�">
	
<%
	}else if(subMenu.equals("road")) {
%>
	<img src="D:/kim/web1_6/WebContent/img/road.PNG" alt="���ô� ��">
<%
	}
%>
<%=subMenu %>
</body>
</html>