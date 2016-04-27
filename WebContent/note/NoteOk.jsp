<%@page import="kosta.note.NoteService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="note" class="kosta.model.Note"></jsp:useBean>
	<jsp:setProperty property="*" name="note"/>
	
	<%
	int re=0;
	NoteService service = NoteService.getInsetance();
	re = service.insertNoteService(note);
	
	if(re>0){
		response.sendRedirect("noteStorage.jsp");
		  out.print("<script type='text/javascript'>alert('보내졌음');</script>");  
		
	}else{
		out.print("<script type='text/javascript'>alert('노노 실패'); history.back();</script>");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>