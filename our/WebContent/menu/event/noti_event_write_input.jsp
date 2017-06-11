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
String name = "";
String id = "";
Cookie cookie[] = request.getCookies();
if(cookie != null) {
	for(int i = 0; i < cookie.length; i++) {
		if(cookie[i].getName().equals("name")) {
			name = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("id")) {
			id = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		}
	}
}

String realFolder = "";
String savePath = "D:/kim/web1_6/WebContent/img";
int sizeLimit = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한

String encType = "euc-kr";

ServletContext context = getServletContext();

MultipartRequest multi = null;
multi = new MultipartRequest( request,savePath,sizeLimit,encType, new DefaultFileRenamePolicy());

File file = multi.getFile("userFile");

String fileName = multi.getFilesystemName("userFile");

String title  = multi.getParameter("title");
String realContents  = multi.getParameter("contents");
String contents = realContents.replace("\n", "<br>");

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

Writing writing = new Writing();
writing.setId(id);
writing.setName(name);
writing.setTitle(title);
writing.setContents(contents);
writing.setWritedate(indate);
writing.setReadCount(0);
writing.setFileName(fileName);

ConnectDatabase cd = new ConnectDatabase("noti_event6");
int result = cd.addWriting(writing);

if(result == 1) {
response.sendRedirect("../../main.jsp?menu=noti&subMenu=event");
} else if(result == 0) {
%>
DB연동 오류입니다.
<%} %>


</body>
</html>