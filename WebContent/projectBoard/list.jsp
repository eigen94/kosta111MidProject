<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach var="board" items="${list }">
		<hr>
		${board.p_id }<br>
		<a href="projectSelect.do?p_id=${board.p_id }">${board.p_name }</a><br>
		${board.p_start }<br>
		${board.p_end }<br>
		${board.p_pmid }<br>
		${board.p_crew }<br>
		${board.p_memo }<br>
		<a href="projectUpdateForm.jsp?p_id=${board.p_id }"><button>수정하기</button></a>
		<hr>
	</c:forEach>
</body>
</html>