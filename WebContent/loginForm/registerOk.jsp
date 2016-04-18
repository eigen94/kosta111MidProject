<%@page import="kosta.login.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberService service = MemberService.getInsetance();
int re = 0;
re = service.insertMember(request);
if(re>0){
	out.print("<script type='text/javascript'>alert('registerOk!');location.href='loginForm.jsp';</script>");
} else {
	out.print("<script type='text/javascript'>alert('register Fail!');history.back();</script>");
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>