<%@page import="kosta.login.MemberService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    request.setCharacterEncoding("utf-8");
    String m_email = request.getParameter("m_email");
    String m_pwd = request.getParameter("m_pwd");
    
    	int re = 0;
    	MemberService service = MemberService.getInsetance();
    	re = service.loginMemberService(m_email, m_pwd);
    	
    	if(re>0){
    		out.print("<script type='text/javascript'>alert('�α��� ����'); history.back();</script>");
    	}else{
    		out.print("<script type='text/javascript'>alert('�α��� ����'); history.back();</script>");
    		
    	}
    %>
    
 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>

</body>
</html>