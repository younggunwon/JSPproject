<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.sql.*, java.util.*"%>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = "YES";

	String driverName = "org.gjt.mm.mysql.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/test1";

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");

	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM user6 where id='" + id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);

	if (!rs.next()) {	
		response.sendRedirect("main.jsp?alert=cantId ");
	} else {

		String logId = rs.getString("id");
		String logPass = rs.getString("pass");
		String logName = rs.getString("name");
		String logMajor = rs.getString("major");
		String logSubject = rs.getString("subject");
		String logEmail = rs.getString("email");
		String logZip = rs.getString("zip");
		String logAddress1 = rs.getString("address1");
		String logAddress2 = rs.getString("address2");
		String logPhone = rs.getString("phone");

		if (!pass.equals(logPass)) {
			response.sendRedirect("main.jsp?alert=cantPass ");
		} else {
			session.setAttribute("LOGIN", login);
			Cookie cookie[] = new Cookie[9];
			cookie[0] = new Cookie("id", URLEncoder.encode(logId, "utf-8"));
			cookie[1] = new Cookie("name", URLEncoder.encode(logName, "utf-8"));
			cookie[2] = new Cookie("major", URLEncoder.encode(logMajor, "utf-8"));
			cookie[3] = new Cookie("subject", URLEncoder.encode(logSubject, "utf-8"));
			cookie[4] = new Cookie("email", URLEncoder.encode(logEmail, "utf-8"));
			cookie[5] = new Cookie("zip", URLEncoder.encode(logZip, "utf-8"));
			cookie[6] = new Cookie("address1", URLEncoder.encode(logAddress1, "utf-8"));
			cookie[7] = new Cookie("address2", URLEncoder.encode(logAddress2, "utf-8"));
			cookie[8] = new Cookie("phone", URLEncoder.encode(logPhone, "utf-8"));

			for (int i = 0; i < 9; i++) {
				cookie[i].setMaxAge(60 * 60 * 24);
				cookie[i].setPath("/");
				response.addCookie(cookie[i]);
			}
			response.sendRedirect("../main.jsp");
		}
	}
	%>

</body>
</html>