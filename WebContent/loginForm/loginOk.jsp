<%@page import="kosta.login.Member"%>
<%@page import="kosta.login.MemberService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    request.setCharacterEncoding("utf-8");
    String m_email = request.getParameter("m_email");
    String m_pwd = request.getParameter("m_pwd");
    Member member = new Member();
    	int re = 0;
    	MemberService service = MemberService.getInsetance();
    	member = service.loginMemberService(m_email, m_pwd);
    	if(member != null){
    		session.setAttribute("m_id", member.getM_id());
    		session.setAttribute("m_name", member.getM_name());
    		out.print("<script type='text/javascript'>alert('로그인 성공'); location.href='../main.jsp';</script>");
    	}else{
    		out.print("<script type='text/javascript'>alert('로그인 실패'); history.back();</script>");		
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
