<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="projectUpdate.do" method="post">
	<input type="hidden" name="p_id" value="${param.p_id }">	
	프로젝트 이름 : <input type="text" name="p_name"><br>
	프로젝트 시작일 : <input type="text" name="p_start">
	프로젝트 종료일 : <input type="text" name="p_end"><br>
	메모 <br>
	<textarea rows="6" cols="70" name="p_memo"></textarea>
	<br>
	<input type="submit" value="등록">
	</form>
</body>
</html>