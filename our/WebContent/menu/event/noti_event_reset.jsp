<%@page import="connectDB.ConnectDatabase, model.Writing"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="java.net.URLDecoder"%>
<% request.setCharacterEncoding("euc-kr"); %>


<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function writeCheck()
{
if (Write.title.value.length < 1) {
	alert("글제목을 입력하세요.");
	Write.write_title.focus(); 
	return false;
}

if (Write.contents.value.length < 1) {
	alert("글내용을 입력하세요.");
	Write.content.focus(); 
	return false;
}

Write.submit();
}

function writeCancel()
{
	history.back();
}

</SCRIPT>
</HEAD>

<BODY>
<%
	String num = request.getParameter("num");
	ConnectDatabase cd = new ConnectDatabase("noti_event6");
	Writing writing = cd.getWriting(num);
%>
<center><font size='3'><b> 게시글 수정하기 </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='Write' Action='menu/event/noti_event_reset_input.jsp' Method='post' Enctype='multipart/form-data' OnSubmit='return Check()'>
<input type='hidden' name='num' value='<%=num %>'>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>글 제목</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value='<%=writing.getTitle()%>'></font>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<%=writing.getName() %>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성일</b></center></font>
		</TD>
		<TD>
			<%=writing.getWritedate() %>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>글 내용</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents'><%=writing.getContents()%></textarea>
         		</font>
      		</TD>
	</TR>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>사진</b></center></font>
		</TD>
		<TD>
			<font size='2'>
						   <input type="text" name = "fileName" value ='<%=writing.getFileName() %>'>
                           <input type="file" name="userFile">
                           </font>
		</TD>
	</TR>
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>

					<input Type = 'Button' Value = '수 정' Name='Page' onClick='writeCheck();'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Button' Value = '취  소'' onClick='writeCancel();'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>

</BODY>
</HTML>