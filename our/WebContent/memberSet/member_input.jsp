<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<SCRIPT LANGUAGE="JavaScript">
function Check($state) 
{
if (Member_Input.overlap.value != "사용 가능"){
		alert("아이디 중복 검사를 해주세요.");
		Member_Input.id.focus();
		return false;
}
if (Member_Input.id.value.length < 1){
	alert("아이디를 입력하세요.");
	Member_Input.id.focus();
	return false;
	}

if (Member_Input.pass.value.length < 1){
	alert("비밀번호를 입력하세요.");
	Member_Input.pass.focus();
	return false;
	}

if (Member_Input.name.value.length < 1){
	alert("이름을 입력하세요.");
	Member_Input.name.focus();
	return false;
	}

if (Member_Input.juminnum1.value.length < 1){
	alert("주민등록번호를 입력하세요.");
	Member_Input.juminnum1.focus();
	return false;
	}

if (Member_Input.juminnum1.value.length!= 6){
	alert("주민등록번호 앞자리는 6자리 입니다.");
	Member_Input.juminnum1.focus();
	return false;
	}

for (var i=0;i<Member_Input.juminnum1.value.length;i++)
{
	if (Member_Input.juminnum1.value.charAt(i) < "0" || Member_Input.juminnum1.value.charAt(i) > "9")
	{
	alert("주민등록번호는 숫자만 가능합니다.");
	Member_Input.juminnum1.focus();
	return false;
	}
}

if (Member_Input.juminnum2.value.length < 1){
	alert("주민등록번호를 입력하세요.");
	Member_Input.juminnum2.focus();
	return false;
	} 

if (Member_Input.juminnum2.value.length != 7 ){
	alert("주민등록번호 뒷자리는 7자리 입니다.");
	Member_Input.juminnum2.focus();
	return false;
	}

for (var i=0;i<Member_Input.juminnum2.value.length;i++)
{
	if (Member_Input.juminnum2.value.charAt(i) < "0" || Member_Input.juminnum2.value.charAt(i) > "9")
	{
	alert("주민등록번호는 숫자만 가능합니다.");
	Member_Input.juminnum2.focus();
	return false;
	}
}

var sum,a,b,c,d,e,f,g,j,i,j,k,l,m;

a = parseInt(Member_Input.juminnum1.value.charAt(0));
b = parseInt(Member_Input.juminnum1.value.charAt(1)); 
c = parseInt(Member_Input.juminnum1.value.charAt(2));
d = parseInt(Member_Input.juminnum1.value.charAt(3));
e = parseInt(Member_Input.juminnum1.value.charAt(4));
f = parseInt(Member_Input.juminnum1.value.charAt(5));
g = parseInt(Member_Input.juminnum2.value.charAt(0));
h = parseInt(Member_Input.juminnum2.value.charAt(1));
i = parseInt(Member_Input.juminnum2.value.charAt(2));
j = parseInt(Member_Input.juminnum2.value.charAt(3));
k = parseInt(Member_Input.juminnum2.value.charAt(4));
l = parseInt(Member_Input.juminnum2.value.charAt(5));
m = parseInt(Member_Input.juminnum2.value.charAt(6));

sum = a*2 + b*3 + c*4 + d*5 + e*6 + f*7 + g*8 + h*9 + i*2 + j*3 + k*4 + l*5;

var namuji = sum % 11;
var gumsa = 11 - namuji;
var check_no = gumsa % 10;

if (check_no != m){
	alert("올바른 주민등록번호가 아닙니다.");
	Member_Input.juminnum2.focus();
	return false;
	}
	
if (Member_Input.address1.value.length < 1){
	alert("주소를 입력하세요.");
	Member_Input.address1.focus();
	return false;
	}
	
if (Member_Input.address2.value.length < 1){
	alert("상세주소를 입력하세요.");
	Member_Input.address2.focus();
	return false;
	}
	
if (Member_Input.major.value.length < 1){
	alert("학부를 입력하세요.");
	Member_Input.major.focus();
	return false;
	}

if (Member_Input.subject.value.length < 1){
	alert("학과를 입력하세요.");
	Member_Input.subject.focus();
	return false;
	}
	
if (Member_Input.phone.value.length < 1){
	alert("전화번호를 입력하세요.");
	Member_Input.phone.focus();
	return false;
	}
	
	//이메일은 @와 . 포함 여부로 가져오기
	

Member_Input.submit();
}

function Check_focus()
{
var strfocus1 = Member_Input.juminnum1.value.length;
if(strfocus1 == 6)
Member_Input.juminnum2.focus(); 
}	  

function ZipCode() 
{
browsing_window = window.open("../address/zipcode.jsp", "_zipinput","height=300,width=600, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}
function Check_id() 
{
browsing_window = window.open("checkid.jsp?id="+Member_Input.id.value, "_idcheck","height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}

</SCRIPT>     


</head>
<body>

<% boolean state = false; %>

<center><font size='3'><b> 회원 가입 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='Member_Input' Method='post' Action='member_output.jsp'>

<TABLE  border='2' cellSpacing=0 cellPadding=5 align=center>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>아 이 디</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxLength='10' size='10' name='id'>
		<input type='button' OnClick='Check_id()' name='overlap' value='ID 중복검사'>
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
		<input type='text' maxLength='10' size='10' name='name'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>주민등록번호</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='password' size='6' maxlength='6' name='juminnum1' OnKeyPress='Check_focus();'>- 
		<input type='password' size='7' maxlength='7' name='juminnum2'> 
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>우 편 번 호</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='7' size='7' name='zip' onFocus='Member_Input.address2.focus()'>
		<input OnClick='ZipCode()' type='button' value='우편번호검색'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>주 소</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='50' size='50' name='address1' onFocus='Member_Input.address2.focus()'><BR>
		<input type='text' maxlength='50' size='50' name='address2'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>학 부</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='20' size='20' name='major'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>학 과</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='20' size='20' name='subject'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>전 화 번 호</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='20' size='20' name='phone'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='center'>
		<font size='2'>E - M a i l</font>
	</TD>
	<TD bgcolor='cccccc'>
		<input type='text' maxlength='50' size='50' name='email'>
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
		<input type='button' OnClick="Check('<%=state %>')" value='회원가입'>
	</TD>
</TR>
</TABLE>

</FORM>


</body>
</html>