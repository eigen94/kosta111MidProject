<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<a href="checkDetail.do?check_id=${detail.check_id }">${detail.check_name }</a>
		<br>
		${detail.check_start }<br>
		${detail.check_end }<br>
		${detail.check_manager }<br>
		<c:choose>
			<c:when test="${detail.check_type == 1 }">
				데이터명세
			</c:when>
			<c:when test="${detail.check_type == 2 }">
				기능명세
			</c:when>
			<c:when test="${detail.check_type == 3 }">
				화면명세
			</c:when>
			<c:when test="${detail.check_type == 4 }">
				자유양식
			</c:when>
		</c:choose><br>
		${detail.check_content }<br>
		<a href="checkListUpdateForm.jsp?check_id=${detail.check_id }&&check_projectId=${detail.check_projectId}"><button>수정</button></a>
		<a href="checkDelete.do?check_id=${detail.check_id }&&check_projectid=${detail.check_projectId}"><button>삭제</button></a>
</body>
</html>