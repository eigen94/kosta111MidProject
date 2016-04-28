$(function(){
	var graph = new joint.dia.Graph();
	var paper = new joint.dia.Paper({
		el : $('#paper'),
		width : 1500,
		heigth : 500,
		gridSize : 1,
		model : graph
	});
	var usecaseDiagram = joint.shapes.uml;
	
	var useCase = new Array();
	var relations = new Array();
	
	$(".btn-list-add").click(function(){
		var that = this;
		listAdd(that);
	});
	
	var listAdd = function(that){
		var length = $(that).parent().find(".list-item").lenth;
		
		var $add = $(that).next().children().last().clone();
		$add.find("input").val("");
		var str = $add.attr("data-index",length).find(".field").attr("data-field")
				.substring(0,$add.attr("data-index",length).find(".field").attr("data-field").indexOf("/")+1)
		
		$add.attr("data-index",length).find(".field").attr("data-field",(str+length)).find("label")
			.text(str+length).next().attr("data-actor",(str+length));
		
		$(that).parent().find(".list-items").append($add);
		
		/*$add.find(".btn-list-del").on('click', function(){
			$(this).parent.remove();
		})*/
	}
	
	$("#ok").click(function(){
		usecaseAdd();
	})
	
	$("#connect").click(function(){
		var start = $("#start").val();
		var end = $("#end").val();
		var type = $("#relationType").val();
		var obj;
		
		var sourceId;
		var targetId;
		
		console.log(useCase[0].attributes.name==start)
		
		/*for(var i=0; i<useCase.length; i++){
			if(useCase[i].)
		}*/
		
		
	});//end connect 
	
	$(document).on('click', '.btn-list-del', function() {
		//console.log(this);
		deleteRow(this);
	});	

	function deleteRow(obj) {
		//console.log($(obj).parent());
		$(obj).parent().remove();
		//document.getElementById('list-items').removeChild(obj);
	}
	
	var usecaseAdd = function(){
		var obj = usecaseProcess();
		console.log(obj);
		
		
	    var usecaseObj = new usecaseDiagram.Class({
	    	position : {
	    		x : 20,
	    		y : 190
	    	},
	    	size : {
	    		width : 220,
	    		height :100
	    	} ,
	    	actors: obj.actArr,
	    	events: obj.eventArr
	    })
	    useCase.push(usecaseObj);
	    objClick();
	    _.each(useCase,function(c){
	    	graph.addCell(c);
	    });
	}
	
	var objClick = function(){
		$("g").click(function(){
			if($(this).children().first().hasClass("element")){
				var $usecaseDiagram = $(this).children().first();
			}
		})
	}
	
	var usecaseProcess = function(){
		$inputs = $(".text");
		
		var obj = new Object();
		
		var actor = new Array();
		var event = new Array();
		
		var actArr = new Array();
		var evArr = new Array();
		
		for(var i=0; i<$inputs.length; i++){
			if($inputs.eq(i).attr("data-attribute").substring(0,$inputs.eq(i).attr("data-attribute").indexOf("/"))=="actors"){
				var temp = $inputs.eq(i).val();
				actArr.push(temp);
				var actModel = temp.substring(0,temp.length);
				
				var actM = new Object();
				actM.act = actModel;
				
				actor.push(actM);
				console.log(actM);
				
			}else if($inputs.eq(i).attr("data-attribute").substring(0,$inputs.eq(i).attr("data-attribute").indexOf("/"))=="events"){
				var temp = $inputs.eq(i).val();
				evArr.push(temp);
			
				var eventModel = temp.substring(0,temp.length);
				
				var eventM = new Object();
				eventM.event = eventModel;
				
				event.push(eventM);
				console.log(eventM);
			}
			
		
		}// end for
		obj.actor = actor;
		obj.event = event;
		obj.actArr = actArr;
		obj.evArr = evArr;
		
		return obj;
	};
});