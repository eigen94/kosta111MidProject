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
		var totalArray = new Object();
		var jsonArray = new Array(); //UML은 여러개가 나올 수 있으니 배열로 선언	
		var relationArray = new Array();
		
		$("#ok").click(function(){
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
			
			var obj = jsonObj;					
			var str = "<div class='umlObj'>Name : " +obj.name+"<br>";
			for(var j=0; j<attrCount; j++)
				{
					str += "Attribute : " +obj.attribute[j].access+" "+obj.attribute[j].type+" "+obj.attribute[j].name+"<br>";
				}
					
			for(var k=0; k<opCount; k++)
				{
					str += "Operation : " +obj.operation[k].access+" "+obj.operation[k].type+" "+obj.operation[k].name+"( "+obj.operation[k].parameter+" )<br>";
				}
								
			str += "</div><br><hr><br>";
			$("#list").append(str);		
			attrCount = 0;
			opCount = 0;
			
			$("tr:eq(1) td").empty();
			$("tr:eq(2) td").empty();
			$("#name").val("");
			console.log(jsonArray);
			
		});	//end ok button
		
		$("#submit").click(function(){
			totalArray.jsonArray = (jsonArray);
			totalArray.relationArray = (relationArray);
			
			console.log(totalArray);
			var finalArray = JSON.stringify(totalArray);
			console.log(finalArray);
			 $.ajax({
				type : "post",
				url : "uml.do",
				data : {
					json : finalArray
				},
				dataType : "text",				
				success : function(data)
				{
					location.href="umlList.do";
				},
				error : function(data)
				{
					alert("실패");
				} 
			});
		}); //end submit button
		
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
		
		$("#connect").click(function(){
			var relationObj = new Object();
			relationObj.start = $("#start").val();
			relationObj.end = $("#end").val();
			relationObj.relationType = $("#relationType").val();
			
			relationArray.push(relationObj);
			console.log(relationArray);
		}); //end connect button
		
	});
</script>

<style type="text/css">
#uml
{
	float: left;
}
#relation
{
	margin-left: 1000px;
}

#list
{
	clear: both;
}

</style>

</head>
<body>
<div id="btnSubmit"><button id="submit">전송</button></div>
	<table id="uml" border="3" cellpadding="0" cellspacing="0">
		<tr height="80">
			<td width="800" align="center"><input type="text" id="name"></td>
		</tr>

		<tr height="80">
			<td width="800" align="center"></td>
		</tr>

		<tr height="80">
			<td width="800" align="center"></td>
		</tr>
		
		<tr height="30">
			<td align="center">
				<button id="addAttr">어트리뷰트 추가</button>&nbsp;
				<button id="addOp">오퍼레이션 추가</button>&nbsp;	
				<button id="ok">완료</button>		
			</td>
		</tr>
	</table>
	<br><br>
	<table id="relation" border="2" cellpadding="0" cellspacing="0">
		<tr height="30">
			<th width="200" align="center">시작</th>
			<th width="200" align="center">끝</th>
			<th width="200" align="center">관계 종류</th>
		</tr>
		<tr height="30">
			<td><input type="text" id="start"></td>
			<td><input type="text" id="end"></td>
			<td><select id="relationType">
				<option value="DirectAssociation">DirectAssociation</option>
				<option value="Aggregation">Aggregation</option>
				<option value="Composition">Composition</option>
				<option value="Generalization">Generalization</option>
				<option value="Dependency">Dependency</option>
				<option value="Realization">Realization</option>
			</select></td>
		</tr>
		<tr height="30">
			<td colspan="3" align="center"><button id="connect">연결</button></td>
		</tr>
	
	</table>
	
	
	<div id="list">
	<br>
	<hr>
	<hr>
		<h3>UML List</h3>		
		<br><br><br>
	</div>
	


</body>
</html>