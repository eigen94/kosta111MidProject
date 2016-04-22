<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	var attrCount = 0;
	var opCount = 0;

	$(function(){		
		var jsonArray = new Array(); //UML은 여러개가 나올 수 있으니 배열로 선언		
		
		$("#submit").click(function(){
			var jsonObj = new Object(); //한개의 UML객체
			jsonObj.name = $("#name").val(); //UML의 이름
			jsonObj.attribute = new Array(); //UML의 속성은 여러개가 나올 수 있으니 배열
			jsonObj.operation = new Array(); //UML의 오퍼레이션도 여러개
						
			var accessAttrArr = $(".accessAttr"); //UML의 attribute의 접근제어자 
			var typeAttrArr = $(".typeAttr");  //UML의 attribute의 타입
			var nameAttrArr = $(".nameAttr"); //UML의 attribute의 이름
			
			var accessOpArr = $(".accessOp"); //UML의 오퍼레이션의 접근제어자
			var typeOpArr = $(".typeOp"); //UML 오퍼레이션의 타입
			var nameOpArr = $(".nameOp"); //UML 오퍼레이션의 이름
			var paraOpArr = $(".paraOp"); //UML 오퍼레이션의 파라미터
			
			for(var i=0; i<attrCount; i++) //전역변수 attrCount로 몇개의 attribute가 생성 되었는지 체크
				{	//생성된 attribute만큼 접근제어자, 타입, 이름을 받아옴
					var attr = new Object();
					attr.access = $(accessAttrArr).eq(i).val();
					attr.type = $(typeAttrArr).eq(i).val();
					attr.name = $(nameAttrArr).eq(i).val()
					
					jsonObj.attribute.push(attr);				
				}			
			
			for(var i=0; i<opCount; i++) //오퍼레이션도 마찬가지
				{
					var op = new Object();
					op.access = $(accessOpArr).eq(i).val();
					op.type = $(typeOpArr).eq(i).val();
					op.name = $(nameOpArr).eq(i).val();
					op.parameter = $(paraOpArr).eq(i).val();
					
					jsonObj.operation.push(op);
				}		
			
			jsonArray.push(jsonObj); //json배열에 만들어진 한개의 UML을 넣음
			//console.log(jsonArray);
			var finalJsonObj = JSON.stringify(jsonObj); //json을 ajax로 보내기 위한 과정
			//console.log(finalJsonObj);
			
			$.ajax({
				type : "post",
				url : "uml.do",
				data : {
					json : finalJsonObj
				},
				dataType : "text",				
				success : function(data)
				{
					alert("성공");
				},
				error : function(data)
				{
					alert("실패");
				}
			})
		});		
		
		$("#addAttr").click(function(){		
			var add = '<div class="attribute"><input type="text" class="accessAttr" size="1">&nbsp;<input type="text" class="typeAttr">&nbsp;<input type="text" class="nameAttr"></div>'
			$("tr:eq(1) td").append(add);			
			attrCount++;				
		});
		
		$("#addOp").click(function(){
			var add = '<div class="operation"><input type="text" class="accessOp" size="1">&nbsp;<input type="text" class="typeOp">&nbsp;<input type="text" class="nameOp">&nbsp;<input type="text" class="paraOp"></div>'
			$("tr:eq(2) td").append(add);
			opCount++;
		});		               
	});
</script>

</head>
<body>
	<table border="3" cellpadding="0" cellspacing="0">
		<tr height="80">
			<td width="800" align="center"><input type="text" id="name"></td>
		</tr>

		<tr height="80">
			<td width="800" align="center"></td>
		</tr>

		<tr height="80">
			<td width="800" align="center"></td>
		</tr>
	</table>
	<button id="addAttr">어트리뷰트 추가</button>
	<button id="addOp">오퍼레이션 추가</button>
	<button id="submit">전송</button>


</body>
</html>