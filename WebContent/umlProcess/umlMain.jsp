<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="/kosta111MidProject/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
<script src="/kosta111MidProject/javascriptFiles/jquery-ui.min.js"></script>
<script src="/kosta111MidProject/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/kosta111MidProject/javascriptFiles/uml/uml.js"></script>


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