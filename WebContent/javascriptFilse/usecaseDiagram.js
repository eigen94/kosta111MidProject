$(function() {
	count = 1;
	count2 = 1;
	count3=1;
	var jsonObj = new Object();
	//jsonObj.relation = new Array();
	
	
	
	// 콜릭하면 내용을 지운다.
	$('input').on('click', function() {
		$(this).val('');
	});
	// select창 1줄 추가
	function addRow() {
		var span = document.createElement('span');
		span.innerHTML = document.getElementById('item').innerHTML;
		document.getElementById('field').appendChild(span);
		count++;
		$('input').on('click', function() {
			$(this).val('');
		});
	}
	function addRow2() {
		var span2 = document.createElement('span');
		span2.innerHTML = document.getElementById('item2').innerHTML;
		document.getElementById('field2').appendChild(span2);
		count2++;
		$('input').on('click', function() {
			$(this).val('');
		});
	}
	function addRow3() {
		var span3 = document.createElement('span');
		span3.innerHTML = document.getElementById('item3').innerHTML;
		document.getElementById('field3').appendChild(span3);
		count3++;
		$('input').on('click', function() {
			$(this).val('');
		});
	}

	// 삭제
	function deleteRow(obj) {
		document.getElementById('field').removeChild(obj.parentNode);
		count--;
	}
	function deleteRow2(obj) {
		document.getElementById('field2').removeChild(obj.parentNode);
		count--;
	}
	function deleteRow3(obj) {
		document.getElementById('field3').removeChild(obj.parentNode);
		count--;
	}
	
	// 저장
	$("#ok").click(function(){	
		var actArr = new Array();
		var eventArr = new Array();
		var relArr = new Array();
		
		for(var i=0; i<count; i++){
			var jsonObjAct = new Object();
			jsonObjAct.act=$('.act').eq(i).val();
			actArr.push(jsonObjAct);
		}
		jsonObj.act = actArr;
		
		for(var i=0; i<count3; i++){
			var jsonObjEvent = new Object();
			jsonObjEvent.event=$('.event').eq(i).val();
			eventArr.push(jsonObjEvent);
		}
		jsonObj.event = eventArr;

	
		for(var i=0; i<count2; i++){
			var jsonObjRe = new Object();
			jsonObjRe.start = $('.start').eq(i).val();	
			jsonObjRe.end = $('.end').eq(i).val();
			jsonObjRe.value = $('.value').eq(i).val();		
			relArr.push(jsonObjRe);
	
		}
		jsonObj.relation = relArr;
		
	var obj = jsonObj;
	var str=""
		for(var i=0; i<count; i++){
			str += "actor: "+obj.act[i].act+"<br>";
		}
		for(var i=0; i<count3; i++){
			str += "event: " + obj.event[i].event+"<br>";
		}

		for(var j=0; j<count2; j++){	
			str += "Relation start: " +obj.relation[j].start+" end: "+obj.relation[j].end+" value: "+obj.relation[j].value;
		}
		
		$("#list").append(str);
		
	})
	$("#complete").click(function(){
		var finalJsonObj = JSON.stringify(jsonObj);
		console.log(finalJsonObj);
		
		$.ajax({
			type:"post",
			url:"usecaseDiagram.do",
			data:{
				json:finalJsonObj
			},
			dataType: "text",
			success: function(data){
				location.href="usecaseDiagramList.do";
			},error: function(data){
				alert("실패");
			}
		})
	
	})
	// +버튼->addRow()
	$(document).on('click', '#plus_btn button', function() {
		addRow();
	});
	$(document).on('click', '#plus_btn2 button', function() {
		addRow2();
	});
	$(document).on('click', '#plus_btn3 button', function() {
		addRow3();
	});
	// -버튼 -> deleteRow()
	$(document).on('click', '#field button', function() {
		deleteRow(this);
	});
	$(document).on('click', '#field2 button', function() {
		deleteRow(this);
	});
	$(document).on('click', '#field3 button', function() {
		deleteRow(this);
	});	
	
});




















