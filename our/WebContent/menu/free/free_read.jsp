<%@page import="javax.websocket.Session"%>
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

<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String myName = "";
String myId = "";
Cookie cookie[] = request.getCookies();
if(cookie != null) {
	for(int i = 0; i < cookie.length; i++) {
		if(cookie[i].getName().equals("name")) {
			myName = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("id")) {
			myId = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		}
	}
}
String subAction = request.getParameter("subAction");
String commentNum = request.getParameter("commentNum");

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

String num = request.getParameter("num"); 

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM free_free6 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String id = rs.getString("id");
String name = rs.getString("name");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
String filename = rs.getString("filename");

%>

<center><font size='3'><b> 게시판 </b></font>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='left'>
      		<font size='2'> 작성자 : <%=name %></font>
    		</TD>
    		
    		<TD align=right>
      		<font size='2'>작성일: <%=writedate %>, 조회수: <%=readcount %></font>
    		</TD>
    	</TR>
<%
	if(!filename.equals("null")) {
%>
    	<TR>
    		<TD align='left'>
      		<font size='2'> 파일이름 : <%=filename%></font>
      		</TD>
    	</TR>
<%
	}
%>

<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
	<TR bgcolor='cccccc'>
		<TD align='center'>
    		<font size='3'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
<% 
	if(!filename.equals("null") && filename != null && !filename.equals("")) { 
%>
	<TR bgcolor='ededed'>
		<TD align='center'>
		<img src=<%="D:/kim/web1_6/WebContent/img/" + filename %> width="400" height="400"></TD>
	</TR>
	<TR>
<%
	}
%>
		<TD><font size='2' color=''><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='right'>
		<font size='2'><br><font size='2'></font>
    		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='1' noshade>
  		</TD>
  	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
		<TD align='left'>
		<%
			if(myId.equals(id)) {
		%>
			<a href="main.jsp?menu=free&subMenu=free&action=reset&num=<%=num %>">[수정하기]</a>
			<a href="main.jsp?menu=free&subMenu=free&action=delete&num=<%=num %>">[삭제하기]</a>
		<%
			} else {
		%>
			[수정하기]
			[삭제하기]
		<%
			}
		%>
		</TD>

		<TD align='right'>
			<a href="main.jsp?menu=free&subMenu=free">[목록보기]</a>
 		</TD>
	</TR>
</TABLE>

<%
strSQL = "UPDATE free_free6 SET readcount=readcount+1 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
}

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "년";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "월";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + "일";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + "시";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + "분";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND)) + "초";

if(session.getAttribute("LOGIN").equals("YES")) {
%>

<FORM Name='Plus' Action='menu/free/free_comment_input.jsp' Method='post'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
<input type='hidden' name='id' value='<%=num %>'>
<input type='hidden' name='name' value='<%=myName %>'>
<input type='hidden' name='writeDate' value='<%=indate %>'>
<input type='hidden' name='maker' value='<%=myId %>'>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>한줄댓글</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<input type='text' size='62' name='contents' >
         		</font>
      		</TD>
      		<TD>
      			<input Type = 'Submit' Value = '댓글등록'>
      		</TD>
	</TR>
</TABLE>
</FORM>

<%
} else {
	
}
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM free_comment6 WHERE id = '" + num + "'";
rs = stmt.executeQuery(strSQL); 

while(rs.next()){ 
	int getCommentNum = rs.getInt("num");
	String getCommentId = rs.getString("maker");
%>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR bgcolor='cccccc'>     
		 <TD>
		 <font size=2 color='black'>
		 	<b><%=rs.getString("name")%> :</b>
<% 
			if(subAction.equals("comment_reset") && commentNum.equals(Integer.toString(getCommentNum)) ) {
%>
				<FORM Name='reset' Action='menu/free/free_comment_reset.jsp' Method='post'>
					<input type="hidden" name='commentNum' value='<%=getCommentNum %>'>
					<input type="hidden" name='id' value='<%=num %>'>
					<input type='text' name='contents' value='<%=rs.getString("contents")%>' size="60">
					<input type='button' value='취소' onclick='history.back()'>
					<input type='submit' value='수정'>
				</FORM>
<%					
			} else {
%>
		 	<%=rs.getString("contents")%>
		 	(<%=rs.getString("writedate")%>)
		 	</font>
		 </TD>
		 <TD align="right" width="80">
		<%
			if(myId.equals(getCommentId)) {
		%>
		 	<a href="main.jsp?menu=free&subMenu=free&action=read&num=<%=num %>&subAction=comment_reset&commentNum=<%=getCommentNum %>">[수정하기]</a>
		 	<a href="menu/free/free_comment_delete.jsp?commentNum=<%=getCommentNum %>&num=<%=num %>">[삭제하기]</a>
		<%
			} else {
		%>
			[수정하기]
			[삭제하기]
		<%
			}
		%>
		 </TD>
<% 			
			}
%> 
		 	
		 
	</TR> 
</TABLE>   	
<%     
}

rs.close();
stmt.close();
conn.close();
%>

</FORM>
</TABLE>



</body>
</html>