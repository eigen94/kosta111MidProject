<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="obj" items="${objArray }">
		<hr>
		<h3>UML</h3>
		${obj.name }<br>
		${obj.attribute }<br>
		${obj.operation }<br>
		<hr>
	</c:forEach>
	<c:forEach var="relation" items="${relationArray }">
		<hr>
		<h3>relation</h3>
		${relation.start }<br>
		${relation.end }<br>
		${relation.relationType }<br>
		<hr>
	</c:forEach>
	
</body>
</html>