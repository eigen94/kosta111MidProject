<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<h3>usecaseDiagram</h3>
<%-- ${objArray[0].act } --%><br>

<%
JSONArray list = new JSONArray();
list = (JSONArray)request.getAttribute("objArray");
for(int i=0; i<list.size(); i++)
{
	JSONObject obj = new JSONObject();
	obj = (JSONObject)list.get(i);
	out.println("액터"+obj.get("act")+"<br>");
	out.println("이벤트"+obj.get("even")+"<br>");
	out.println("관계"+obj.get("relation")+"<br>");
	out.print("<br>");
}
%>
<%-- <c:forEach  var="obj" items="${objArray } ">
${obj.act }<br>

	액터: &nbsp;${obj.act }<Br>
	이벤트: &nbsp;${obj.even }<br>
	릴레이션: &nbsp;${obj.relation } 

	
	</c:forEach>  --%>
<br><br>
</body>
</html>