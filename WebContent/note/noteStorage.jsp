<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="kosta.note.Note"%>
<%@page import="kosta.note.NoteService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%
    request.setCharacterEncoding("utf-8");
   
    String id = request.getParameter("n_id");
    int n_id =1;
    
  /*   if(id != null){
    	n_id = Integer.parseInt(id);
    }  */ 
    NoteService service = NoteService.getInsetance();
    List<Note> note = new ArrayList<Note>();
   	note = service.selectNoteService(n_id);
   	request.setAttribute("note", note);
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">


<c:forEach var="note" items="${note }">
<tr>
<td>${note.n_id }</td>
<td>${note.n_title }</td>
<td>${note.n_content }</td>
<td>${note.n_sender }</td>
<td>${note.n_receive }</td>
<td>
<fmt:formatDate value="${note.n_date }" pattern="yyyy-MM-dd"/>
</td>

</tr>
</c:forEach>
</table>

</body>
</html>