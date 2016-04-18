<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<hr>
		${select.p_id }<br>
		${select.p_name }<br>
		${select.p_start }<br>
		${select.p_end }<br>
		${select.p_pmid }<br>
		${select.p_crew }<br>
		${select.p_memo }<br>
		<a href="projectList.do"><button>목록으로</button></a>
		<a href="delete.do?p_id=${select.p_id }"><button>삭제</button></a>
		<hr>
</body>
</html>