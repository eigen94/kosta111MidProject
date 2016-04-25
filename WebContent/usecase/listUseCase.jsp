<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../javascriptFiles/jquery-2.2.3.min.js" type="text/javascript"></script>
<script src="../javascriptFiles/usecase.js" type="text/javascript"></script>
</head>
<body>
	<div class="package">
		<button> 나와라 </button>
			<c:forEach var="obj" items="${jsonList }">
				<hr>
				${obj.outline }, 
				${obj.actor }, 
				${obj.conditionF }, 
				${obj.event }, 
				${obj.eventDetail }, 
				${obj.conditionB }, 
				${obj.claim }, 
				<hr>
			</c:forEach>
	</div>
</body>
</html>