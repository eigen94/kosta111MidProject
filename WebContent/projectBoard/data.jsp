<%@page import="java.util.ArrayList"%>
<%@page import="kosta.model.DB"%>
<%@page import="java.util.List"%>
<%@page import="kosta.model.DBList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<script src="jquery-1.10.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
=======
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
>>>>>>> branch 'master' of https://github.com/eigen94/kosta111MidProject.git

<script type="text/javascript">
	var attrCount = 0;
<<<<<<< HEAD
	var count=0;
	var row = 0;
	var pkName = "";
	var check_id=0;
=======

>>>>>>> branch 'master' of https://github.com/eigen94/kosta111MidProject.git
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
					
					location.reload();
				},
				error : function(data)
				{
				
				}
			})
		});		
		
		$("#addAttr").click(function(){		
			var add = '<div class="div"><input type="text" class="name" name="attri"><select class="type" name="type"><option value="varchar2">varchar2</option><option value="number">number</option><option value="date">date</option></select><select class="key" name="key1"><option value=" "></option><option value="PK">PK</option><option value="FK">FK</option><option value="NOTNULL">notnull</option><option value="UNIQUE">unique</option></select><br></div>'
			$("tr:eq(1) td").append(add);			
			attrCount++;				
		});
<<<<<<< HEAD
		var title="";
		var getTitle="";
		var accessAttrArr="";
		var typeAttrArr = "";
		var nameAttrArr = "";
		var indexx="";
		var indexy="";
		$(".count").click(function(){
			count=$(this).val();
			check_id=$(this).prevAll(".check_id").val();
			
			row=$(this).next().val();
			title = $(this).prevAll(".title").val();
		
			accessAttrArr =$(this).prevAll(".name"); //UML의 attribute의 접근제어자 
			typeAttrArr = $(this).prevAll(".type");  //UML의 attribute의 타입
			nameAttrArr = $(this).prevAll(".key"); //UML의 attribute의 이름
			
			indexx=$(this).nextAll(".index-x").val();
			indexy=$(this).nextAll(".index-y").val();
		})
		$(".pk").click(function(){
			pkName = $(this).val();
			getTitle = $(this).next().val();
		})
		$("#num").click(function(){
			num = $(this).val();
			
		})
		
		
		$("#link").click(function(){
			var jsonObj = new Object(); //한개의 UML객체
			
			jsonObj.title = title //UML의 이름
			
			jsonObj.attribute = new Array(); //UML의 속성은 여러개가 나올 수 있으니 배열
			
			for(var i=0; i<row; i++) //전역변수 attrCount로 몇개의 attribute가 생성 되었는지 체크
				{	//생성된 attribute만큼 접근제어자, 타입, 이름을 받아옴
					var attr = new Object();
					attr.name = $(accessAttrArr).eq(i).val();
					attr.type = $(typeAttrArr).eq(i).val();
					attr.key = $(nameAttrArr).eq(i).val();
					jsonObj.attribute.push(attr);
				}
			jsonObj.pk = pkName; //UML의 이름
			jsonObj.get = getTitle;
			jsonObj.x = indexx;
			jsonObj.y = indexy;
			jsonArray.push(jsonObj); //json배열에 만들어진 한개의 UML을 넣음
			console.log(jsonArray);
			var finalJsonObj = JSON.stringify(jsonObj); //json을 ajax로 보내기 위한 과정
			console.log(finalJsonObj);
			
			$.ajax({
				type : "post",
				url : "dataLink.do?check_id="+check_id,
				data : {
					json : finalJsonObj
				},
				dataType : "text",				
				success : function(data)
				{
				
					location.reload();
				},
				error : function(data)
				{
					
				} 
			})
		});
		
		var xPos = "";
		var yPos = "";
		var count = 0;
		$('.table').draggable({
			drag : function() {
				var offset = $(this).offset();
				xPos = offset.left;
				yPos = offset.top;
				
			},
			stop:function(){
				count = $(this).children(".check_id").val();
			
				var jsonObj = new Object(); //한개의 UML객체
				
				jsonObj.x = xPos; //UML의 이름
				jsonObj.y = yPos; //UML의 이름
				jsonObj.title = $(this).children(".title").val(); //UML의 이름
				
				jsonObj.attribute = new Array(); //UML의 속성은 여러개가 나올 수 있으니 배열
				
				accessAttrArr =$(this).children(".name"); //UML의 attribute의 접근제어자 
				typeAttrArr = $(this).children(".type");  //UML의 attribute의 타입
				nameAttrArr = $(this).children(".key"); //UML의 attribute의 이름
				row = $(this).children(".row").val();
				
				for(var i=0; i<row; i++) //전역변수 attrCount로 몇개의 attribute가 생성 되었는지 체크
					{	//생성된 attribute만큼 접근제어자, 타입, 이름을 받아옴
						var attr = new Object();
						attr.name = $(accessAttrArr).eq(i).val();
						attr.type = $(typeAttrArr).eq(i).val();
						attr.key = $(nameAttrArr).eq(i).val();
						jsonObj.attribute.push(attr);
					}			
				jsonObj.pk = $(this).children(".fk").val(); //UML의 이름
				jsonObj.get = $(this).children(".for").val();
				
				
				jsonArray.push(jsonObj); //json배열에 만들어진 한개의 UML을 넣음
				/* console.log(jsonArray); */
				var finalJsonObj = JSON.stringify(jsonObj); //json을 ajax로 보내기 위한 과정
				/* console.log(finalJsonObj); */
				
				jsonArray.push(jsonObj); //json배열에 만들어진 한개의 UML을 넣음
				
				var finalJsonObj = JSON.stringify(jsonObj); //json을 ajax로 보내기 위한 과정
				 $.ajax({
					type : "post",
					url : "dataXY.do?check_id="+count,
					data : {
						json : finalJsonObj
					},
					dataType : "text",				
					success : function(data)
					{
						
						//location.reload();
					},
					error : function(data)
					{
						
					} 
				}) 
			}
		});
		
=======
		
		$(".pk").on("click",function(){
			alert($(this).val());
		})
>>>>>>> branch 'master' of https://github.com/eigen94/kosta111MidProject.git
		
	});
	
</script>
<style type="text/css">
<<<<<<< HEAD
	.table{ 
		border : 1px solid;
		width: 400px;
=======
	div{
		display:block;
		border : solid 1px;
		
>>>>>>> branch 'master' of https://github.com/eigen94/kosta111MidProject.git
	}
</style>
</head>
<body>
	<input type="hidden" id="check_id" value="${param.check_id }">
	<table border="3" cellpadding="0" cellspacing="0">
		<tr height="80">
			<td width="400" align="center"><input type="text" id="title"></td>
		</tr>
		<tr height="80">
			<td width="400" align="center"></td>
		</tr>
	</table>

	<button id="addAttr">컬럼추가</button>
	<button id="submit">테이블 생성</button><br>
	<button id="link">조건 걸기</button><br>


	<c:forEach var="json" varStatus="v" items="${jsonList }">
	<div class="table" style="position:absolute; left:${json.get('x')}px; top:${json.get('y')}px; cursor:pointer; cursor:hand; border:1 solid;">
		
		<input type="hidden" class="check_id" value="${idList[v.count-1] }">
		<input type="hidden" class="title" value="${json.get('title')}" >${json.get("title") }<br>

	<button id="submit">전송</button>

	<c:forEach var="json" varStatus="v" items="${jsonList }">
		<div id="div">
		<input type="hidden" id="count" value="${v.count }">
		<input type="hidden" id="c_id" value="${param.check_id }">
		${json.get("title") } &nbsp;&nbsp; <input type="checkbox">
		<br>

		--------------<br>
		<c:forEach var="i" items="${json.attribute }">

	
			<input type="hidden" class="name" value="${i.get('name')}" >${i.get("name")}&nbsp;&nbsp;
			<input type="hidden" class="type" value="${i.get('type')}" >${i.get("type")}&nbsp;&nbsp;
			<input type="hidden" class="key" value="${i.get('key')}" >${i.get("key")}
			<c:if test="${i.get('key') eq 'FK' }">
				<input type="radio" name="fk" class="count" value="${v.count - 1 }">
				<input type="hidden" class="row" value="${fn:length(json.attribute)}">
			</c:if>
			<input type="hidden" class="row" value="${fn:length(json.attribute)}">	
			<c:if test="${i.get('key') eq 'PK' }">
			<div>
				<input type="radio" name="pk" class="pk" value="${i.get('name') }">
				<input type="hidden" class="get" value="${json.get('title')}">
			</div>
			</c:if>
			${i.get("name")}&nbsp;&nbsp;
			${i.get("type")}&nbsp;&nbsp;
			${i.get("key")}
			<c:if test="${i.get('key') eq 'FK'}">
				
			</c:if>
			<c:if test="${i.get('key') eq 'PK' }">
				<input type="checkbox" class="pk" value="">

			</c:if>
			<br>
		</c:forEach>

			참조하는 테이블<br>
			${json.get('get')}(${json.get('pk')})
			<input type="hidden" class="fk" value="${json.get('pk')}">
			<input type="hidden" class="for" value="${json.get('get') }">
			<input type="hidden" class="index-x" value="${json.get('x')}">
			<input type="hidden" class="index-y" value="${json.get('y')}">

		</div>
	</c:forEach>
	</div>
	</c:forEach>


</body>
</html>
