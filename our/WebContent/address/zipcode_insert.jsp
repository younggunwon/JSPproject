<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import = "java.sql.*" %>

<%

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection con = DriverManager.getConnection(dbURL, "root", "dongyang");

PreparedStatement pstmt1 = null, pstmt2 = null;

String strSQL ="INSERT INTO tblZipCode6(�����ȣ,�õ�,�ñ���,���鵿,����)";
strSQL = strSQL + "VALUES (?, ?, ?,?,?)";
pstmt2 = con.prepareStatement(strSQL);

pstmt2.setString(1,"08221" );
pstmt2.setString(2,"�����");
pstmt2.setString(3, "���α�");
pstmt2.setString(4,"��ô��");
pstmt2.setString(5,"50-120");
pstmt2.executeUpdate();

%>
����
</body>
</html>