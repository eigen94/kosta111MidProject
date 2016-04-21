<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>note</title>
</head>
<body>
<form action="NoteOk.jsp" method="post">
<input type="hidden" name="n_id">
<input type="hidden" name="n_sender">
제목: &nbsp;<input type="text" name="n_title"><br>
받는사람: &nbsp;<input type="text" name="n_receive"><Br>
내용 <textarea name="n_content"></textarea><br><br>
<input type="submit" value="전송">
</form>



</body>
</html>