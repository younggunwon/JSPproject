<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">
function Check()
{
if (Member.id.value.length < 1){
	alert("아이디를 입력하세요.");
	Member.id.focus();
	return false;
}

if (Member.pass.value.length < 1){
	alert("비밀번호를 입력하세요.");
	Member.pass.focus();
	return false;
}
Member.submit();
} 

function input_member() 
{
browsing_window = window.open("memberSet/member_input.jsp", "_inputMember","height=550,width=500, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}
</SCRIPT>
</head>
<body>

<FORM Name='Member' Method='post' Action='login/login_ok.jsp'>

<TABLE align=center width='300' border='0' cellpadding='10' cellspacing='0'>
<TR>
	<TD bgcolor='cccccc' align='right'>
		<font size='2'>ID :</font>
	</TD>
	<TD bgcolor='cccccc' align='center'>
		<input type=text maxlength=10 size=10 name=id>
	</TD>
	<TD bgcolor='cccccc' align='left'>
		<input onclick='Check()' type='button' value='로그인'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='right'>
		<font size='2'>비밀번호 :
	</TD>
	<TD bgcolor='cccccc' align='center'>
		<input type='password' maxlength='10' size='10' name='pass'>
	</TD>
	<TD bgcolor='cccccc'>
		<font size='2'>
		<input onclick='input_member()' type='button' value='회원가입'>
	</TD>
</TR>

</TABLE>

</FORM>
</body>
</html>