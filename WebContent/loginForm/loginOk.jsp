<%@page import="kosta.login.Member"%>

<%@page import="kosta.login.MemberService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    request.setCharacterEncoding("utf-8");
    String id=request.getParameter("m_id");
    String m_pwd=request.getParameter("m_pwd");
    
    int m_id =0;
    if(id != null){
    	m_id = Integer.parseInt("m_id");
    }
    
    int re=0;
    MemberService service = MemberService.getInsetance();
    re = service.loginMemberService(m_id, m_pwd);
    
    
    if(re>0){
    	out.print("로그인 성공");
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