<%@page import="java.util.ArrayList"%>
<%@page import="kosta.model.DB"%>
<%@page import="java.util.List"%>
<%@page import="kosta.model.DBList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>



<script type="text/javascript">
	var attrCount = 0;
	var opCount = 0;
	var check_id = <% request.getParameter("check_id");%>
	$(function(){		
		var jsonArray = new Array(); //UML은 여러개가 나올 수 있으니 배열로 선언		
		
		$("#submit").click(function(){
			var id = $("#check_id").val();
			var jsonObj = new Object(); //한개의 UML객체
			jsonObj.title = $("#title").val(); //UML의 이름
			jsonObj.attribute = new Array(); //UML의 속성은 여러개가 나올 수 있으니 배열
						
			var accessAttrArr = $(".name"); //UML의 attribute의 접근제어자 
			var typeAttrArr = $(".type");  //UML의 attribute의 타입
			var nameAttrArr = $(".key"); //UML의 attribute의 이름
			
			
			for(var i=0; i<attrCount; i++) //전역변수 attrCount로 몇개의 attribute가 생성 되었는지 체크
				{	//생성된 attribute만큼 접근제어자, 타입, 이름을 받아옴
					var attr = new Object();
					attr.name = $(accessAttrArr).eq(i).val();
					attr.type = $(typeAttrArr).eq(i).val();
					attr.key = $(nameAttrArr).eq(i).val()
					
					jsonObj.attribute.push(attr);				
				}			
			
			jsonArray.push(jsonObj); //json배열에 만들어진 한개의 UML을 넣음
			console.log(jsonArray);
			var finalJsonObj = JSON.stringify(jsonObj); //json을 ajax로 보내기 위한 과정
			console.log(finalJsonObj);
			
			$.ajax({
				type : "post",
				url : "data.do?check_id="+id,
				data : {
					json : finalJsonObj
				},
				dataType : "text",				
				success : function(data)
				{
					alert("성공");
					location.reload();
				},
				error : function(data)
				{
					alert("실패");
				}
			})
		});		
		
		$("#addAttr").click(function(){		
			var add = '<div class="attribute"><input type="text" class="name" name="attri"><select class="type" name="type"><option value="varchar2">varchar2</option><option value="number">number</option><option value="date">date</option></select><select class="key" name="key1"><option value=" "></option><option value="PK">PK</option><option value="FK">FK</option><option value="NOTNULL">notnull</option><option value="UNIQUE">unique</option></select><br></div>'
			$("tr:eq(1) td").append(add);			
			attrCount++;				
		});	               
	});
</script>

</head>
<body>
	<input type="hidden" id="check_id" value="${param.check_id }">
	<table border="3" cellpadding="0" cellspacing="0">
		<tr height="80">
			<td width="800" align="center"><input type="text" id="title"></td>
		</tr>
		<tr height="80">
			<td width="800" align="center"></td>
		</tr>
	</table>

	<button id="addAttr">컬럼추가</button>

	<button id="submit">전송</button>

	<c:forEach var="json" items="${jsonList }">
		<hr>
		${json.get("title") }<br>
		--------------<br>
		<c:forEach var="i" items="${json.attribute }">
			${i.get("name")}&nbsp;&nbsp;
			${i.get("type")}&nbsp;&nbsp;
			${i.get("key")}<br>
		</c:forEach>
		<hr>
	</c:forEach>


</body>
</html>