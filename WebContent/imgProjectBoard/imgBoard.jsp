<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
 	var imgCount = 0;

	$(function() {
		var jsonArray = new Array();

		$("#submit").click(function() {
			var jsonObj = new Object();

			jsonObj.check_urlId = $(".check_urlId").val();
			jsonObj.check_textArea = $(".check_textArea").val();
			jsonObj.check_uploadName = $(".check_uploadName").val();
			

			var imgJsonObj = JSON.stringify(jsonObj);
			console.log(imgJsonObj);

			$.ajax({
				type : "post",
				url : "insertImg.img",
				data : {
					json : imgJsonObj
				},
				dataType : "text",
				success : function() {
					location.href = "imgListBoard.img"
				},
				error : function() {
					alert("����");
				}
			})
		})
	}) 
	
	$(function(){
		
	})
</script>
</head>
<body>

		<h3>�̹��� ����</h3>
		<table border="1">
			<tr height="30">
				<td>����</td>
				<td colspan="3">
				<input type="file" name="check_urlId" class="check_urlId"></td>
			</tr>
			<tr>
				<td>�̹���</td>
				<td colspan="4">
					<img alt="" src="" class="check_uploadName">
				</td>
			</tr>
			<tr height="30"">
				<td>�޸�</td>
				<td colspan="3">
				<textarea rows="6" cols="70" name="check_textArea" class="check_textArea"></textarea></td>
			</tr>

			<tr height="30"">
				<td colspan="4" align="center">
				<input type="submit" value="����" id="submit">&nbsp;</td>
			</tr>
		</table>
</body>
</html>