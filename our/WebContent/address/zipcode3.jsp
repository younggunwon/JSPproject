<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT language="JavaScript">
function strData(fzip, fadd) {
	opener.document.Member_Input.zip.value = fzip; 
	opener.document.Member_Input.address1.value = fadd;
	opener.document.Member_Input.address2.focus();
	window.close();
}
	
</SCRIPT>

</head>
<body>

<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("euc-kr"); 
%>

<FORM>
<CENTER>
<TABLE border="1">
<%
String fdong = request.getParameter("fdong"); 
// Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");



try {
	String driverName = "org.gjt.mm.mysql.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/test1";

	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

	Statement stmt = conn.createStatement();
	
	// �����ȣ ���̺� tblZipCode���� �˻�� �ش��ϴ� '��'�� ��ü�ּҸ� �˻��Ѵ�.
	String strSQL = "SELECT * FROM tblZipCode6 where ���鵿 like '%" + fdong + "%'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	// ���������� �˻��� ����� ���� ��� �Ʒ��� ���� ������ ����Ѵ�.
	if(!rs.next()) {
%>
	<TR>
		<TD align="center"><FONT size="2">ã�� �ּҰ� �����ϴ�.</FONT></TD>
	</TR> 
<%
	} else {
%> 
	
	<TR>
		<TD align="center" colspan="3">
		�����ȣ �˻� �Ϸ� 
		</TD>
	</TR>
	<TR>
		<TD align="center"> �����ȣ </TD>
		<TD align="center"> �� �� </TD>
		<TD align="center"> �� �� </TD>
	</TR>
<%
	}
	
	while(rs.next()) {

		String code = rs.getString("�����ȣ");
		String sido = rs.getString("�õ�");
		String gungu = rs.getString("�ñ���");
		String dong = rs.getString("���鵿");
		String bungi = rs.getString("����");
		
		// ��ü�ּҿ��� null���ڸ� ������ �ش�.
		String address = sido+" "+gungu+" "+dong+" "+bungi;
		address = address.replaceAll("null", "");
%>
	<TR>
		<TD align="center"><FONT size=2><%= code%></FONT></TD>
		<TD><FONT size=2>&nbsp;<%= address%></FONT></TD>
		<TD align="center"><INPUT type=button value="����" onClick ="strData('<%= code%>', '<%= sido%>&nbsp;<%= gungu%>&nbsp;<%= dong%>')"></TD>
	</TR>
<%
	}

	rs.close();
	stmt.close();
	conn.close();
	
} catch (Exception ex) {  }
%>
</TABLE>
</FORM><P>

<TABLE>
<TR>
	<TD><a href="zipcode.jsp">[�ٽ� �˻��ϱ�]</a></TD>
	<TD><a href=javascript:close()>[�� ��]</a></TD>
</TR>
</TABLE>
</CENTER>


</body>
</html>