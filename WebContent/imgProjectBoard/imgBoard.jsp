<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

var jsonArray = new Array();

$("#submit").click(function(){
	var jsonObj = new Object();
	
	jsonObj.check_urlId.val();
	jsonObj.check_textArea.val();
	
	var imgJsonObj = JSON.stringify(jsonObj);
	console.log(imgJsonObj);
		
		$.ajax({
			type : "post",
			url : "insertImg.img",
			data : {
				json : imgJsonObj
			},
			dataType : "text",
			success : function(){
				alert("성공");
			},
			error : function(){
				alert("실패");
			}
		})
		return false;
})

</script>
</head>
<body>

		<h3>이미지 생성</h3>
		<table border="1">
			<tr height="100">
				<td width="150">파일찾기</td></br>
				<td width="150"><input type="file" name="check_urlId"></td></br>
				<td width="150">메모</td></br>
				<td width="150"><textarea rows="6" cols="70" name="check_textArea"></textarea></td></br>
				<td width="150"><input type="submit" value="저장" id="submit"></td></br>
			</tr>
		</table>

</body>
</html>