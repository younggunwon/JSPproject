<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>

<SCRIPT language="JavaScript">
function SearchCheck()
{
if (Form.keyword.value.length < 1) {
	alert("�˻�� �Է��ϼ���.");
	Form.keyword.focus(); 
         return false;
	}
}
</SCRIPT>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">

</HEAD>
<BODY>

<%

String key = request.getParameter("key");	//�ۼ���, ������, �۹�ȣ
String keyword = request.getParameter("keyword");
String pageNum = request.getParameter("pageNum");


if(pageNum == null){
	pageNum = "1";	
}

//�� page�� �����ִ� �� ������ֱ� - �ڱ� �ڽ��� �� �� ǥ���ϱ�
int listSize = 10;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
String strSQL = "";

   
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost/test1";


    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();

ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM noti";	//tblboard�� ��� ���� ī��Ʈ �Ѵ�.
}else{
	strSQL = "SELECT count(*) FROM noti WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);	//�� ���� ����


%>

<center><font size='3'><b> �л����� �Խ��� </b></font></TD>
                                    
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

	<TR bgcolor='cccccc'>      
		<TD><font size=2><center><b>��ȣ</b></center></font></TD>      
		<TD><font size=2><center><b>�� ����</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>��ȸ</b></center></font></TD>      
	</TR>   
	
<%
if(lastRow > 0) {	//���� ������ 0���� ũ�� �� �����ֱ�
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM noti WHERE num BETWEEN " + startRow + " and " + endRow + " ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM noti WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 1; i < listSize; i++){			
		while(rs.next()){

		int listnum = rs.getInt("num");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String title = rs.getString("title");
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");

%>

	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'><%=listnum %></font></TD>     
		<TD align=left>
			<a href="main.jsp?menu=noti&subMenu=calendar&num=<%=listnum %>">
			<font size=2 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>
			<font size=2 color="black"><%=name %></font></a>     
		</TD>     
		<TD align=center><font size=2><%=writedate %></font>
		</TD>     
		<TD align=center><font size=2><%=readcount %></font>     
	</TR>  
	   	
<% 
		}    
	}
	

%>

</TABLE>     

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
                  	                   
<%
}
		
//������ [����], [����] �����
if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {	//���� �������� 1���� Ŭ ��츸
%>
		<a href="listboard11.jsp?pageNum=<%=currentPage-1%>">[����]</a>	
<%	
	}
	for(i=setPage; i<=lastPage; i++) {	//������ ������ŭ ��Ÿ����
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<a href="listboard11.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {	//���� �������� ������ ���������� ���� ��쿡��
%>
		<a href="listboard11.jsp?pageNum=<%=currentPage+1%>">[����]</a>
<%
	}
}
%>  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=600>
	<TR>
		<TD align='center'>	
			<TABLE border='0' cellpadding='0' cellspacing='0'>
			<FORM Name='Form' Method='POST' Action='listboard11.jsp' OnSubmit='return SearchCheck()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='2'>
                                                        ������</font></option>
				<option value='contents'><font size='2'>
                                                        �۳���</font></option>
				<option value='name'><font size='2'>
                                                        �ۼ���</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input type='text' name='keyword' value='' size='20' maxlength='30'>
					<input type='submit' value='�˻�'>
				</td>
			  </TR>
			  </FORM>
			  </TABLE> 
		</TD>

		<TD align='right'>
<%if(session.getAttribute("LOGIN").equals("YES")) { %>
		<a href='menu/noti/writeNoti.jsp'>[���]</a>
<%} else { %>
		[���]
<%} %>
		</TD>
	</TR>
</TABLE>
                  
</BODY>                     
</HTML>