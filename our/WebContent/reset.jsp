<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<SCRIPT LANGUAGE="JavaScript">
function set()
{
	if (reset.pass.value.length < 1){
		alert("비밀번호를 입력하세요.");
		Member_Input.pass.focus();
		return false;
	}
	if (reset.address1.value.length < 1){
		alert("주소를 입력하세요.");
		Member_Input.address1.focus();
		return false;
	}
		
	if (reset.address2.value.length < 1){
		alert("상세주소를 입력하세요.");
		Member_Input.address2.focus();
		return false;
	}
		
	if (reset.major.value.length < 1){
		alert("학부를 입력하세요.");
		Member_Input.major.focus();
		return false;
	}

	if (reset.subject.value.length < 1){
		alert("학과를 입력하세요.");
		Member_Input.subject.focus();
		return false;
	}
		
	if (reset.phone.value.length < 1){
		alert("전화번호를 입력하세요.");
		Member_Input.phone.focus();
		return false;
	}
	//이메일은 @와 . 포함 여부로 가져오기
	reset.submit();
}

function cancel()
{
	window.close();
}

</SCRIPT>     


</head>
<body>

<% boolean state = false; %>
<%
String id = "";
String name = "";
String major = "";
String subject = "";
String email = "";
String zip = "";
String address1 = "";
String address2 = "";
String phone = "";

Cookie cookie[] = request.getCookies();
if(cookie != null) {
	for(int i = 0; i < cookie.length; i++) {
		if(cookie[i].getName().equals("id")) {
			id = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("name")) {
			name = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("major")) {
			major = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("subject")) {
			subject = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("email")) {
			email = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("zip")) {
			zip = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("address1")) {
			address1 = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("address2")) {
			address2 = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		} else if(cookie[i].getName().equals("phone")) {
			phone = URLDecoder.decode(cookie[i].getValue(), "utf-8");
		}
	}
}
%>

<center><font size='3'><b> 개인 정보 수정 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='reset' Method='post' Action='reset_ok.jsp'>

<TABLE  border='2' cellSpacing=0 cellPadding=5 align=center>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>아 이 디</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type="hidden" name="id" value = <%=id %>><%= id %>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>비 밀 번 호</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='password' maxLength='10' size='10' name='pass'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>이 름</font>
	</TD>
	<TD bgcolor='cccccc'>
		<%=name %>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>우 편 번 호</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='7' size='7' name='zip' onFocus='Member_Input.address2.focus()' value=<%=zip %>>
		<input OnClick='ZipCode()' type='button' value='우편번호검색'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>주 소</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='50' size='50' name='address1' onFocus='Member_Input.address2.focus()' value=<%=address1 %>><BR>
		<input type='text' maxlength='50' size='50' name='address2' value=<%=address2 %>>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>학 부</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='20' size='20' name='major' value=<%=major %>>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>학 과</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='20' size='20' name='subject' value=<%=subject %>>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>전 화 번 호</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='20' size='20' name='phone' value=<%=phone %>>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>E - M a i l</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='50' size='50' name='email' value=<%=email %>>
	</TD>
</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE>
<TR>
	<TD colspan='2' align='center'>
		<input type='button' OnClick="set()" value='수  정'>
	</TD>
	<TD colspan='2' align='center'>
		<input type='button' OnClick="cancel()" value='취  소'>
	</TD>
</TR>
</TABLE>

</FORM>


</body>
</html>