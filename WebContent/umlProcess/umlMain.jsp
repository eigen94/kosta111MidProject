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
		var jsonArray = new Array(); //UML�� �������� ���� �� ������ �迭�� ����	
		var relationArray = new Array();
		
		$("#ok").click(function(){
			var jsonObj = new Object(); //�Ѱ��� UML��ü
			jsonObj.name = $("#name").val(); //UML�� �̸�
			jsonObj.attribute = new Array(); //UML�� �Ӽ��� �������� ���� �� ������ �迭
			jsonObj.operation = new Array(); //UML�� ���۷��̼ǵ� ������
						
			var accessAttrArr = $(".accessAttr"); //UML�� attribute�� ���������� 
			var typeAttrArr = $(".typeAttr");  //UML�� attribute�� Ÿ��
			var nameAttrArr = $(".nameAttr"); //UML�� attribute�� �̸�
			
			var accessOpArr = $(".accessOp"); //UML�� ���۷��̼��� ����������
			var typeOpArr = $(".typeOp"); //UML ���۷��̼��� Ÿ��
			var nameOpArr = $(".nameOp"); //UML ���۷��̼��� �̸�
			var paraOpArr = $(".paraOp"); //UML ���۷��̼��� �Ķ����
			
			for(var i=0; i<attrCount; i++) //�������� attrCount�� ��� attribute�� ���� �Ǿ����� üũ
				{	//������ attribute��ŭ ����������, Ÿ��, �̸��� �޾ƿ�
					var attr = new Object();
					attr.access = $(accessAttrArr).eq(i).val();
					attr.type = $(typeAttrArr).eq(i).val();
					attr.name = $(nameAttrArr).eq(i).val()
					
					jsonObj.attribute.push(attr);				
				}			
			
			for(var i=0; i<opCount; i++) //���۷��̼ǵ� ��������
				{
					var op = new Object();
					op.access = $(accessOpArr).eq(i).val();
					op.type = $(typeOpArr).eq(i).val();
					op.name = $(nameOpArr).eq(i).val();
					op.parameter = $(paraOpArr).eq(i).val();
					
					jsonObj.operation.push(op);
				}		
			
			jsonArray.push(jsonObj); //json�迭�� ������� �Ѱ��� UML�� ����			
			
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
					alert("����");
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
<div id="btnSubmit"><button id="submit">����</button></div>
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
				<button id="addAttr">��Ʈ����Ʈ �߰�</button>&nbsp;
				<button id="addOp">���۷��̼� �߰�</button>&nbsp;	
				<button id="ok">�Ϸ�</button>		
			</td>
		</tr>
	</table>
	<br><br>
	<table id="relation" border="2" cellpadding="0" cellspacing="0">
		<tr height="30">
			<th width="200" align="center">����</th>
			<th width="200" align="center">��</th>
			<th width="200" align="center">���� ����</th>
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
			<td colspan="3" align="center"><button id="connect">����</button></td>
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