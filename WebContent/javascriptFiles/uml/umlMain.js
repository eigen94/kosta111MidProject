var selectedClass;
var checkSelect = false;
$(function(){	

	var relationList = new Array();
	var graph = new joint.dia.Graph();

	var paper = new joint.dia.Paper({
		el : $('#paper'),
		width : 1500,
		height : 500,
		gridSize : 1,
		model : graph
	});
	var uml = joint.shapes.uml;

	var classes = new Array();
	var relations = new Array();

	$("#disselect").click(function(){

		selectedClass = null;
		$("#selectedClass").val("")
	})

	$("#submit").click(function(){
		var total = new Object();

		var classList = $("g .element");
		//var relationList = $("g .link");

		var jsonUmlArray = new Array();		
		var jsonRelationArray = new Array();

		$.each(classList, function(){
			//console.log();
			$textArr = $(this).find("text");
			var classType = "Class";
			var name;
			var attribute = new Array();
			var method = new Array();
			var positionX = $(this).attr("transform").substring($(this).attr("transform").indexOf("(")+1,$(this).attr("transform").indexOf(","));
			var positionY = $(this).attr("transform").substring($(this).attr("transform").indexOf(",")+1, $(this).attr("transform").indexOf(")"));
			//console.log("x : "+positionX+" y : "+positionY);

			$.each($textArr, function(){				

				if($(this).hasClass("uml-class-name-text"))
				{
					var nameArr = $(this).find("tspan");
					var length = nameArr.length;

					if(length == 1)
					{
						name = nameArr.text();
					}
					else
					{
						classType = nameArr.eq(0).text().substring(2,nameArr.eq(0).text().indexOf(">"));
						name = nameArr.eq(1).text();
					}
				}
				else if($(this).hasClass("uml-class-attrs-text"))
				{
					var attr = $(this).find("tspan");
					var length = attr.length;

					for(var i=0; i<length; i++)
					{
						var temp = attr.eq(i).text();
						attribute.push(temp);						
					}
				}
				else if($(this).hasClass("uml-class-methods-text"))
				{
					var met = $(this).find("tspan");
					var length = met.length;

					for(var i=0; i<length; i++)
					{
						var temp = met.eq(i).text();
						method.push(temp);
					}					
				}//end else if


			})//end each
			var jsonObj = new Object();
			jsonObj.classType = classType;
			jsonObj.name = name;
			jsonObj.attribute = attribute;
			jsonObj.method = method;
			jsonObj.positionX = positionX;
			jsonObj.positionY = positionY;

			jsonUmlArray.push(jsonObj);
		})

		/*console.log(jsonUmlArray);
		console.log(relationList);*/

		total.jsonUmlArray = jsonUmlArray;
		total.jsonRelationArray = relationList;
		//console.log(total);


		$.ajax({
			type:"post",
			url:"uml.do",
			data:{
				json:JSON.stringify(total)
			},
			dataType: "text",
			success: function(data){
				$.each($("g .uml"), function(){
					$(this).remove();
				})				
				classes = null;
				classes = new Array();
				relations = null;
				relations = new Array();
				//console.log(total)
			},error: function(data){
				alert("실패");
			}
		})
	})//end submit
	
	$("#load").click(function(){
		$.ajax({
			type:"post",
			url:"umlList.do",
			dataType : 'json',
			success:function(data){
				//console.log(data);
				var umlArray = data.jsonUmlArray;
				console.log(umlArray)
				var relationArray = data.jsonRelationArray;
				
				$.each(umlArray, function(){
					var type = this.classType;
					var name = this.name;
					var attribute = this.attribute;
					//console.log(attribute)
					var method = this.method;
					var positionX = this.positionX;
					var positionY = this.positionY;
					
					if(type == "Interface")
					{
						var obj = umlProcess($(".inspector"));

						var umlObj = new uml.Interface({
							position : {
								x : positionX,
								y : positionY
							},
							size : {
								width : 240,
								height : 100
							},
							name : name,
							attributes : attribute,
							methods : method,
							attrs : {
								'.uml-class-name-rect' : {
									fill : '#feb662',
									stroke : '#ffffff',
									'stroke-width' : 0.5
								},
								'.uml-class-attrs-rect, .uml-class-methods-rect' : {
									fill : '#fdc886',
									stroke : '#fff',
									'stroke-width' : 0.5
								},
								'.uml-class-attrs-text' : {
									ref : '.uml-class-attrs-rect',
									'ref-y' : 0.5,
									'y-alignment' : 'middle'
								},
								'.uml-class-methods-text' : {
									ref : '.uml-class-methods-rect',
									'ref-y' : 0.5,
									'y-alignment' : 'middle'
								}

							}
						});
						classes.push(umlObj);
						clearInspector();

						_.each(classes, function(c) {
							graph.addCell(c);
						});
					}
					else if(type == "Abstract")
					{
						var obj = umlProcess($(".inspector"));
						var umlObj = new uml.Abstract({
							position : {
								x : positionX,
								y : positionY
							},
							size : {
								width : 260,
								height : 100
							},
							name : name,
							attributes : attribute,
							methods : method,
							attrs : {
								'.uml-class-name-rect' : {
									fill : '#68ddd5',
									stroke : '#ffffff',
									'stroke-width' : 0.5
								},
								'.uml-class-attrs-rect, .uml-class-methods-rect' : {
									fill : '#9687fe',
									stroke : '#fff',
									'stroke-width' : 0.5
								},
								'.uml-class-methods-text, .uml-class-attrs-text' : {
									fill : '#fff'
								}
							}
						})
						classes.push(umlObj);
						clearInspector();

						_.each(classes, function(c) {
							graph.addCell(c);
						});
					}
					else if(type == "Class")
					{
						var umlObj = new uml.Class({
							position : {
								x : positionX,
								y : positionY
							},
							size : {
								width : 220,
								height : 100
							},
							name : name,
							attributes : attribute,
							methods : method,
							attrs : {
								'.uml-class-name-rect' : {
									fill : '#ff8450',
									stroke : '#fff',
									'stroke-width' : 0.5,
								},
								'.uml-class-attrs-rect, .uml-class-methods-rect' : {
									fill : '#fe976a',
									stroke : '#fff',
									'stroke-width' : 0.5
								},
								'.uml-class-attrs-text' : {
									ref : '.uml-class-attrs-rect',
									'ref-y' : 0.5,
									'y-alignment' : 'middle'
								},
								'.uml-class-methods-text' : {
									ref : '.uml-class-methods-rect',
									'ref-y' : 0.5,
									'y-alignment' : 'middle'
								}
							}
						})
						classes.push(umlObj);
						clearInspector();

						_.each(classes, function(c) {
							graph.addCell(c);
						});
					}					
				})
				
				$.each(relationArray, function(){
					var sourceId;
					var targetId;	
					var start = this.start;
					var end = this.end;
					var type = this.type;

					for(var i=0; i<classes.length; i++)
					{
						if(classes[i].attributes.name == start)
						{
							sourceId = classes[i].id;					
						}
						if(classes[i].attributes.name == end)
						{
							targetId = classes[i].id;					
						}
					}	
					relationDrawProcess(this.type, this.start, this.end, sourceId, targetId)
				})
			},
			error:function(){
				alert("불러오기 실패");
			}
		
		})
	})

	$(".btn-list-add").click(function(){	
		var temp = this;
		listAdd(temp);	
	});//end btn-list-add	

	$("#ok").click(function(){

		$(selectedClass).remove();

		if($("input:radio:checked").val() == "Class")
		{
			//console.log("class")
			classAdd();
		}
		else if($("input:radio:checked").val() == "Interface")
		{
			//console.log("interface")
			interfaceAdd();
		}
		else
		{	
			//console.log("abstract")
			abstractAdd();
		}		
	})

	$("#connect").click(function(){
		relationDraw();
		$(".relation-container").find("input").val("");
	});

	var relationDraw = function(){
		var start = $("#start").val();
		var end = $("#end").val();
		var type = $("#relationType").val();
		
		var relObj = new Object();
		relObj.start = start;
		relObj.end = end;
		relObj.type = type;
		relationList.push(relObj);

		var sourceId;
		var targetId;			

		for(var i=0; i<classes.length; i++)
		{
			if(classes[i].attributes.name == start)
			{
				sourceId = classes[i].id;					
			}
			if(classes[i].attributes.name == end)
			{
				targetId = classes[i].id;					
			}
		}	
		relationDrawProcess(type,start,end, sourceId, targetId);
	}//relationDraw
	
	var relationDrawProcess = function(type, start, end, sourceId, targetId){
		var obj;
		if(type == "DirectAssociation")
		{
			var linkAttrs =  {
					'fill': 'none',
					'stroke-linejoin': 'round',
					'stroke-width': '2',
					'stroke': '#4b4a67'
			};

			obj = new uml.Transition({
				source: { id: sourceId },
				target: { id: targetId },
				attrs: {'.connection': linkAttrs }
			})
		}

		else if(type == "Aggregation")
		{		
			obj = new uml.Aggregation({
				source : {
					id : sourceId
				},
				target : {
					id : targetId
				}
			});				
		}
		else if(type == "Composition")
		{
			obj = new uml.Composition({
				source : {
					id : sourceId
				},
				target : {
					id : targetId
				}
			});
		}
		else if(type == "Generalization")
		{
			obj = new uml.Generalization({
				source : {
					id : sourceId
				},
				target : {
					id : targetId
				}
			});
		}
		else if(type == "Realization")
		{
			obj = new uml.Implementation({
				source : {
					id : sourceId
				},
				target : {
					id : targetId
				}
			});
		}	

		relations.push(obj);		

		_.each(relations, function(r) {
			graph.addCell(r);
		})
	}

	var classAdd = function(){
		var obj = umlProcess($(".inspector"));
		//console.log(obj);

		var umlObj = new uml.Class({
			position : {
				x : 20,
				y : 190
			},
			size : {
				width : 220,
				height : 100
			},
			name : obj.name,
			attributes : obj.attrArr,
			methods : obj.opArr,
			attrs : {
				'.uml-class-name-rect' : {
					fill : '#ff8450',
					stroke : '#fff',
					'stroke-width' : 0.5,
				},
				'.uml-class-attrs-rect, .uml-class-methods-rect' : {
					fill : '#fe976a',
					stroke : '#fff',
					'stroke-width' : 0.5
				},
				'.uml-class-attrs-text' : {
					ref : '.uml-class-attrs-rect',
					'ref-y' : 0.5,
					'y-alignment' : 'middle'
				},
				'.uml-class-methods-text' : {
					ref : '.uml-class-methods-rect',
					'ref-y' : 0.5,
					'y-alignment' : 'middle'
				}
			}
		})
		classes.push(umlObj);
		clearInspector();
//		objClick();
		_.each(classes, function(c) {
			graph.addCell(c);
		});
	}

	var interfaceAdd = function(){
		var obj = umlProcess($(".inspector"));

		var umlObj = new uml.Interface({
			position : {
				x : 300,
				y : 50
			},
			size : {
				width : 240,
				height : 100
			},
			name : obj.name,
			attributes : obj.attrArr,
			methods : obj.opArr,
			attrs : {
				'.uml-class-name-rect' : {
					fill : '#feb662',
					stroke : '#ffffff',
					'stroke-width' : 0.5
				},
				'.uml-class-attrs-rect, .uml-class-methods-rect' : {
					fill : '#fdc886',
					stroke : '#fff',
					'stroke-width' : 0.5
				},
				'.uml-class-attrs-text' : {
					ref : '.uml-class-attrs-rect',
					'ref-y' : 0.5,
					'y-alignment' : 'middle'
				},
				'.uml-class-methods-text' : {
					ref : '.uml-class-methods-rect',
					'ref-y' : 0.5,
					'y-alignment' : 'middle'
				}

			}
		});
		classes.push(umlObj);
		clearInspector();
//		objClick();
		_.each(classes, function(c) {
			graph.addCell(c);
		});
	}

	var abstractAdd = function(){
		var obj = umlProcess($(".inspector"));
		var umlObj = new uml.Abstract({
			position : {
				x : 300,
				y : 300
			},
			size : {
				width : 260,
				height : 100
			},
			name : obj.name,
			attributes : obj.attrArr,
			methods : obj.opArr,
			attrs : {
				'.uml-class-name-rect' : {
					fill : '#68ddd5',
					stroke : '#ffffff',
					'stroke-width' : 0.5
				},
				'.uml-class-attrs-rect, .uml-class-methods-rect' : {
					fill : '#9687fe',
					stroke : '#fff',
					'stroke-width' : 0.5
				},
				'.uml-class-methods-text, .uml-class-attrs-text' : {
					fill : '#fff'
				}
			}
		})
		classes.push(umlObj);
		clearInspector();
//		objClick();

		_.each(classes, function(c) {
			graph.addCell(c);
		});
	}


	objClick();
});//end query
var listAdd = function(temp){
	var length = $(temp).parent().find(".list-item").length;
	//console.log(length);
	var $add = $(temp).next().children().last().clone();
	$add.find("input").val("");
	var str = $add.attr("data-index",length).find(".field").attr("data-field")
	.substring(0,$add.attr("data-index",length).find(".field").attr("data-field").indexOf("/")+1);

	$add.attr("data-index",length).find(".field").attr("data-field",(str+length))
	.find("label").text(str+length).next().attr("data-attribute",(str+length));

	$add.find(".btn-list-del").click(function(){

		$(this).parent().remove();
	})

	$(temp).parent().find(".list-items").append($add);
}

var objClick = function(){
	//	$("svg .element").on("click",function(event){		
	$("svg").on("click",".element",function(event){	
		selectedClass = this;
		checkSelect = true;
		//console.log($(selectedClass).attr("transform"));
		//console.log("checkSelect : "+checkSelect)
		var classType;
		var name;
		var attribute = new Array();
		var method = new Array();
		var inspector;

		if($(this).hasClass("element"))
		{			
			$textArr = $(this).find("text");

			$.each($textArr, function(index, value){
				if($(this).hasClass("uml-class-name-text"))
				{
					var nameArr = $(this).find("tspan");
					var length = nameArr.length;

					if(length == 1)
					{
						name = nameArr.text();
					}
					else
					{
						classType = nameArr.eq(0).text().substring(2,nameArr.eq(0).text().indexOf(">"));
						name = nameArr.eq(1).text();
					}
				}
				else if($(this).hasClass("uml-class-attrs-text"))
				{
					var attr = $(this).find("tspan");
					var length = attr.length;

					for(var i=0; i<length; i++)
					{
						var temp = attr.eq(i).text();
						attribute.push(temp);						
					}
					var btnArr = $(".btn-list-add");
					for(var j=0; j<btnArr.length; j++)
					{
						if(btnArr.eq(j).parent().attr("data-attribute") == "attributes")
						{
							for(var i=0; i<length-1; i++)
							{
								listAdd(btnArr.eq(j));
							}
						}
					}

				}
				else if($(this).hasClass("uml-class-methods-text"))
				{
					var met = $(this).find("tspan");
					var length = met.length;

					for(var i=0; i<length; i++)
					{
						var temp = met.eq(i).text();
						method.push(temp);
					}

					var btnArr = $(".btn-list-add");
					for(var j=0; j<btnArr.length; j++)
					{
						if(btnArr.eq(j).parent().attr("data-attribute") == "methods")
						{
							for(var i=0; i<length-1; i++)
							{
								listAdd(btnArr.eq(j));
							}
						}
					}
				}//end else if

			})//end each
		}//end if

		inspector = $(".inspector").find(".field");

		$.each( $(".inspector .umlType input"), function(index, value){
			if($(this).val() == classType)
			{	
				//console.log($(this).val() +":"+classType);
				$(this).prop("checked", true);
			}
			else
			{	
				if($(this).val() == "Class")
					$(this).prop("checked", true);
			}

		})
		$.each(inspector, function(index, value){
			if($(this).attr("data-field") == "name")
			{
				$(this).find("input").val(name);
			}
			else if($(this).attr("data-field") == "attributes")
			{
				var arr = $(this).find("input");
				for(var i=0; i<arr.length; i++)
				{
					arr.eq(i).val(attribute[i]);
				}
			}
			else if($(this).attr("data-field") == "methods")
			{
				var arr = $(this).find("input");
				for(var i=0; i<arr.length; i++)
				{
					arr.eq(i).val(method[i]);
				}
			}
		})//end each
		$("#selectedClass").val(name);
		/*console.log("classType : "+classType);
		console.log("name : "+name);
		console.log("attribute : "+attribute);
		console.log("method : "+method);*/
	})
}

var clearInspector = function(){
	$list = $(".list");
	$(".text").val("");
	$("input:radio").attr("checked",false)

	for(var i=0; i<$list.length; i++)
	{
		if($list.eq(i).attr("data-attribute") == "attributes")
		{
			//$list.eq(i).find("input").val("");
			$first = $list.eq(i).find(".list-items").children().first().clone();

			$list.eq(i).find(".list-items").empty();
			$list.eq(i).find(".list-items").append($first);
		}
		else if($list.eq(i).attr("data-attribute") == "methods")
		{
			//$list.eq(i).find("input").val("");
			$first = $list.eq(i).find(".list-items").children().first().clone();

			$list.eq(i).find(".list-items").empty();
			$list.eq(i).find(".list-items").append($first);
		}
	}
}

var umlProcess = function(umlObj){
	$inputs = $(umlObj).find(".text");
	//console.log($inputs)
	var obj = new Object();
	var name;
	var attribute = new Array();
	var method = new Array();

	var attrArr = new Array();
	var opArr = new Array();

	for(var i=0; i<$inputs.length; i++)
	{	//console.log(name);
		if($inputs.eq(i).attr("data-attribute") == "name")
		{
			name = $inputs.eq(i).val();				
		}

		else if($inputs.eq(i).attr("data-attribute").substring(0,$inputs.eq(i).attr("data-attribute").indexOf("/")) == "attributes")
		{
			var temp = $inputs.eq(i).val();
			attrArr.push(temp);
			var access = temp.substring(0,1);
			var n = temp.substring(1,temp.indexOf(":"));
			var type = temp.substring(temp.indexOf(":")+1);
			//console.log("access : "+access+"  type : "+type+"  name : "+name);

			var attr = new Object();
			attr.access = access;
			attr.type = type;
			attr.name = n;

			attribute.push(attr);
			//console.log(attribute);
		}

		else if($inputs.eq(i).attr("data-attribute").substring(0,$inputs.eq(i).attr("data-attribute").indexOf("/")) == "methods")
		{
			var temp = $inputs.eq(i).val();
			opArr.push(temp);
			var n = temp.substring(1, temp.indexOf("("));
			var parameter = new Array();

			var str = temp.substring(temp.indexOf("(")+1, temp.indexOf(")"));
			var paraArr = str.split(","); //array
			//console.log("length : "+paraArr.length)

			for(var j=0; j<paraArr.length; j++)
			{
				var paraEach = new Object();
				paraEach.type = paraArr[j].substring(paraArr[j].indexOf(":")+1);
				paraEach.name = paraArr[j].substring(0,paraArr[j].indexOf(":"));
				parameter.push(paraEach);
			}

			var type = temp.substring(temp.indexOf("):")+1);

			var meth = new Object();
			meth.type = type;
			meth.name = n;
			meth.parameter = parameter;		

			method.push(meth);
			//console.log(method);
		}
	}//end for

	obj.name = name;
	obj.attribute = attribute;
	obj.method = method;
	obj.attrArr = attrArr;
	obj.opArr = opArr;

	//console.log(obj)
	return obj;

};
