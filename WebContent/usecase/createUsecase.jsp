<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.3.js"></script>
<!-- <script src="../javascriptFilse/usecase.js" type="text/javascript"></script> -->
<link rel="stylesheet" href="../cssFiles/tmp.css" type="text/css" />
</head>
<body>
	<div class="top_position">
		<input type="text" name="" value="프로잭트 이름">
		<input type="text" name="" value="일정이름및유형정보">
		<input type="text" name="" value="정보"><br>
	</div>
	<div class="mid_position">
		<h3>기능명세 - Use_case</h3><br>
		<div id="item">
				<select name="select">
    				<option value="1">개요</option>
    				<option value="2">관련엑터</option>
    				<option value="3">선행조건</option>
				</select>
				<input type="text" name="내용" value="내용을 입력하세요.">
				<span id="minus_btn">
					<button>ㅡ</button>
				</span>
		</div>
		<div id="field"></div>
		<div id="plus_btn">
			<button id="addUsecase">+</button>
		</div>
	</div>
	<div class="bot_position">
		<div class="save">
			<button>저장</button>
		</div>
	</div>
	<!-- <script src="usecaseDetail.js"></script> -->
	<script type="text/javascript">
	var tableCount = 0;
	
	$(function(){
		var jsonArray = new Array();
		
		$("#submit").click(function(){
			var jsonObj = new Object();
			jsonObj.select = $("#select").val();
			jsonObj.content= $("#usecaseContent").val();
			
		jsonArray.push(jsonObj);
		var finalJsonObj = JSON.stringify(jsonObj);
		
		$.ajax({
			type:"post",
			url:"usecase.do",
			data:{
				json:finalJsonObj
			},
			dataType: "text",
			success: function(data){
				alert("성공");
			},error: function(data){
				alert("실패");
			}
		})
		
		});
		
		$("#addUsecase").click(function(){
			var select="select";
			var minus="minus_btn";
			var text="text";
			var content="usecaseContent";
			var name="내용";
			var value="내용을 입력하세요.";
			var num1 ="1";
			var num2 ="2";
			var num3 ="3";
			var add = '<br>';
			add += '<select name='+select+'>';
			add += '<option value='+num1+'>'+'개요'+'</option>';
			add += '<option value='+num2+'>'+'관련액터'+'</option>';
			add += '<option value='+num3+'>'+'선행조건'+'</option></select>';
			add += '<input type='+text +'id='+content+'value='+value+'>';
			add +='<span id='+minus+'><button>'+'-'+'</button>';
			$("#item").append(add);
		});
	});
	</script>
	
</body>
</html>








