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

	<h3>이미지 보기</h3>
	<a href=""></a>

	<table border="1" cellpadding="0" cellspacing="0">
		<c:forEach var="a" items="${jsonList}">
			<tr height="200">
				<td align="center">${a.check_urlId}</td>
				<td align="center">${a.check_textArea}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>