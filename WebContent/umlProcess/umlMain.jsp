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
		var jsonArray = new Array(); //UML�� �������� ���� �� ������ �迭�� ����		
		
		$("#submit").click(function(){
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
			//console.log(jsonArray);
			var finalJsonObj = JSON.stringify(jsonObj); //json�� ajax�� ������ ���� ����
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
					location.href="umlList.do";
				},
				error : function(data)
				{
					alert("����");
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
		
		<tr height="30">
			<td align="center">
				<button id="addAttr">��Ʈ����Ʈ �߰�</button>&nbsp;
				<button id="addOp">���۷��̼� �߰�</button>&nbsp;
				<button id="submit">����</button>
			</td>
		</tr>
	</table>
	
	


</body>
</html>