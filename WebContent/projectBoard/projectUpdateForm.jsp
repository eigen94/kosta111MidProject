<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="projectUpdate.do" method="post">
	<input type="hidden" name="p_id" value="${param.p_id }">	
	������Ʈ �̸� : <input type="text" name="p_name"><br>
	������Ʈ ������ : <input type="text" name="p_start">
	������Ʈ ������ : <input type="text" name="p_end"><br>
	�޸� <br>
	<textarea rows="6" cols="70" name="p_memo"></textarea>
	<br>
	<input type="submit" value="���">
	</form>
</body>
</html>