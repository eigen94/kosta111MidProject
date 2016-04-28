$(function(){	
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

	$(".btn-list-add").click(function(){	
		var temp = this;
		listAdd(temp);	
	});//end btn-list-add	
	
	$("#ok").click(function(){
		
		if($("input:radio:checked").val() == "Class")
		{
			console.log("class")
			classAdd();
		}
		else if($("input:radio:checked").val() == "Interface")
		{
			console.log("interface")
			interfaceAdd();
		}
		else
		{	
			console.log("abstract")
			abstractAdd();
		}
	})
	
	$("#connect").click(function(){
		var start = $("#start").val();
		var end = $("#end").val();
		var type = $("#relationType").val();
		var obj;
		
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
	});
	
	var classAdd = function(){
		var obj = umlProcess();
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
		objClick();
		_.each(classes, function(c) {
			graph.addCell(c);
		});
	}

	var interfaceAdd = function(){
		var obj = umlProcess();
		
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
		objClick();
		_.each(classes, function(c) {
			graph.addCell(c);
		});
	}

	var abstractAdd = function(){
		var obj = umlProcess();
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
		objClick();
		
		_.each(classes, function(c) {
			graph.addCell(c);
		});
	}
	
	
	
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
	$("g").click(function(){
		if($(this).children().first().hasClass("element"))
		{
			var $uml = $(this).children().first();
			
			
		}
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

var umlProcess = function(){
	$inputs = $(".text");
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
	
	return obj;
};
