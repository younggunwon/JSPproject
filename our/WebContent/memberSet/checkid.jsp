<%@page import="connectDB.ConnectDatabase"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">
function checkId(){
	opener.document.Member_Input.overlap.value = "사용 가능";
	window.close();
}

function cancel(){
	opener.document.Member_Input.overlap.value = "ID 중복검사";
	window.close();
}
</SCRIPT>
</head>
<body>

<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<TABLE border='1' width=250>
	
<%
String id = request.getParameter("id");

if (id == ""){
%>

<TR>
	<TD align='center' bgcolor='cccccc'>
	<font size='2'>id를 입력하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[닫 기]</a>
	</TD>
</TR>

<%
} else {
	ConnectDatabase cd = new ConnectDatabase();
	int result = cd.checkId(id);

	if (result == 2) {
%>
<TR>
	<TD align='center' bgcolor='cccccc' colspan="2">
	<fint size='2'>ID : <%=id%> <BR> 사용할 수 있는 아이디입니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<input type="button" value="사용" onClick="checkId()">
	</TD>
	<TD align='center'>
	<input type="button" value="취소" onClick="cancel()">
	</TD>
</TR>
<%
	} else if(result == 1) {
%>
<TR>
	<TD align='center' bgcolor='cccccc'>
	<font size='2'>ID : <%=id%> <BR> 사용할 수 없는 아이디입니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<input type="button" value="닫기" onClick="cancel()">
	</TD>
</TR>
<%
	} else if(result == 0){
%>
	DB연동 오류입니다.
<%	
	}
}
%>



</body>
</html>