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
<% request.setCharacterEncoding("euc-kr"); %>
 
<%
        String driver = "org.gjt.mm.mysql.Driver";
	    String url = "jdbc:mysql://localhost:3306/test1";
	    String user = "root";
	    String pwd = "dongyang";
		Connection con = null;
		Statement stmt = null ;
	  
		String sql = "create table noti_comment6( ";
		 sql = sql+ "num int auto_increment primary key, ";
		 sql = sql+ "id varchar(20), ";
		 sql = sql+ "maker varchar(20),";
		 sql = sql+ "name varchar(20), ";
	     sql = sql+ "contents varchar(500), ";
	     sql = sql+ "writedate varchar(50)) ";
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd); 
			stmt= con.createStatement();
			stmt.executeUpdate(sql) ;
			out.print("�����ͺ��̽� ���� ����!");
		}
		catch(Exception e){
			out.print("�����ͺ��̽� ���� ����!"+e);
		}
		finally{
			try{
				if(con != null) con.close();
				if(stmt != null) stmt.close();
			}
			catch(Exception e){ 
	  			out.println( e.getMessage());
			}
		}
		%>



</body>
</html>