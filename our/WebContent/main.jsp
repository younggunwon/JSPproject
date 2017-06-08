<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	

	
<Table border = '0' >
	<TR>
		<TD bgcolor="#00FFFF" width="300" height="200">
			<%try{
				if(session.getAttribute("LOGIN").equals("YES")) { %>
			<jsp:include page="login_success.jsp" flush="false"></jsp:include>
			<%
				} else { %>
				<jsp:include page="login.jsp" flush="false"></jsp:include>
				<%
				}
			}catch(Exception e) { %>
				<jsp:include page="login.jsp" flush="false"></jsp:include>
				<%
			}	%>
			
		</TD>
		<TD bgcolor="#FFFFFF" width="700" height="200">
		sdfsfdsf
		</TD>
	</TR>
	<TR>
		<TD bgcolor="#00FF00" width="300" height="600">
		sdfdsf
		</TD>
		<TD bgcolor="#0000FF" width="600" height="600">
		sdfdsf
		</TD>
	</TR>
</Table>
</body>
</html>