$(function() {
	count = 1;
	count2 = 1;
	var jsonObj = new Object();
	jsonObj.relation = new Array();
	
	
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

	// 삭제
	function deleteRow(obj) {
		document.getElementById('field').removeChild(obj.parentNode);
		count--;
	}
	
	// 저장
	$("#ok").click(function(){
		
	
		
		var tmp1=[];
		var tmp2 =[];
		
		//반복문 시작
		for(var i=0;i<count;i++){
			if($('select').eq(i).val() == 'act'){
					tmp1.push($('input').eq(i).val());			
			}else if($('select').eq(i).val() == 'even'){
					tmp2.push($('input').eq(i).val());
			}
		}//반복문 종료
	
		for(var i=0; i<count2; i++){
			var jsonObjRe = new Object();
			jsonObjRe.start = $('.start').eq(i).val();	
			jsonObjRe.end = $('.end').eq(i).val();
			jsonObjRe.value = $('.value').eq(i).val();		
			jsonObj.relation.push(jsonObjRe);
	
		}
		
		jsonObj.act = tmp1;
		jsonObj.even = tmp2;
		
		
		
		var obj = jsonObj;
		var	str = "actor: "+obj.act+"<br>";
			str += "event: " + obj.even+"<br>";
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
	// -버튼 -> deleteRow()
	$(document).on('click', '#field button', function() {
		deleteRow(this);
	});

	// 저장->save()
	$('#complete').on('click', function() {
	
	});
	
	
});




















