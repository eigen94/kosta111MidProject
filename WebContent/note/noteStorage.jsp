<%@page import="kosta.model.Note"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("utf-8");
 %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">

<c:forEach var="note" items="${noteList }">
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
	
	<div class="noteStorage">
		<div class="title">
			<table border="1">
				<tr>
					<td></td>
				</tr>
			</table>
		
		</div>
	</div>
	

</body>
</html>







