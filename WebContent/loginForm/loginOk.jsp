<%@page import="kosta.login.MemberService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id="member" class="kosta.login.Member"></jsp:useBean>
    <jsp:setProperty property="*" name="member"/>
    
    <%
    	int re = 0;
    	MemberService service = MemberService.getInsetance();
    	re = service.insertMember(member);
    	
    	if(re>0){
    		response.sendRedirect("main.jsp");
    	}else{
    		re
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