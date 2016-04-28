<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
<script src="/kosta111MidProject/javascriptFiles/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://jointjs.com/cms/downloads/joint.js"></script>
<link href="http://jointjs.com/cms/downloads/joint.css" rel="stylesheet">


<script type="text/javascript">	

	$(function(){		
		var totalObj = new Object();
		var relationArray = new Array();
		var c = $("#myCanvas");
		var ctx = c.get(0).getContext("2d");
		ctx.beginPath();
		
				
		$("#add").click(function(event){		
			
			$("#list").append($(".table").removeClass("visibility").html());
			//console.log($("table").length)
			var index = $("table").not("#relation").length-1;
			$(".uml").css("z-index",2);
			$(".uml").css("position", "absolute");
			
			$(".addAttr").eq(index).on("click",function(event){		
				
				var add = '<div class="attribute">'+
							'<select class="accessAttr">'+
								'<option value="+">+</option>'+
								'<option value="-">-</option>'+
								'<option value="#">#</option>'+
							'</select>&nbsp;'+						
							'<input type="text" size="10" class="typeAttr">&nbsp;'+
							'<input type="text" size="10" class="nameAttr">'+
						  '</div>'
					$(this).parent().append(add);						  
			});//end addAttr
			
			$(".addOp").eq(index).on("click",function(event){				
				var add = '<div class="operation">'+
							'<select class="accessOp">'+
								'<option value="+">+</option>'+
								'<option value="-">-</option>'+
								'<option value="#">#</option>'+
							'</select>&nbsp;'+
							'<input type="text" size="10" class="typeOp">&nbsp;'+
							'<input type="text" size="10" class="nameOp">&nbsp;'+
							'<input type="text" size="10" class="paraOp">'+
						  '</div>'
					$(this).parent().append(add);				
			});//end addOp
			
			$('table').not("#relation").draggable({
						drag: function() {
							var offset = $(this).offset();
							
							var xPos = parseInt(offset.left);
							var yPos = parseInt(offset.top);
							//$(this).text('x: ' + xPos + 'y: ' + yPos);
						}
					});
			
		});//end add
		
		$("#submit").click(function(){
			var index = $("table").not("#relation").length-1;
			$table = $("table").not($("table").eq(0));
			$table = $table.not($("#relation"));
			//console.log($table);
			
			var umlArray = new Array();
			
			for(var i=0; i<index; i++)
				{
					var jsonObj = new Object(); //한개의 UML객체
					jsonObj.name = $table.eq(i).find(".name").val(); //UML의 이름	
					//console.log(jsonObj.name);
					jsonObj.attribute = new Array(); //UML의 속성은 여러개가 나올 수 있으니 배열
					jsonObj.operation = new Array(); //UML의 오퍼레이션도 여러개
					
					var attrIndex = $table.eq(i).find(".attribute").length;
					var opIndex = $table.eq(i).find(".operation").length;
					
					$operation = $table.eq(i).find(".operation");
					$attribute = $table.eq(i).find(".attribute");
					//console.log(attrIndex);
					for(var j=0; j<attrIndex; j++)
						{
							var attr = new Object();
							attr.access = $attribute.find(".accessAttr").val();
							attr.type =  $attribute.find(".typeAttr").val();
							attr.name = $attribute.find(".nameAttr").val();
							
							jsonObj.attribute.push(attr);
						}
					
					for(var j=0; j<attrIndex; j++)
					{
						var op = new Object();
						op.access = $operation.find(".accessOp").val();
						op.type =  $operation.find(".typeOp").val();
						op.name = $operation.find(".nameOp").val();
						op.para = $operation.find(".paraOp").val();
						
						jsonObj.operation.push(op);
					}
					jsonObj.left = $table.eq(i).css("left");
					jsonObj.top = $table.eq(i).css("top");
					umlArray.push(jsonObj);
				}//end for
				totalObj.uml = umlArray;
				totalObj.relation = relationArray;
				console.log(totalObj);			
		});//end submit
		
		$("#connect").click(function(){
			var index = $(".uml").not($("table:eq(0)")).length;
			$uml = $(".uml").not($("table:eq(0)"));
			console.log($uml);
			
			var relationObj = new Object();
			relationObj.start = $("#start").val();
			relationObj.end = $("#end").val();
			relationObj.relationType = $("#relationType").val();
			
			$("#start").val("");
			$("#end").val("");				
			
			for(var i=0; i<index; i++)
			{
				var startX;
				var startY;
				var startWidth;
				var startHeight;
				
				var endX;
				var endY;
				var endWidth;
				var endHeight;
				
				if($uml.eq(i).find(".name").val() == relationObj.start)
					{							
						startX = ($uml.eq(i).position().left);
						startY = ($uml.eq(i).position().top);
						startWidth = $uml.eq(i).height();
						startHeight = $uml.eq(i).width();
						//ctx.moveTo(startX, startY);
						console.log("startX:"+startX+"  startY:"+startY);	
						console.log("startWidth : "+startWidth+"  startHeight : "+startHeight);
					}
				
				if($uml.eq(i).find(".name").val() == relationObj.end)
					{
						endX = ($uml.eq(i).position().left);
						endY = ($uml.eq(i).position().top);
						endWidth = $uml.eq(i).height();
						endHeight = parseInt($uml.eq(i).css("width").substring(0,$uml.eq(i).css("width").indexOf("p")));
						//ctx.lineTo(endX, endY);
						console.log("endX:"+endX+"  endY:"+endY);
						console.log("endWidth : "+endWidth+"  endHeight : "+endHeight);
						//ctx.stroke();
					}
				
				if(startX < endX)
					{
						console.log("start < end")
						console.log("finalX : "+(startX+startWidth)+" finalY : "+(startY+(startHeight/2)));
						ctx.moveTo(0, 0);
						ctx.lineTo(endX, endY+(endHeight/2));
						ctx.stroke();
					}
				else if(startX > endX)
					{
						console.log("start > end")
						ctx.moveTo(startX, startY+(startHeight/2));
						ctx.lineTo(endX+endWidth, endY+(endHeight/2));
						ctx.stroke();
					}
			}//end for			

			relationArray.push(relationObj);
			console.log(relationArray);
		}); //end connect button
		
		$("#clear").click(function(){
			ctx.clearRect(0, 0, 1800, 1000);
		})
	})//end query

</script>

<style type="text/css">
	#btn
	{
		float : left;
	}
	
	#list
	{
		clear : both;
	}
	
	#relation
	{
		margin-left: 300px;
	}
	
	/* #createZone
	{
		border : solid 3px gray;
		padding : 10px;
		width : 500px;
		height : 300px;
		
	} */

</style>


</head>
</body>
<div class="table" style="display: none; width: 0px; height: 0px;">
	<table class="uml" border="3" cellpadding="0" cellspacing="0">
		<tr height="80">
			<td width="500" align="center"><input type="text" class="name"></td>
		</tr>

		<tr height="80">
			<td width="500" align="center"><button class="addAttr">어트리뷰트 추가</button></td>
		</tr>

		<tr height="80">
			<td width="500" align="center"><button class="addOp">오퍼레이션 추가</button></td>
		</tr>		
	</table>
</div>
<div id="btn">
	<button id="add">추가</button>&nbsp;
	<button id="submit">전송</button>
</div>


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

<br>
<br>
<hr>
<h3>UML list</h3>
<button id="clear">클리어</button>
<div id="list" style="position:relative;">
		
	<canvas id="myCanvas" width="1800px" height="1000px" style="position: absolute; border:1px solid #d3d3d3; z-index:1;"></canvas>
	
</div>

</html>