<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT LANGUAGE="Javascript">
function zipsubmit(){
	if (document.zipform.fdong.value == "") {
		alert("'동' 이름이 비어있습니다");
		document.zipform.fdong.focus();
		return;
	}
	document.zipform.submit();
}
</SCRIPT>  

</head>
<body>

<FORM name="zipform" method="post" action="zipcode3.jsp">

<BR><BR>
	<TABLE border="1" align="center">
	<TR>
		<TD width="430" height=20 align="center">
			<FONT size=2>찾는 주소의 <b>'동'</b> 이름을 입력하세요.</FONT>
		</TD>
	</TR>
	<TR>
		<TD width="430" height=50 align="center">
			<FONT size=2>주 소 ('동' 이름)  : 
			<INPUT type="text" name="fdong" value="" size="12">
			<INPUT type="button" value="검색" onclick="zipsubmit()">
			<BR></FONT>
		</TD>
	</TR>
	</TABLE>


</FORM>

<TABLE border="0" cellpadding="0" cellspacing="0" width="430" align="center">
	<TR>
		<TD align="center" width="430"><a href=javascript:close()>[닫 기]</a></TD>
	</TR>
</TABLE>

</BODY>


</body>
</html>