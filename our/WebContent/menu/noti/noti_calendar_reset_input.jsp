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
<%@ page import = "java.sql.*, model.Writing " %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>

<%

String savePath = "D:/kim/web1_6/WebContent/img";
int sizeLimit = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한

String encType = "euc-kr";

ServletContext context = getServletContext();

MultipartRequest multi = null;
multi = new MultipartRequest( request,savePath,sizeLimit,encType, new DefaultFileRenamePolicy());



String num = multi.getParameter("num");
String title  = multi.getParameter("title");
String realContents  = multi.getParameter("contents");
String contents = realContents.replace("\n", "<br>");

String fileName = multi.getFilesystemName("userFile");

Writing writing = new Writing();

writing.setFileName(fileName);

if(fileName == null || fileName.equals("")) {
	String fileName2 = multi.getParameter("fileName");
	if(fileName2 != null && !fileName2.equals("")) {
		writing.setFileName(fileName2);
	}
}

writing.setNum(Integer.parseInt(num));
writing.setTitle(title);
writing.setContents(contents);


ConnectDatabase cd = new ConnectDatabase("noti6");
int result = cd.resetWriting(writing);

if(result == 1) {
%>
<center><font size='3'><b> 게시글 수정 완료 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>게시글이 성공적으로 수정되었습니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="../../main.jsp?menu=noti&subMenu=calendar&action=read&num=<%=num%>">[확 인]</a></font>
	</TD>
</TR>
</TABLE>
<%
} else if(result == 0) {
%>
DB연동 오류입니다.
<%} %>


</body>
</html>