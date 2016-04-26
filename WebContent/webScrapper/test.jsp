<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="result"></div>

<script type="text/javascript" src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#result').load('target.jsp .hi',function(){
		console.log('find');
	});
	$('#result').load('https://github.com/eigen94/kosta111MidProject .js-navigation-open',function(){
		console.log('find');
	});
});

</script>
</body>
</html>