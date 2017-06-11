<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String num = request.getParameter("num");
String commentNum = request.getParameter("commentNum");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

Statement stmt = conn.createStatement();

try {

String strSQL = "DELETE FROM noti_food_comment6 WHERE num = '" + commentNum + "'" ;
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("../../main.jsp?menu=noti&subMenu=food&action=read&num=" + num);
}catch(Exception e) {
	
}

%>
</body>
</html>